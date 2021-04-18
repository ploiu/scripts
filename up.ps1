<#
    .SYNOPSIS
    traverses up the directory tree n amount of times
#>
param(
    [int]$amount = 1
)
# store the current directory to be used with back.ps1
$global:prevDir = $pwd;
# start with 1 because 0-based indexing will make us go up an extra dir
1..$amount | ForEach-Object {
    Set-Location ..
}