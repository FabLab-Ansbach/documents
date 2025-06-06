#!/bin/bash -e

DOCS=()
TEXDIR=./src
OUTPUT_DIR=./pdf
function fatal(){
  echo "Error occured: $1"
  exit "$2"
}

function read_files(){
  while IFS= read -r filepath; do
    filename=$(basename "$filepath" .tex)
    DOCS+=("$filename")
  done < <(find "$TEXDIR" -type f -name "*.tex")
}

function render_doc(){
  pdflatex "--output-directory=${OUTPUT_DIR}" "${TEXDIR}/$1.tex" > /dev/null || fatal "Could not render $1" 1
  rm "${OUTPUT_DIR}/$1.aux"
  rm "${OUTPUT_DIR}/$1.log"
}

cat <<EOF
▄▖  ▌ ▖   ▌   ▄▖    ▌     ▌       ▖▖  
▙▖▀▌▛▌▌ ▀▌▛▌  ▌▌▛▌▛▘▛▌▀▌▛▘▛▌  █▌  ▌▌  
▌ █▌▙▌▙▖█▌▙▌  ▛▌▌▌▄▌▙▌█▌▙▖▌▌  ▙▖▗ ▚▘▗
---
Document renderer
---
EOF

echo "Looking for documents..."
read_files
echo "Found ${#DOCS[@]} document(s)"

for index in "${!DOCS[@]}"
do
  doc="${DOCS[index]}"
  echo "rendering document $(($index+1)) of ${#DOCS[@]}: $doc"
  render_doc "$doc"
done

echo "Rendered ${#DOCS[@]} document(s)"