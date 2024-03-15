<#
    .SYNOPSIS
    returns the user to their previous directory when running to.ps1 or up.ps1

    .DESCRIPTION
    sets the current location to the global variable `prevDir`, and sets `prevDir` to the location before calling this command
#>
$origDir = $pwd;
if($null -ne $global:prevDir) {
    Set-Location $global:prevDir;
}
$global:prevDir = $origDir;