# 🛠️ Custom Grep + DNS Troubleshooting Project

This repository contains two tasks:

---

## 📄 Task 1: Custom Grep (mygrep.sh)

A Bash script (`mygrep.sh`) that mimics basic `grep` functionality:

- Search for a string (case-insensitive).
- Show matching lines (+ optional line numbers).
- Support options:
  - `-n`: Show line numbers
  - `-v`: Invert match (show non-matching lines)
  - Combine options like `-vn`
- Handles invalid inputs and missing arguments.
- Bonus: `--help` option added.

**Testing Done:**  
Using the provided `testfile.txt`, covering all required scenarios.

---

## 🌐 Task 2: DNS Troubleshooting Scenario

Troubleshooting an unreachable internal web service (`internal.example.com`):

- **Verification:** Compared DNS resolution from `/etc/resolv.conf` and `8.8.8.8`.
- **Diagnosis:** Checked if webserver ports are open and service is reachable.
- **Root Cause Analysis:** Listed all possible causes for DNS/network issues.
- **Fixes Applied:** Fixed DNS, webserver issues, and made local DNS persistent.

**Tools Used:**  
`dig`, `ping`, `curl`, `telnet`, `netstat`, `ss`, `/etc/hosts`, `systemd-resolved`, `NetworkManager`.

---

## 📸 Screenshots

- Script Outputs (mygrep.sh)
- DNS and Network troubleshooting steps
- Applied fixes snapshots

---

## 📂 Project Structure

