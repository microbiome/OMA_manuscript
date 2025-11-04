FROM docker.io/bioconductor/bioconductor_docker:RELEASE_3_22-R-4.5.2

WORKDIR /project
COPY DESCRIPTION DESCRIPTION

RUN apt-get update && \
    apt-get install -y libcurl4-openssl-dev pandoc

RUN quarto install tinytex

RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_deps(dependencies = TRUE)"
