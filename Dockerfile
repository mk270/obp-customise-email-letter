FROM debian

RUN apt-get update
RUN apt-get install make
RUN apt-get install --yes ruby && { gem install mustache || true ; }
RUN apt-get install --yes texlive-xetex
RUN apt-get install --yes wget

WORKDIR /workdir

RUN mkdir -p /usr/local/bin

#RUN wget --quiet -O - https://github.com/jgm/pandoc/releases/download/2.3.1/pandoc-2.3.1-linux.tar.gz | \
#    tar xvzf - --strip-components 1 -C /usr/local

RUN apt-get install --yes pandoc
RUN apt-get install --yes texlive-fonts-extra
RUN apt-get install --yes poppler-utils

RUN wget --quiet -O - /usr/local/bin/md2pdf https://raw.githubusercontent.com/mk270/markdown2pdf/master/md2pdf | sed 's/latex-engine/pdf-engine/' > /usr/local/bin/md2pdf
RUN chmod +x /usr/local/bin/md2pdf


COPY . .

ENTRYPOINT [ "make" ]
