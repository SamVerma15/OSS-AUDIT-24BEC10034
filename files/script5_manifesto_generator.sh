#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator
# Author: [Your Name] | Roll: [Your Roll Number]
# Course: Open Source Software | VITyarthi
# Description: Asks the user 3 interactive questions and
#              generates a personalised FOSS philosophy
#              statement, saved to a .txt file.
# ============================================================

# --- Alias demonstration ---
# Aliases are shortcuts for longer commands. Normally defined in ~/.bashrc
# Here we define one inline for demonstration purposes within this script.
# NOTE: aliases don't work in scripts by default — shown as a concept comment.
# alias show_manifesto='cat manifesto_$(whoami).txt'  # Example alias

# --- Output file name (personalised using current username) ---
OUTPUT="manifesto_$(whoami).txt"

# --- Date for the manifesto header ---
DATE=$(date '+%d %B %Y')

# --- Welcome Banner ---
echo "========================================================"
echo "       OPEN SOURCE MANIFESTO GENERATOR                  "
echo "       A VITyarthi OSS Capstone Tool                    "
echo "========================================================"
echo ""
echo "  Answer three questions to generate your personal"
echo "  open source philosophy statement."
echo ""
echo "--------------------------------------------------------"

# --- Question 1: Daily OSS tool ---
# 'read -p' displays a prompt and waits for user input
read -p "  1. Name one open-source tool you use every day: " TOOL

# --- Question 2: What freedom means to you ---
read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM

# --- Question 3: What they would build and share ---
read -p "  3. Name one thing you would build and share freely: " BUILD

# --- Optional: Ask for their name for personalisation ---
read -p "  4. Your name (for the manifesto): " AUTHOR_NAME

echo ""
echo "  Generating your manifesto..."
echo ""

# --- Compose the manifesto paragraph using string concatenation ---
# We build the text and write it to the output file using > (overwrite)
# Then use >> (append) to add more lines

# Write the header to file (> overwrites any existing file)
echo "========================================================" > "$OUTPUT"
echo "  OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "  Written by: $AUTHOR_NAME" >> "$OUTPUT"
echo "  Date: $DATE" >> "$OUTPUT"
echo "  Generated with: LibreOffice OSS Audit — VITyarthi" >> "$OUTPUT"
echo "========================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Write the personalised philosophy paragraph using the user's answers
# String concatenation happens naturally by referencing variables in echo
echo "  I believe in the power of open source — not as a trend," >> "$OUTPUT"
echo "  but as a philosophy. Every day, I rely on $TOOL," >> "$OUTPUT"
echo "  a tool built by people who chose to share their work freely." >> "$OUTPUT"
echo "  To me, freedom in software means $FREEDOM —" >> "$OUTPUT"
echo "  the ability to read, modify, and redistribute the tools I depend on." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  Open source is not just about saving money. It is about trust." >> "$OUTPUT"
echo "  When the source code is open, anyone can verify what a program does." >> "$OUTPUT"
echo "  No hidden data collection. No secret backdoors. No permission required." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  I am inspired by LibreOffice — software that was forked by a community" >> "$OUTPUT"
echo "  that refused to let a corporation control what they had built together." >> "$OUTPUT"
echo "  That act of forking was not rebellion. It was responsibility." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  If I could build and share one thing freely, it would be $BUILD." >> "$OUTPUT"
echo "  Because the best way to honour the open source movement" >> "$OUTPUT"
echo "  is to contribute back to it." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  — $AUTHOR_NAME | $DATE" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "========================================================" >> "$OUTPUT"

# --- Confirm file was created and display it ---
echo "  ✔ Manifesto saved to: $OUTPUT"
echo ""
echo "========================================================"
echo "[ YOUR MANIFESTO ]"
echo "========================================================"
echo ""

# Display the saved manifesto file on screen
cat "$OUTPUT"

echo ""
echo "========================================================"
echo "  Share it. Fork it. Keep it free.                      "
echo "========================================================"
