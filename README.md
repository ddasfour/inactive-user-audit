# Inactive User Audit

A PowerShell script that identifies enabled user accounts with no logon
activity in 90+ days and exports a timestamped CSV report for security review.

## Purpose
Stale accounts are a key security risk. This script automates the detection
step of an IAM access review or leaver process directly relevant to
joiner/mover/leaver workflows in regulated environments.

## How to run
```powershell
.\Get-InactiveUsers.ps1
```

## Output
A timestamped CSV saved to /reports/ listing all inactive enabled accounts.

## Note on Active Directory
Built using mock CSV data so it runs without an AD server.
In a real environment, replace the Import-Csv line with Get-ADUser —
all other logic remains identical.
