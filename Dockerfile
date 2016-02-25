FROM reszelaz/leap-systemd

RUN zypper ar -f http://download.opensuse.org/repositories/home:/cmft/openSUSE_Leap_42.1 cmft
RUN zypper --no-gpg-checks refresh cmft

# install:
# the echo command is a workaround for forcing the hostname. see:
#    http://stackoverflow.com/a/28922278
# vim - for easy editing of text files
# xorg-x11-fonts - apparently necessary to run jive
# glibc-locale is necessary for the en_US locale setting (tangosys user needs it)

RUN echo $(grep $(hostname) /etc/hosts | cut -f1) my.host.name >> /etc/hosts && \
    zypper install -y tango-db tango-test tango-java python-sardana vim \
    xorg-x11-fonts glibc-locale

ENV TERM=xterm
ENV USER=root


EXPOSE 10000
