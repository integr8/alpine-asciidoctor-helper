ls -l *.rb

if [[ ! -z "${ASCIIDOCTOR_PLUGIN}" ]]; then
  IFS=',' read -ra PLUGINS <<< "${ASCIIDOCTOR_PLUGIN}"
  for plugin in "${PLUGINS[@]}"; do
      echo $plugin
  done
fi