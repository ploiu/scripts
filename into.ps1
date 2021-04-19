<#
    .SYNOPSIS
    creates a directory with the passed name, and enters into it

    .DESCRIPTION
    check if a directory with the passed name already exists. If it does, this script 
    displays an error message and exits. Otherwise, the directory is created, and the current location
    is changed to that directory
#>

param(
    [string]$dirName
)

# first check to make sure the directory doesn't exist
if (Test-Path $dirName -PathType Container) {
    Write-Host -ForegroundColor red 'The directory already exists';
    return;
}
else {
    mkdir $dirName;
    Set-Location $dirName;
}