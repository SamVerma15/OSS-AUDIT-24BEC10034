#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: [Your Name] | Roll: [Your Roll Number]
# Course: Open Source Software | VITyarthi
# Description: Loops through key Linux system directories and
#              reports their size, owner, and permissions.
#              Also checks LibreOffice-specific config paths.
# ============================================================

# --- Standard system directories to audit ---
# These are important directories in any Linux filesystem layout
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/lib" "/opt")

echo "========================================================"
echo "       DISK AND PERMISSION AUDITOR — Linux System       "
echo "========================================================"
echo ""

# --- Section 1: System Directory Audit using a for loop ---
echo "[ SYSTEM DIRECTORY REPORT ]"
echo "  Format: Directory => Permissions | Owner | Group | Size"
echo "  --------------------------------------------------------"

for DIR in "${DIRS[@]}"; do
    # Check if the directory actually exists before trying to read it
    if [ -d "$DIR" ]; then
        # Extract permissions, owner, and group using ls and awk
        # ls -ld gives a long listing of the directory itself (not contents)
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')   # e.g. drwxr-xr-x
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')   # e.g. root
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')   # e.g. root

        # du -sh gives human-readable size; 2>/dev/null suppresses permission errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        echo "  $DIR"
        echo "    Permissions : $PERMS"
        echo "    Owner/Group : $OWNER / $GROUP"
        echo "    Disk Usage  : $SIZE"
        echo ""
    else
        # Directory doesn't exist on this system — notify user
        echo "  $DIR => Does not exist on this system."
        echo ""
    fi
done

# --- Section 2: LibreOffice Config Directory Check ---
# LibreOffice stores user config in ~/.config/libreoffice on Ubuntu
echo "========================================================"
echo "[ LIBREOFFICE CONFIGURATION PATHS ]"
echo "  --------------------------------------------------------"

# User-level config (per-user, stored in home directory)
LO_USER_CONFIG="$HOME/.config/libreoffice"

# System-level LibreOffice installation directory
LO_SYSTEM_DIR="/usr/lib/libreoffice"

# System-level config (shared config for all users)
LO_SYSTEM_CONFIG="/etc/libreoffice"

# Array of LibreOffice-specific paths to check
LO_PATHS=("$LO_USER_CONFIG" "$LO_SYSTEM_DIR" "$LO_SYSTEM_CONFIG")

for LO_PATH in "${LO_PATHS[@]}"; do
    if [ -d "$LO_PATH" ]; then
        # Path exists — report its permissions
        LO_PERMS=$(ls -ld "$LO_PATH" | awk '{print $1}')
        LO_OWNER=$(ls -ld "$LO_PATH" | awk '{print $3}')
        LO_SIZE=$(du -sh "$LO_PATH" 2>/dev/null | cut -f1)

        echo "  Path   : $LO_PATH"
        echo "  Perms  : $LO_PERMS | Owner: $LO_OWNER | Size: $LO_SIZE"
        echo "  Status : EXISTS ✔"
        echo ""
    else
        # Path not found — LibreOffice may not be installed or config not created yet
        echo "  Path   : $LO_PATH"
        echo "  Status : NOT FOUND (LibreOffice not installed or not yet launched)"
        echo ""
    fi
done

echo "========================================================"
echo "  Tip: Run 'sudo apt install libreoffice' if not found.  "
echo "========================================================"
