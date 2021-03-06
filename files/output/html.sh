ASCIIDOCTOR_HTML_OPTIONS=''

if [[ ! -z "${ASCIIDOCTOR_THEME}" ]]; then
  if [[ -f ${ASCIIDOCTOR_HTML_THEME_PATH}/${ASCIIDOCTOR_THEME}.css ]]; then
    ASCIIDOCTOR_HTML_OPTIONS="${ASCIIDOCTOR_HTML_OPTIONS} -a stylesheet=${ASCIIDOCTOR_HTML_THEME_PATH}/${ASCIIDOCTOR_THEME}.css"
  else
    echo "The theme ${ASCIIDOCTOR_HTML_THEME_PATH}/${ASCIIDOCTOR_THEME}.css doesnt exists!"
    exit 0
  fi
fi

asciidoctor -D $ASCIIDOCTOR_OUTPUT_PATH $ASCIIDOCTOR_PLUGIN_OPTIONS $ASCIIDOCTOR_HTML_OPTIONS "${@:2}"