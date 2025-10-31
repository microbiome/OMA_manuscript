FROM docker.io/bioconductor/bioconductor_docker:RELEASE_3_21-R-4.5.1

WORKDIR /project
COPY renv.lock renv.lock

RUN apt-get update && \
    apt-get install -y --no-install-recommends libcurl4-openssl-dev

RUN R -e "install.packages('renv', repos = c(CRAN = 'https://cloud.r-project.org'))"

RUN R -s -e "renv::init(bare = TRUE);renv::restore();renv::isolate()"
