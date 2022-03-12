FROM ruby:3.0.2

ARG ALRIDE_UID="1000"

RUN adduser --disabled-password --gecos "AlRide" --uid $ALRIDE_UID alride

COPY . /home/alride/app
RUN chown -R alride:alride /home/alride/app

USER alride
WORKDIR /home/alride/app

RUN gem install bundler:2.3.6
RUN bundle install

VOLUME /home/alride/app/public

EXPOSE 3000

ENV RACK_ENV=production \
    RAILS_SERVE_STATIC_FILES=true \
    RAILS_LOG_TO_STDOUT=true \
    CAP_USER=alride

CMD ["/home/alride/app/docker-cmd.sh"]
