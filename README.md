@"
# Inactive User Audit

A PowerShell script that identifies enabled user accounts with no logon
activity in 90+ days and exports a timestamped CSV report for security review.

## Purpose

Stale accounts are a key security risk — this script automates the detection
step of an IAM access review or leaver process.

## Run it

\`\`\`powershell
.\Get-InactiveUsers.ps1
\`\`\`

## Output

A timestamped CSV saved to /reports/ listing all inactive enabled accounts.

## Note on Active Directory

The script uses a mock CSV for portability. In a real environment, replace
the Import-Csv line with Get-ADUser - all other logic remains identical.
"@ | Out-File -FilePath ".\README.md" -Encoding UTF8

git add .
git commit -m "Add README"
git push
