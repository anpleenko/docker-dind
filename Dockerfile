FROM docker:19.03.6-dind

RUN mkdir -p ~/.docker/cli-plugins

ADD https://github.com/docker/buildx/releases/download/v0.3.1/buildx-v0.3.1.linux-amd64 ~/.docker/cli-plugins/docker-buildx

RUN chmod a+x ~/.docker/cli-plugins/docker-buildx

# Register Arm executables
RUN docker run --rm --privileged docker/binfmt:820fdd95a9972a5308930a2bdfb8573dd4447ad3
# Register Multiarch executables
RUN docker run --rm --privileged multiarch/qemu-user-static --reset -p yes

# Create builder instance
RUN docker buildx create --name actions_builder --use
