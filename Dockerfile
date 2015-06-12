FROM greyltc/archlinux

MAINTAINER Adrian Fedoreanu <adrian.fedoreanu@gmail.com>

RUN pacman -Syyu --needed --noconfirm \
	gcc \
	python2 \
	python2-pip \
	python2-setuptools \
	python2-babel \
	python2-pillow \
	python2-pytz \
	python2-six \
	python-requests \
	mysql-python \
	supervisor \
	libjpeg-turbo \
	libpng \
	&& rm -f /var/cache/pacman/pkg/*.tar.xz

WORKDIR /app

ONBUILD COPY requirements.txt /app/
ONBUILD RUN pip2 install -Ur requirements.txt

ONBUILD COPY . /app

CMD ["python2"]
