FROM bitnami/laravel:latest

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . .

RUN composer update --ansi
RUN npm install

RUN cp .env.example .env
RUN php artisan key:generate

RUN chmod +x ./run_script.sh

CMD ["./run_script.sh"]