FROM alpine:3.8
LABEL MAINTAINERS="Fábio Luciano <fabio@naoimporta.com>"

ARG ASCIIDOCTOR_VERSION=1.5.8
ARG ASCIIDOCTOR_PDF_VERSION=1.5.0.alpha.16
ARG ASCIIDOCTOR_EPUB_VERSION=1.5.0.alpha.8

ENV ASCIIDOCTOR_VERSION=${ASCIIDOCTOR_VERSION} \
    ASCIIDOCTOR_PDF_VERSION=${ASCIIDOCTOR_PDF_VERSION} \
    ASCIIDOCTOR_EPUB_VERSION=${ASCIIDOCTOR_EPUB_VERSION}

COPY files/*.sh /usr/local/bin/
COPY files/output/*.sh /usr/local/bin/output/

RUN mkdir -p /opt/asciidoctor \
    && apk add --no-cache bash curl findutils font-bakoma-ttf \
        graphviz inotify-tools py2-pillow py-setuptools ttf-ubuntu-font-family \
        python2 ruby ruby-mathematical ttf-liberation unzip which openjdk8-jre \
    && apk add --no-cache --virtual .buildtmp build-base libxml2-dev \
        ruby-dev python2-dev py2-pip make nodejs npm git \
    && gem install --no-rdoc --no-ri "asciidoctor:${ASCIIDOCTOR_VERSION}" \
        asciidoctor-confluence asciidoctor-diagram asciimath \
        asciidoctor-epub3:${ASCIIDOCTOR_EPUB_VERSION} asciidoctor-mathematical \
        "asciidoctor-pdf:${ASCIIDOCTOR_PDF_VERSION}" asciidoctor-revealjs \
        coderay epubcheck:3.0.1 haml kindlegen:3.0.3 pygments.rb rake \
        rouge slim thread_safe tilt bundler \
    && pip install --upgrade pip  &&  pip install --no-cache-dir actdiag \
        'blockdiag[pdf]' nwdiag Pygments seqdiag \
    && git clone https://github.com/asciidoctor/asciidoctor-stylesheet-factory.git asciidoctor-themes \
    && cd asciidoctor-themes && bundle install && npm install cssshrink \
    && ./build-stylesheet.sh && mv stylesheets /opt/asciidoctor/themes \
    && git clone https://github.com/asciidoctor/asciidoctor-extensions-lab /opt/asciidoctor/plugins \
    && apk del -r --no-cache .buildtmp && gem uninstall bundler compass chunky_png fssm sass zurb-foundation && gem cleanup \
    && rm -rf /asciidoctor-themes \
    && chmod +x /usr/local/bin/*.sh

VOLUME /documents
WORKDIR /documents

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
