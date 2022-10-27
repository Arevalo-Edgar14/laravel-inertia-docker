docker-compose up -d --build
docker-compose run --rm composer install --optimize-autoloader --no-dev --prefer-dist
docker-compose run --rm npm i

docker-compose -f docker-compose.yml run --publish 5173:5173 --rm npm run build

docker-compose exec corcom-sys php artisan key:generate
docker-compose exec corcom-sys php artisan config:cache
docker-compose exec corcom-sys php artisan route:cache
docker-compose exec corcom-sys php artisan view:cache
docker-compose exec corcom-sys php artisan migrate --seed
