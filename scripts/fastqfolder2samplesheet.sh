#!/usr/bin/env bash
#
# fastqfolder2samplesheet.sh
#
# Generate a samplesheet CSV from FASTQ files.
# CSV header: sample_name,smplidx,label,smplgrp
#
# Rules:
#   - sample_name = basename of FASTQ file without .fastq.gz
#   - smplidx     = first token of sample_name when split on '_'
#   - label       = remainder of sample_name after removing smplidx + '_'
#   - smplgrp     = left empty
#
# Usage:
#   ./fastqfolder2samplesheet.sh <fastq_folder> [output_csv]
#

set -euo pipefail

INPUT_DIR="${1:-fastq_ITS}"
OUTPUT_CSV="${2:-samples.csv}"

if [ ! -d "$INPUT_DIR" ]; then
    echo "ERROR: Input folder '$INPUT_DIR' does not exist." >&2
    exit 1
fi

echo "Creating samplesheet: $OUTPUT_CSV"

# Write header
echo "sample_name,smplidx,label,smplgrp" > "$OUTPUT_CSV"

# Loop through fastq.gz files
for fq in "$INPUT_DIR"/*.fastq.gz; do
    [ -e "$fq" ] || { echo "No .fastq.gz files in $INPUT_DIR" >&2; exit 1; }

    base=$(basename "$fq" .fastq.gz)

    smplidx="${base%%_*}"       # First token before '_'
    label="${base#*_}"          # Everything after first '_'

    echo "${base},${smplidx},${label}," >> "$OUTPUT_CSV"
done

echo "Done. Written $(wc -l < "$OUTPUT_CSV") lines (including header) to $OUTPUT_CSV."

