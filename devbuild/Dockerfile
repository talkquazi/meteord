FROM abernix/meteord:base
MAINTAINER Chris McCaulley

ARG NODE_VERSION
ENV NODE_VERSION ${NODE_VERSION:-8.9.4}

ONBUILD RUN bash $METEORD_DIR/lib/install_meteor.sh
ONBUILD COPY ./ /app
ONBUILD RUN bash $METEORD_DIR/lib/build_app.sh