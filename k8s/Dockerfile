FROM debian

COPY kubed.sh /

RUN chmod +x /kubed.sh

RUN apt-get update \
    && apt-get -y install wget curl

RUN wget --quiet --output-document=./Bluemix_CLI.tar.gz  http://public.dhe.ibm.com/cloud/bluemix/cli/bluemix-cli/latest/Bluemix_CLI_amd64.tar.gz \
    && tar -xvf Bluemix_CLI.tar.gz \
    && rm -f Bluemix_CLI.tar.gz \
    && cd Bluemix_CLI \
    && ./install_bluemix_cli \
    && cd ../ \
    && rm -rf Bluemix_CLI

RUN bluemix plugin install container-service -r Bluemix

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

CMD [ '/bin/bash' '/kubed.sh' ]

