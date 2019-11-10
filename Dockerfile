FROM debian:buster

RUN apt-get update
RUN apt-get install -y gnupg curl procps sudo

ARG USER=leighmcculloch
ENV HOME=/home/$USER
RUN adduser --home $HOME --disabled-password --gecos GECOS $USER \
  && echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER \
  && chmod 0440 /etc/sudoers.d/$USER
USER $USER
ENV HOME=/home/$USER


USER $USER
WORKDIR $HOME
SHELL ["/bin/bash", "-l", "-c"]

RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import -
RUN curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
RUN curl -sSL https://get.rvm.io | bash -s stable --ruby
RUN echo "source /usr/local/rvm/scripts/rvm" >> $HOME/.bashrc

RUN mkdir -p $HOME/ruby
RUN cd ruby && rvm prepare $(rvm list strings default)
