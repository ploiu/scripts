<#
.SYNOPSIS
creates a new git branch and pushes it to origin
#>
param(
    [string]$branchName
)

git switch -c $branchName
git push --set-upstream origin $branchName