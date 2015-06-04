FROM l3iggs/archlinux

MAINTAINER Adrian Fedoreanu <adrian.fedoreanu@gmail.com>

RUN pacman -Syyu --needed --noconfirm \
	gcc python2 python2-setuptools python2-pip mysql-python \
	&& rm -f /var/cache/pacman/pkg/*.tar.xz

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY requirements.txt /usr/src/app/
ONBUILD RUN pip2 install -Ur requirements.txt

ONBUILD COPY . /usr/src/app

CMD ["python2"]
