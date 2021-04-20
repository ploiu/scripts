<#
    .SYNOPSIS
    goes down the passed directory tree until there are multiple folders
#>

param(
    [string]$dirName = $pwd
)
# first make sure that dirName is a folder that exists on the path
if(!(Test-Path $dirName -PathType Container)) {
    Write-Host -ForegroundColor red 'That path does not exist.';
} else {
    Set-Location $dirName;
    # keep going down the directory as long as there's only 1 folder to go down
    $directories = Get-ChildItem -Directory;
    while($directories.Length -eq 1) {
        Set-Location $directories[0];
        $directories = Get-ChildItem -Directory;
    }
}