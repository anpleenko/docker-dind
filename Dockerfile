FROM docker:19.03.6-dind

RUN curl -s https://api.github.com/repos/docker/buildx/releases/latest \
| grep "browser_download_url.*buildx-*.*linux-amd64" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

