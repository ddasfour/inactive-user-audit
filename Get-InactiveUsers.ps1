<#
.SYNOPSIS
    Finds user accounts inactive for more than 90 days and exports a CSV report.
    In a real environment, replace Import-Csv with Get-ADUser.
#>

$ErrorActionPreference = "Stop"

$daysInactive = 90
$cutoff       = (Get-Date).AddDays(-$daysInactive)
$csvPath      = ".\users.csv"
$reportPath   = ".\reports\inactive-users-$(Get-Date -Format 'yyyyMMdd').csv"

Write-Host "Scanning for accounts inactive since $($cutoff.ToString('dd MMM yyyy'))..." -ForegroundColor Cyan

$users = Import-Csv -Path $csvPath

$inactive = $users | Where-Object {
    $_.Enabled -eq "TRUE" -and (Get-Date $_.LastLogonDate) -lt $cutoff
}

if ($inactive.Count -eq 0) {
    Write-Host "No inactive accounts found." -ForegroundColor Green
    return
}

$inactive | Export-Csv -Path $reportPath -NoTypeInformation

Write-Host "Found $($inactive.Count) inactive account(s):" -ForegroundColor Yellow
$inactive | Format-Table Username, FullName, Department, LastLogonDate -AutoSize
Write-Host "Report saved to: $reportPath" -ForegroundColor Green