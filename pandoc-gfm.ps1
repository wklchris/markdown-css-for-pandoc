<#
.SYNOPSIS
Convert Markdown file to GitHub Flavored Markdown HTML with pandoc.
Repo: https://github.com/wklchris/markdown-css-for-pandoc

.DESCRIPTION
This script converts a Markdown file to HTML using pandoc with GitHub Flavored Markdown style.
It requires gfm.css and gfm_hl.theme files in the specified repository directory (css_dir).

Examples:

pandoc-gfm.ps1 path/to/input.md
pandoc-gfm.ps1 input.md output.html
pandoc-gfm.ps1 input.md -css_dir path/to/css/folder -use_relpath_css

.PARAMETER in
The input Markdown file path or pattern. Example: input.md, docs/*.md

.PARAMETER out
The output HTML file path. Default to the same filename with the input but with HTML file extension.

.PARAMETER css_dir
The CSS directory to store CSS files. Defaults to current directory.

.PARAMETER repo_dir
The repo directory from which CSS (and theme files) are copied. Defaults to current directory.

.PARAMETER use_relpath_css
By default disabled. The HTML will have `<link rel="gfm.css">` and the CSS will be copied along with the output HTML file.

If `-use_relpath_css` is enabled, the HTML will use the relative path to point the CSS file in the css_dir and the CSS is copied to css_dir from repo_dir. Rendered HTML has `<link rel="relative/path/to/gfm.css">`.
#>

param(
    [Parameter(Mandatory=$true)][string]$in,
    [string]$out='',
    [string]$css_dir='',
    [string]$repo_dir='.',
    [switch]$use_relpath_css
)

# Make path absolute
$original_dir = $PWD.Path
$repo_dir = (Resolve-Path $repo_dir).Path

$is_css_dir_given = -not [string]::IsNullOrEmpty($css_dir)

# Check if required files exist in repo_dir
$css_name = "gfm.css"
$theme_name = "gfm-hl.theme"

$gfm_css_path = Join-Path $repo_dir $css_name
$gfm_hl_theme_path = Join-Path $repo_dir $theme_name

if (-not (Test-Path $gfm_css_path -PathType Leaf)) {
    Write-Error "File $css_name not found in repo folder: $repo_dir"
    exit 1
}

if (-not (Test-Path $gfm_hl_theme_path -PathType Leaf)) {
    Write-Error "File $theme_name not found in repo folder: $repo_dir"
    exit 1
}

# Get all matching input files
$in_files = Get-ChildItem $in -File
if ($in_files.Count -eq 0) {
    Write-Error "No files match the input pattern: $in"
    exit 1
}
if ($in_files.Count -gt 1 -and -not [string]::IsNullOrEmpty($out)) {
    Write-Error "When input matches multiple files, output must be empty for auto-naming"
    exit 1
}

$out_css_dirs = @{}
foreach ($file in $in_files) {
    try {
        # Process each file
        $current_input = $file.FullName
        $current_output = $out
        
        if ([string]::IsNullOrEmpty($current_output)) {
            $current_output = [System.IO.Path]::ChangeExtension($current_input, "html")
        }
        $current_output = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($current_output)
        
        # Ensure output folder exists
        $out_dir = Split-Path $current_output -Parent
        if (-not [string]::IsNullOrEmpty($out_dir) -and -not (Test-Path $out_dir -PathType Container)) {
            New-Item -ItemType Directory -Path $out_dir | Out-Null
        }

        # Proceed CSS storing dir
        if (-not $is_css_dir_given) {
            $css_dir = $out_dir
        }
        $css_dir = (Resolve-Path $css_dir).Path

        # Change directory for the pandoc command
        $in_dir = Split-Path $current_input -Parent
        cd $in_dir

        $css_relative_path = $css_name
        $out_css_path = ''
        if ($use_relpath_css) {
            # Copy CSS to css_dir instead of the output folder
            $out_css_path = Join-Path $css_dir $css_name
            $css_relative_path = [System.IO.Path]::GetRelativePath($out_dir, $out_css_path).Replace("\", "/")
        } else {
            # Otherwise, copy CSS to the HTML output folder
            $out_css_path = Join-Path $out_dir $css_name
            $css_relative_path = $css_name
        }

        # Copy the CSS file if hasn't been updated
        if (-not $out_css_dirs.ContainsKey($out_css_path)) {
            Copy-Item -Path $gfm_css_path -Destination $out_css_path -Force
            $out_css_dirs[$out_css_path] = $true
        }
        
        # Run pandoc command
        pandoc $current_input -s -c $css_relative_path -f gfm --highlight-style $gfm_hl_theme_path --mathjax -o $current_output
        
        Write-Host "HTML saved: $current_output" -Foreground Green
    } catch {
        Write-Error "Error processing file $($file.FullName): $_"
        cd $original_dir
        exit 1
    } finally {
        # Change the directory back after each file
        cd $original_dir
    }
}
