FROM alpine:3.8

LABEL MAINTAINERS="Fábio Luciano <fabio@naoimporta.com>"

ARG ASCIIDOCTOR_VERSION=1.5.8
ARG ASCIIDOCTOR_PDF_VERSION=1.5.0.alpha.16
ARG ASCIIDOCTOR_EPUB_VERSION=1.5.0.alpha.8

ENV ASCIIDOCTOR_VERSION=${ASCIIDOCTOR_VERSION} \
    ASCIIDOCTOR_PDF_VERSION=${ASCIIDOCTOR_PDF_VERSION} \
    ASCIIDOCTOR_EPUB_VERSION=${ASCIIDOCTOR_EPUB_VERSION}

RUN apk add --no-cache bash curl ca-certificates findutils font-bakoma-ttf \
        graphviz inotify-tools openjdk8-jre py2-pillow py-setuptools \
        python2 ruby ruby-mathematical ttf-liberation unzip which \
    && apk add --no-cache --virtual .buildtmp build-base libxml2-dev \
        ruby-dev python2-dev py2-pip make \
    && gem install --no-document "asciidoctor:${ASCIIDOCTOR_VERSION}" \
        asciidoctor-confluence asciidoctor-diagram asciimath \
        asciidoctor-epub3:${ASCIIDOCTOR_EPUB_VERSION} asciidoctor-mathematical \
        "asciidoctor-pdf:${ASCIIDOCTOR_PDF_VERSION}" asciidoctor-revealjs \
        coderay epubcheck:3.0.1 haml kindlegen:3.0.3 pygments.rb rake \
        rouge slim thread_safe tilt \
    && pip install --upgrade pip  &&  pip install --no-cache-dir actdiag \
        'blockdiag[pdf]' nwdiag Pygments seqdiag \
    && apk del -r --no-cache .buildtmp

WORKDIR /documents
VOLUME /documents

CMD ["/bin/bash"]