#!/bin/bash

REPO="sidiqi-lab/devsecops-windows-lab"

echo "Creating Windows Lab issues..."

gh issue create \
  --repo "$REPO" \
  --title "Document Windows filesystem fundamentals" \
  --body "Document NTFS, directories, permissions, environment variables, paths, and common Windows filesystem operations." \
  --milestone "Windows Fundamentals"

gh issue create \
  --repo "$REPO" \
  --title "Create PowerShell administration scripts" \
  --body "Create reusable PowerShell scripts for system information, process management, services, disk usage, and basic administration." \
  --milestone "PowerShell & Automation"

gh issue create \
  --repo "$REPO" \
  --title "Build Windows troubleshooting toolkit" \
  --body "Create a PowerShell troubleshooting toolkit covering processes, services, networking, DNS, ports, and system resources." \
  --milestone "Networking & Troubleshooting"

gh issue create \
  --repo "$REPO" \
  --title "Implement Windows security baseline" \
  --body "Document and automate basic Windows security hardening checks including firewall, services, local accounts, and security configuration." \
  --milestone "Security Hardening"

gh issue create \
  --repo "$REPO" \
  --title "Create Windows CI workflow" \
  --body "Create a GitHub Actions workflow that runs PowerShell validation and automated tests on Windows." \
  --milestone "CI/CD & Integration"

echo "Windows Lab issues created."

