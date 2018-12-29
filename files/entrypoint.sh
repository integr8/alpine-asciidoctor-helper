#!/bin/bash
set -e

export SOURCE_PATH='/opt/source'
export ASCIIDOCTOR_THEMES_PATH='/opt/asciidoctor/themes'
export ASCIIDOCTOR_OUTPUT_PATH='/documents'

mkdir -p $ASCIIDOCTOR_OUTPUT_PATH

: ${ASCIIDOCTOR_THEME:='asciidoctor'}

case "$1" in
    html)
        asciidoctor -D ${ASCIIDOCTOR_OUTPUT_PATH} -a stylesheet=${ASCIIDOCTOR_THEMES_PATH}/${ASCIIDOCTOR_THEME}.css "${@:2}"
        ;;
    pdf)
        asciidoctor-pdf -D ${ASCIIDOCTOR_OUTPUT_PATH} "${@:2}"
        ;;
    *)
        echo '?'
esac