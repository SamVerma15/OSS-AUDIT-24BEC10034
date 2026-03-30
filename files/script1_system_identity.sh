#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: [Your Name] | Roll: [Your Roll Number]
# Course: Open Source Software | VITyarthi
# Description: Displays a welcome screen with system info
#              and identifies the OS license (GPL v2 for Linux)
# ============================================================

# --- Student & Project Variables ---
STUDENT_NAME="[Your Name]"         # Replace with your name
ROLL_NUMBER="[Your Roll Number]"   # Replace with your roll number
SOFTWARE_CHOICE="LibreOffice"      # Chosen OSS project

# --- Gather System Information using command substitution ---
KERNEL=$(uname -r)                             # Linux kernel version
DISTRO=$(lsb_release -d | cut -f2-)           # Distro full name (e.g. Ubuntu 22.04)
ARCH=$(uname -m)                               # CPU architecture (x86_64 etc.)
USER_NAME=$(whoami)                            # Currently logged-in user
HOME_DIR=$HOME                                 # User's home directory path
UPTIME=$(uptime -p)                            # Human-readable uptime
CURRENT_DATE=$(date '+%A, %d %B %Y')          # Formatted date
CURRENT_TIME=$(date '+%H:%M:%S')              # Current time (24hr)
HOSTNAME=$(hostname)                           # Machine hostname

# --- OS License Detection ---
# The Linux kernel (which Ubuntu is built on) is licensed under GPL v2.
# LibreOffice itself uses MPL 2.0 (Mozilla Public License).
OS_LICENSE="GNU General Public License v2 (GPL v2)"
LO_LICENSE="Mozilla Public License 2.0 (MPL 2.0)"

# --- Display the System Identity Banner ---
echo "========================================================"
echo "        OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT     "
echo "========================================================"
echo ""
echo "  Student   : $STUDENT_NAME  ($ROLL_NUMBER)"
echo "  Software  : $SOFTWARE_CHOICE"
echo "  Host      : $HOSTNAME"
echo "========================================================"
echo ""

# --- Operating System Section ---
echo "[ OPERATING SYSTEM ]"
echo "  Distribution  : $DISTRO"
echo "  Kernel Version: $KERNEL"
echo "  Architecture  : $ARCH"
echo "  OS License    : $OS_LICENSE"
echo ""

# --- User Session Section ---
echo "[ USER SESSION ]"
echo "  Logged-in User : $USER_NAME"
echo "  Home Directory : $HOME_DIR"
echo ""

# --- System Status Section ---
echo "[ SYSTEM STATUS ]"
echo "  Date & Time    : $CURRENT_DATE at $CURRENT_TIME"
echo "  System Uptime  : $UPTIME"
echo ""

# --- Audited Software Section ---
echo "[ AUDITED SOFTWARE ]"
echo "  Software Name  : $SOFTWARE_CHOICE"
echo "  License        : $LO_LICENSE"
echo "  License Type   : Copyleft (file-level) — modifications to"
echo "                   MPL-covered files must be shared openly,"
echo "                   but can be combined with proprietary code."
echo ""

echo "========================================================"
echo "  Audit environment ready. Linux + LibreOffice = FOSS!  "
echo "========================================================"
