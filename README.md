# Cozymeal Case Study

Laravel + Inertia.js + React + Tailwind.
Requires [Docker](https://docs.docker.com/engine/install/) installed.

Start containers with `make up`:

- nginx - `:80`
- mysql - `:3306`
- php - `:9000`
- redis - `:6379`
- mail - `:8025`

Make sure nothing is already running on those ports in your system!

Install once with `make install` (wait till composer & npm finish, may take some time).

Migrate & seed database with `make seed` or only migrate with `make migrate` (if test data not needed).
Seeding will create user *admin@example.com* with password *admin*.

Run tests with `make test`

Run app in dev mode with `make dev`. Build for production with `make prod`. 
Switch between production or local/dev in .env

Stop containers with `make down`

See emails coming through the system, go to [localhost:8025](http://localhost:8025) (with running containers).

### In case of permissions issues

If you are using your server or local environment as the root user:

- Bring any container(s) down with `make down`
- Replace php.dockerfile in the docker-compose.yml with php.root.dockerfile
- Re-build the containers by running `make up`

If you are using your server or local environment as a user that is *not root:*

- Bring any container(s) down with `make down`
- In your terminal, run `export UID=$(id -u)` and then `export GID=$(id -g)`
- If you see any errors about readonly variables from the above step, you can ignore them and continue
- Re-build the containers by running `make up`