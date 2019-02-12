#!/bin/bash
set -e

export ASCIIDOCTOR_HTML_THEME_PATH='/opt/asciidoctor/themes'
export ASCIIDOCTOR_PLUGIN_PATH='/opt/asciidoctor/plugins'
export ASCIIDOCTOR_OUTPUT_PATH='/documents/output'

mkdir -p $ASCIIDOCTOR_OUTPUT_PATH

source /usr/local/bin/plugin-helper.sh

case "$1" in
    html)
      source /usr/local/bin/output/html.sh
      ;;
    pdf)
      source /usr/local/bin/output/pdf.sh
      ;;
    *)
      echo '?'
esac
