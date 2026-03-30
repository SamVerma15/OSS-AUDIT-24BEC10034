# OSS Audit — LibreOffice
**Student:** [Your Name] | **Roll Number:** [Your Roll Number]
**Course:** Open Source Software | VITyarthi
**Software Audited:** LibreOffice (MPL 2.0)

---

## About This Project
This repository is part of the Open Source Audit Capstone Project for the OSS NGMC course. It contains five shell scripts that demonstrate practical Linux skills while exploring the open-source philosophy behind LibreOffice — a community-forked office suite governed by The Document Foundation.

---

## Scripts Overview

| Script | File | Description |
|--------|------|-------------|
| 1 | `script1_system_identity.sh` | Displays a system welcome screen: kernel, distro, user, uptime, and OS/LibreOffice license info |
| 2 | `script2_package_inspector.sh` | Checks if LibreOffice and 3 other FOSS packages are installed; prints version, summary, and a philosophy note per package using a `case` statement |
| 3 | `script3_disk_permission_auditor.sh` | Audits key Linux directories for size, permissions, owner, and group; also checks LibreOffice-specific config paths |
| 4 | `script4_log_analyzer.sh` | Reads a log file line by line, counts keyword matches, shows last 5 matching lines; supports retry if file is missing |
| 5 | `script5_manifesto_generator.sh` | Interactive script that asks 3 questions and generates a personalised open source philosophy statement saved to a `.txt` file |

---

## Dependencies
- **OS:** Ubuntu 22.04+ or any Debian-based Linux distro
- **Shell:** Bash (pre-installed on Ubuntu)
- **Tools used:** `lsb_release`, `dpkg`, `dpkg-query`, `uname`, `uptime`, `du`, `ls`, `grep`, `awk`, `cut`, `wc`, `date`, `tail`
- All tools are pre-installed on Ubuntu — no additional packages needed to run the scripts

---

## How to Run

### Step 1 — Clone the repository
```bash
git clone https://github.com/[your-username]/oss-audit-[rollnumber].git
cd oss-audit-[rollnumber]
```

### Step 2 — Make all scripts executable
```bash
chmod +x *.sh
```

### Step 3 — Run each script

**Script 1 — System Identity Report**
```bash
./script1_system_identity.sh
```

**Script 2 — FOSS Package Inspector**
```bash
./script2_package_inspector.sh
```

**Script 3 — Disk and Permission Auditor**
```bash
./script3_disk_permission_auditor.sh
```

**Script 4 — Log File Analyzer**
```bash
# Basic usage (searches for 'error' by default)
./script4_log_analyzer.sh /var/log/syslog

# Custom keyword
./script4_log_analyzer.sh /var/log/syslog warning
```

**Script 5 — Open Source Manifesto Generator**
```bash
./script5_manifesto_generator.sh
# Follow the prompts — your manifesto will be saved as manifesto_<username>.txt
```

---

## Installing LibreOffice (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install libreoffice
```

---

## License
These scripts are released under the MIT License — free to use, modify, and share.
