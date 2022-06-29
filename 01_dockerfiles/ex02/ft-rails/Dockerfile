FROM ruby:3.0.0
RUN apt-get update -y && apt-get install -y build-essential libpq-dev nodejs sqlite3

ONBUILD COPY app /opt/app
ONBUILD WORKDIR /opt/app

ONBUILD RUN bundle install
ONBUILD RUN
ONBUILD RUN rake db:migrate
ONBUILD RUN rake db:seed

# git clone https://github.com/learnenough/sample_app_6th_ed.git app
