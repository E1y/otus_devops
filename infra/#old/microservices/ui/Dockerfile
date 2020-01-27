FROM alpine:3.11

RUN apk update \
&& apk add ruby-full ruby-dev build-base \
&& gem install bundle

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/
RUN bundle update --bundler && bundle install
ADD .  $APP_HOME

ENV POST_SERVICE_HOST post
ENV POST_SERVISE_PORT 5000
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SEVICE_PORT 9292

CMD ["puma"]