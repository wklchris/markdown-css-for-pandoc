<#
.SYNOPSIS
Convert Markdown file to GitHub Flavored Markdown HTML with pandoc.
Repo: https://github.com/wklchris/markdown-css-for-pandoc

.DESCRIPTION
This script converts a Markdown file to HTML using pandoc with GitHub Flavored Markdown style.
It requires gfm.css and gfm_hl.theme files in the specified repository directory (repo_dir).

Examples:

pandoc-gfm.ps1 path/to/input.md
pandoc-gfm.ps1 input.md output.html

.PARAMETER input_file
The input Markdown file path.

.PARAMETER output_file
The output HTML file path. Default to the same filename with the input but with HTML file extension.

The CSS will be copied with the output HTML file.

.PARAMETER repo_dir
The repository directory containing CSS and theme files. Defaults to current directory.
#>

param(
    [Parameter(Mandatory=$true)][string]$input_file,
    [string]$output_file='',
    [string]$repo_dir='.'
)

# Check if required files exist in repo_dir
$css_name = "gfm.css"
$theme_name = "gfm-hl.theme"

$gfm_css_path = Join-Path $repo_dir $css_name
$gfm_hl_theme_path = Join-Path $repo_dir $theme_name

if (-not (Test-Path $gfm_css_path -PathType Leaf)) {
    Write-Error "File $css_name not found in folder: $repo_dir"
    exit 1
}

if (-not (Test-Path $gfm_hl_theme_path -PathType Leaf)) {
    Write-Error "File $theme_name not found in folder: $repo_dir"
    exit 1
}

# Check if input file exists
if (-not (Test-Path $input_file -PathType Leaf)) {
    Write-Error "Input file $input_file does not exist"
    exit 1
}

# Process output filename & Ensure folder exists 
if ([string]::IsNullOrEmpty($output_file)) {
    $output_file = [System.IO.Path]::ChangeExtension($input_file, "html")
}

$output_dir = Split-Path $output_file -Parent
if (-not (Test-Path $output_dir -PathType Container)) {
    New-Item -ItemType Directory -Path $output_dir | Out-Null
}

# Run pandoc command
try {
    pandoc $input_file -s -c $css_name -f gfm --highlight-style $gfm_hl_theme_path --mathjax -o $output_file
    if (-not $?) {
        Write-Error "Pandoc conversion failed"
        exit 1
    }
} catch {
    Write-Error "Error executing pandoc: $_"
    exit 1
}

# Copy CSS file to output directory
try {
    $output_css_path = Join-Path -Path $output_dir -ChildPath $css_name
    Copy-Item -Path $gfm_css_path -Destination $output_css_path -Force
} catch {
    Write-Error "Failed to copy CSS file: $_"
    exit 1
}

Write-Host "HTML Conversion completed: $output_file" -Foreground Green
Write-Host "CSS file $css_name copied along with the output HTML."
