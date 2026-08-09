FROM ruby:3.3

ARG USERNAME=devcontainer
ARG USER_UID=1000
ARG USER_GID=1000

ENV BUNDLE_PATH=/bundle/vendor \
    BUNDLE_APP_CONFIG=/bundle/config \
    BUNDLE_BIN=/bundle/bin \
    JEKYLL_ENV=development \
    PATH=/bundle/bin:$PATH

RUN groupadd --gid "${USER_GID}" "${USERNAME}" \
  && useradd --uid "${USER_UID}" --gid "${USER_GID}" --create-home "${USERNAME}" \
  && mkdir -p /bundle/vendor /bundle/config /bundle/bin \
  && chown -R "${USERNAME}:${USERNAME}" /bundle

WORKDIR /workspace

CMD ["bash"]
