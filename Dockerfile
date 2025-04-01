FROM ruby:3.2
WORKDIR /app
COPY . .
RUN bundle install
CMD ["ruby", "app.rb", "-o", "0.0.0.0"]