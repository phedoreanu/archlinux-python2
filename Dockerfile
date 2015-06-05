FROM l3iggs/archlinux

MAINTAINER Adrian Fedoreanu <adrian.fedoreanu@gmail.com>

RUN pacman -Syyu --needed --noconfirm \
	gcc \
	python2 \
	python2-pip \
	python2-setuptools \
	mysql-python \
	git \
	&& rm -f /var/cache/pacman/pkg/*.tar.xz

WORKDIR /app

ONBUILD COPY requirements.txt /app/
ONBUILD RUN pip2 install -Ur requirements.txt

ONBUILD COPY . /app

CMD ["python2"]
