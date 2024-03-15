<#
    .SYNOPSIS
    travels up the directory tree until the passed folder is found, and then enters that folder

    .DESCRIPTION
    starting with the current directory, searches up the directory tree for the folder 
    with the passed name. If it is found, enter into it. If it is not found, (we have hit the root drive),
    we return to the original directory this script was called from
#>
param(
    [string]$targetDir
)
# keep track of the original directory to return to
$origDir = $pwd;
# get the root directory in order to check if we've made it to the top
$rootDir = [System.IO.Path]::GetPathRoot($pwd);
while(!(Test-Path -PathType Container -Path "$targetDir")) {
    # if we're at the root dir, tell the user the path could not be found and return
    if($rootDir -eq $pwd) {
        Write-Host -ForegroundColor red 'Directory not found. Returning';
        Set-Location $origDir;
        return;
        break;
    } else {
        Set-Location ..;
    }
}
# store the original dir for use with back.ps1
$global:prevDir = $origDir;
Set-Location $targetDir