export ASCIIDOCTOR_PLUGIN_OPTIONS=''

if [[ ! -z "${ASCIIDOCTOR_PLUGIN}" ]]; then
  IFS=',' read -ra PLUGINS <<< "${ASCIIDOCTOR_PLUGIN}"
  for PLUGIN in "${PLUGINS[@]}"; do
      if [[ -f "$ASCIIDOCTOR_PLUGIN_PATH/lib/$PLUGIN.rb" ]]; then
        ASCIIDOCTOR_PLUGIN_OPTIONS="${ASCIIDOCTOR_PLUGIN_OPTIONS} -r ${ASCIIDOCTOR_PLUGIN_PATH}/lib/${PLUGIN}.rb"
      fi
  done
fi