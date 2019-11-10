FROM debian:buster

RUN apt-get update
RUN apt-get install -y gnupg curl procps

RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import -
RUN curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -

RUN curl -sSL https://get.rvm.io | bash -s stable --ruby
RUN echo "source /usr/local/rvm/scripts/rvm" >> $HOME/.bashrc

SHELL ["/bin/bash", "-l", "-c"]
WORKDIR /ruby
RUN rvm prepare $(rvm list strings default)
