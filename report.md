# Troubleshooting Report - internal.example.com Unreachable

---

## Table of Contents
1. [Verify DNS Resolution](#verify-dns-resolution)
2. [Diagnose Service Reachability](#diagnose-service-reachability)
3. [Trace the Issue (List All Possible Causes)](#trace-the-issue)
4. [Propose and Apply Fixes](#propose-and-apply-fixes)
5. [Bonus - Configure Local DNS and Persistence](#bonus---configure-local-dns-and-persistence)

---

## 1. Verify DNS Resolution

- **Description:**
  Checked DNS resolution using `/etc/resolv.conf` default DNS and Google's public DNS (8.8.8.8).

- **Result:**
  - Both returned `NXDOMAIN` for `internal.example.com`.
  - Indicates domain not resolvable.

- **Screenshot:**  
  ![DNS Verification](../verify-DNS/non-existance-domain.png)

- **Analysis:**  
  See [`analysis.txt`](../verify-DNS/analysis.txt)

---

## 2. Diagnose Service Reachability

- **Description:**
  Verified if webserver ports (80/443) are listening.

- **Result:**
  - No services were listening on ports 80/443.

- **Screenshot:**  
  ![Port Check](../diagnose-reachablity/check-ports.png)

- **Analysis:**  
  See [`analysis.txt`](../diagnose-reachablity/analysis.txt)

---

## 3. Trace the Issue

- **Potential Causes:**
  - DNS misconfiguration or missing record.
  - Internal DNS server unreachable.
  - Webserver service not started.
  - Firewall blocking ports.

- **Details:**  
  See [`possible-causes.txt`](../trace-the-isssue/possible-causes.txt)

---

## 4. Propose and Apply Fixes

- **Fixes Applied:**
  - Configured DNS server properly.
  - Edited `/etc/hosts` to temporarily fix resolution.
  - Restarted webserver to listen on required ports.

- **Screenshots:**
  - DNS Server fix: ![DNS Server Fix](../scenario/apply_fixes/configure-DNS-server.png)
  - Hosts fix: ![Hosts Fix](../scenario/apply_fixes/hosts-fixing.png)
  - Webserver fix: ![Webserver Fix](../scenario/apply_fixes/webserver-fixing1.png)

- **Detailed Steps:**  
  See [`description.txt`](../scenario/apply_fixes/description.txt)

---

## 5. Bonus - Configure Local DNS and Persistence

- **Goal:**
  - Configure `/etc/hosts` temporarily.
  - Make DNS settings persistent using `systemd-resolved` or `NetworkManager`.

- **Scripts Provided:**
  - `nm-dns.sh` ➔ Configure via NetworkManager.
  - `systemd-dns.sh` ➔ Configure via systemd-resolved.

- **Screenshots:**
  - systemd-resolved: ![systemd-resolved](../scenario/bonus/bounce-systemd-script.png)
  - NetworkManager: ![NetworkManager bounce](../scenario/bonus/bounce1.png)

- **Description:**  
  See [`description.txt`](../scenario/bonus/description.txt)

---

# Summary

- DNS resolution was failing (NXDOMAIN).
- No service was listening initially.
- After DNS/server fixes, web dashboard became reachable.

✅ **Problem Resolved Successfully.**

---
