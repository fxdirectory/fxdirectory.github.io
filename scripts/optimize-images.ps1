<#
PowerShell helper to optimize images using ImageMagick (`magick`) if available.

Usage (PowerShell):
  Set-Location \path\to\fxdirectory.github.io
  .\scripts\optimize-images.ps1

This script will create WebP copies for `asset/banner.jpg` and images in `asset/image/`.
Replace files with the WebP versions after verifying quality and file size.
#>

$images = @(
  'asset/banner.jpg'
)

# Add images from asset/image
$imgFolder = 'asset\image'
if (Test-Path $imgFolder) {
  Get-ChildItem -Path $imgFolder -Include *.png,*.jpg,*.jpeg -File | ForEach-Object {
    $images += $_.FullName
  }
}

Write-Host "Found $($images.Count) images to process" -ForegroundColor Cyan

foreach ($img in $images) {
  $out = [System.IO.Path]::ChangeExtension($img, '.webp')
  if (Get-Command magick -ErrorAction SilentlyContinue) {
    Write-Host "Converting $img -> $out"
    magick convert $img -quality 80 $out
  }
  else {
    Write-Warning "ImageMagick not found. Install ImageMagick and re-run to create webp files. Skipping $img"
  }
}

Write-Host "Done. Review generated files before committing." -ForegroundColor Green
