FROM devkitpro/devkitppc

ENV DKP /opt/devkitpro
ENV PACMAN /opt/devkitpro/pacman/bin/pacman
ENV CMAKE /opt/devkitpro/portlibs/wiiu/bin/powerpc-eabi-cmake

WORKDIR /project

RUN apt-get update && \
    apt-get install -y python3-pip libquadmath0 libquadmath0-ppc64el-cross gcc && \
    pip install cmake --upgrade && \
	${PACMAN} --noconfirm -Syu && \
	${PACMAN} --noconfirm -S wiiu-dev wut && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives /tmp/* /var/tmp/*

COPY . .

CMD export PATH=/opt/devkitpro/portlibs/wiiu/bin:$PATH && \
	cd /project/build && \
	powerpc-eabi-cmake .. && \
    make -j8
