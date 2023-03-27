1. Install vendors

    - composer install
2. Update database credentials in .env file

3. Create the database

    - php bin/console doctrine:database:create

4. Run migrations

    - php bin/console doctrine:migrations:migrate

5. Run the server

    - symfony server:start

6. Run command to retrieve fruits from API

    - php bin/console app:get-fruits-api
