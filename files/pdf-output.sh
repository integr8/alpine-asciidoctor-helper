#!/bin/bash

asciidoctor-pdf -D ${ASCIIDOCTOR_OUTPUT_PATH} "${@:2}"