FROM ruby:3.0.0
RUN apt-get update -y && apt-get install -y build-essential libpq-dev nodejs sqlite3

ONBUILD COPY app /opt/app
ONBUILD WORKDIR /opt/app

ONBUILD RUN bundle install
ONBUILD RUN
ONBUILD RUN rake db:migrate
ONBUILD RUN rake db:seed

# git clone https://github.com/MiikaViini/railsapp.git app for application
# docker build -t ft-rails:on-build .
# then make Dockerfile of the subject.
# docker build -t ex02 .


# run this in your host terminal:
# echo -e "FROM ft-rails:on-build\nEXPOSE 3000\nCMD [ \"rails\" , \"s\", \"-b\", \"0.0.0.0\", \"-p\", \"3000\"]" >> Dockerfile.rail

# Then build it like so: 
# docker build -f Dockerfile.rails -t ex02


# then docker run -it --rm -p 3000:3000 ex02
# go localhost:3000\tasks with web browser
# there you see todo application
