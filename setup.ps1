$WORKING_DIR = Get-Location

$INSTALL_PACKAGE = $args[0]

# Setup NeoVim
Write-Output '--------Setting up NeoVim configuration--------'
if (Test-Path "$env:USERPROFILE\AppData\Local\nvim") {
    Remove-Item "$env:USERPROFILE\AppData\Local\nvim\*" -Force
}
else {
    New-Item -ItemType Directory -Path "$env:USERPROFILE\AppData\Local\nvim" | Out-Null
}

Copy-Item -Recurse .\neovim\* "$env:USERPROFILE\AppData\Local\nvim"
Write-Output 'NeoVim configured'
