#!/bin/bash
set -e

export SOURCE_PATH='/opt/source'
export ASCIIDOCTOR_THEMES_PATH='/opt/asciidoctor/themes'
export ASCIIDOCTOR_OUTPUT_PATH='/documents/output'

mkdir -p $ASCIIDOCTOR_OUTPUT_PATH

case "$1" in
    html)
      source /usr/local/bin/html-output.sh
      ;;
    pdf)
      source /usr/local/bin/pdf-output.sh
      ;;
    *)
      echo '?'
esac