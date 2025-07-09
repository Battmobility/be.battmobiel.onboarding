# Environemnt to install flutter and build web
FROM debian:latest AS build-env

# install all needed stuff
RUN apt-get update
RUN apt-get install -y curl git unzip

# define variables
ARG FLUTTER_SDK=/usr/local/flutter
ARG FLUTTER_VERSION=3.32.4
ARG APP=/app/
ARG GITHUB_TOKEN

# Setup Git to use the token to fetch private dependencies
RUN git config --global url."https://${GITHUB_TOKEN}:x-oauth-basic@github.com/".insteadOf "https://github.com/"

#clone flutter
RUN git clone https://github.com/flutter/flutter.git $FLUTTER_SDK
# change dir to current flutter folder and make a checkout to the specific version
RUN cd $FLUTTER_SDK && git fetch && git checkout $FLUTTER_VERSION

# setup the flutter path as an enviromental variable
ENV PATH="$FLUTTER_SDK/bin:$FLUTTER_SDK/bin/cache/dart-sdk/bin:${PATH}"

# Start to run Flutter commands
# doctor to see if all was installes ok
RUN flutter doctor -v

# create folder to copy source code
RUN mkdir $APP
# copy source code to folder
COPY . $APP
# stup new folder as the working directory
WORKDIR $APP/example

# copy the api parameters file from a dummy file
RUN cp lib/api_parameters.dart.dummy lib/api_parameters.dart

# Run build: 1 - clean, 2 - pub get, 3 - build web
RUN flutter clean
RUN flutter pub get
RUN flutter build web

# once heare the app will be compiled and ready to deploy

# use nginx to deploy
FROM nginx:1.25.2-alpine

# copy the info of the builded web app to nginx
COPY --from=build-env /app/example/build/web /usr/share/nginx/html

# Expose and run nginx
EXPOSE 80

# Copy our ENTRYPOINT script into the docker container
COPY ./entrypoint.sh /etc/nginx/entrypoint.sh
# and mark it as executable
RUN chmod +x /etc/nginx/entrypoint.sh

# Start NGINX when the container starts
ENTRYPOINT ["sh", "-c", "/etc/nginx/entrypoint.sh"]