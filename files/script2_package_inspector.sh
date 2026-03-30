#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: [Your Name] | Roll: [Your Roll Number]
# Course: Open Source Software | VITyarthi
# Description: Checks if LibreOffice and related FOSS packages
#              are installed, shows version/license info, and
#              prints a philosophy note using a case statement.
# ============================================================

# --- List of packages to inspect ---
# We check LibreOffice core + 3 related FOSS packages
PACKAGES=("libreoffice" "firefox" "git" "python3")

echo "========================================================"
echo "          FOSS PACKAGE INSPECTOR — Ubuntu/Debian        "
echo "========================================================"
echo ""

# --- Loop through each package and inspect it ---
for PACKAGE in "${PACKAGES[@]}"; do

    echo "[ Checking: $PACKAGE ]"

    # Use dpkg -l to check if the package is installed on Ubuntu/Debian.
    # We redirect stderr to /dev/null to suppress errors for missing packages.
    if dpkg -l "$PACKAGE" &>/dev/null 2>&1 | grep -q "^ii"; then
        # Package IS installed — show version and description
        echo "  Status  : INSTALLED"

        # Extract version using dpkg-query
        VERSION=$(dpkg-query -W -f='${Version}' "$PACKAGE" 2>/dev/null)
        echo "  Version : $VERSION"

        # Extract the short description
        SUMMARY=$(dpkg-query -W -f='${Description}' "$PACKAGE" 2>/dev/null | head -1)
        echo "  Summary : $SUMMARY"

    else
        # Package is NOT installed
        echo "  Status  : NOT INSTALLED"
        echo "  Tip     : Run 'sudo apt install $PACKAGE' to install it."
    fi

    # --- Case statement: Print a FOSS philosophy note per package ---
    # This demonstrates the 'case' shell construct.
    case $PACKAGE in
        libreoffice)
            echo "  Philosophy: LibreOffice — born from a community fork when Oracle"
            echo "              threatened to lock down OpenOffice.org. Proof that"
            echo "              a community can reclaim its own tools."
            ;;
        firefox)
            echo "  Philosophy: Firefox — Mozilla's answer to browser monopoly."
            echo "              A nonprofit fighting to keep the web open and"
            echo "              free from single-vendor control."
            ;;
        git)
            echo "  Philosophy: Git — Linus Torvalds built it in two weeks after"
            echo "              BitKeeper revoked free access. The best tools are"
            echo "              often born from frustration with proprietary ones."
            ;;
        python3)
            echo "  Philosophy: Python — shaped entirely by community consensus."
            echo "              The PSF license ensures it stays free forever,"
            echo "              powering science, AI, and education worldwide."
            ;;
        *)
            # Default case for any unexpected package name
            echo "  Philosophy: An open-source tool — built openly, shared freely."
            ;;
    esac

    echo ""  # Blank line between packages for readability
done

echo "========================================================"
echo "  Inspection complete. All freedoms checked!            "
echo "========================================================"
