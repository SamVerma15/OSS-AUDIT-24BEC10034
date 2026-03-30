#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: [Your Name] | Roll: [Your Roll Number]
# Course: Open Source Software | VITyarthi
# Description: Reads a log file line by line, counts occurrences
#              of a keyword (default: 'error'), prints a summary,
#              and shows the last 5 matching lines.
# Usage: ./script4_log_analyzer.sh <logfile> [keyword]
# Example: ./script4_log_analyzer.sh /var/log/syslog error
# ============================================================

# --- Command-line Arguments ---
LOGFILE=$1                   # First argument: path to the log file
KEYWORD=${2:-"error"}        # Second argument: keyword to search (default: 'error')

# --- Counter variable to track keyword matches ---
COUNT=0

echo "========================================================"
echo "         LOG FILE ANALYZER — OSS Audit Tool             "
echo "========================================================"
echo ""

# --- Validate that a log file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "  ERROR: No log file specified."
    echo "  Usage: $0 <logfile> [keyword]"
    echo "  Example: $0 /var/log/syslog error"
    exit 1
fi

# --- Retry loop: keep prompting if file is empty or missing ---
# This demonstrates a do-while style loop using while true + break
ATTEMPTS=0
MAX_ATTEMPTS=3

while true; do
    ATTEMPTS=$((ATTEMPTS + 1))

    # Check if the file exists
    if [ ! -f "$LOGFILE" ]; then
        echo "  Attempt $ATTEMPTS/$MAX_ATTEMPTS: File '$LOGFILE' not found."

        # If max attempts reached, exit with error
        if [ "$ATTEMPTS" -ge "$MAX_ATTEMPTS" ]; then
            echo "  ERROR: Could not find log file after $MAX_ATTEMPTS attempts. Exiting."
            exit 1
        fi

        # Ask user to provide a different path and retry
        read -p "  Enter a valid log file path (or press Enter to skip): " NEW_FILE
        if [ -n "$NEW_FILE" ]; then
            LOGFILE="$NEW_FILE"   # Update the log file path with user's input
        else
            echo "  Skipping retry. Exiting."
            exit 1
        fi

    elif [ ! -s "$LOGFILE" ]; then
        # File exists but is empty (size = 0)
        echo "  WARNING: File '$LOGFILE' is empty. Nothing to analyze."
        exit 0

    else
        # File exists and has content — break out of retry loop
        break
    fi
done

echo "  Log File : $LOGFILE"
echo "  Keyword  : '$KEYWORD'"
echo "  --------------------------------------------------------"
echo ""

# --- Main Analysis: Read file line by line using while read loop ---
# IFS= preserves leading/trailing whitespace in each line
# -r flag prevents backslash interpretation
while IFS= read -r LINE; do

    # Check if the current line contains the keyword (case-insensitive with -i flag)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment counter for each matching line
    fi

done < "$LOGFILE"   # Redirect file content into the while loop

# --- Summary Report ---
echo "[ ANALYSIS SUMMARY ]"
echo "  Keyword '$KEYWORD' found in : $COUNT lines"
echo "  Total lines in file         : $(wc -l < "$LOGFILE")"
echo ""

# --- Show last 5 matching lines for context ---
echo "[ LAST 5 LINES CONTAINING '$KEYWORD' ]"
echo "  --------------------------------------------------------"

# Use grep to find all matching lines, then tail to get the last 5
MATCHES=$(grep -i "$KEYWORD" "$LOGFILE" | tail -5)

if [ -n "$MATCHES" ]; then
    # Print each of the last 5 matching lines with a line prefix
    echo "$MATCHES" | while IFS= read -r MATCH_LINE; do
        echo "  >> $MATCH_LINE"
    done
else
    echo "  No matching lines found."
fi

echo ""
echo "========================================================"
echo "  Analysis complete. Logs don't lie — open source does!  "
echo "========================================================"
