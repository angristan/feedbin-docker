# Feedbin in Docker

Self-host [Feedbin](https://github.com/feedbin/feedbin) with Docker. Feedbin is a web based RSS reader. It's an open-source Ruby on Rails software.

Feedbin's main goal is not to be easily self-hostable, and it was quite hard getting all of the services to work. During the process of creating `feedbin-docker`, I made [a few contributions to the upstream project](https://github.com/feedbin/feedbin/commits?author=angristan) to make it self-hostable ready. Other have taken other approaches by forking it, but all the projects I found on GitHub were abandonned and weren't working anymore.

I chose to run it in Docker because of all the services required to run Feedbin.

Here is a breakdown of all the containers:

* `web`: the puma rails app
* `workers`: some of the sidekiq workers for background processing
* `refresher`: sidekiq worker for refreshing feeds
* `image`: sidekiq worker to find thumbnails
* `camo`: a node reverse proxy to prevent mixed content
* `minio`: object storage for images, favicons, imports
* `redis`: cache, store sidekiq queues and stats
* `memcached`: cache
* `postgresql`: database
* `elasticsearch`: full text search
* `caddy`: https-enabled reverse proxy

As you can see it's a lot. Technically, you can give up on a few of them without breaking Feedbin:

* `image`: you won't have thumbnails, which is not that important depending on your appearance settings.
* `camo`: your browser will make the requests directly to the websites. Less privacy and risk or mixed content.
* `elasticsearch`: you won't have full text search

You can also replace `caddy` with another reverse proxy, but caddy is really handy.

## Setup

I recommend a server with **more than 2 GB of RAM**. Otherwise you will likely have OOM kills.

Clone the repo:

```
git clone https://github.com/angristan/docker-feedbin.git
```

* Copy `.env.example` to `.env` and fill **ALL** the variables
* Copy `docker-compose-example.yml` to `docker-compose.yml`. If you want to disable a service this is the place.
* Copy `caddy/example.Caddyfile` to `caddy/Caddyfile` and update the domains.

Run the database migrations:

```sh
docker-compose run --rm feedbin-web rake db:setup
```

Launch everything:

```sh
docker-compose up -d
```

You can check if everything is going well with `docker-compose logs -f` or `docker-compose ps`.


Go to `minio.feedbin.domain.tld`, login with your keys. Then:

* Create a bucket with the button in the bottom right hand corner.
* Make the bucket public:
  * On the left sidebar, clic on the 3 dots on thee bucket line
  * Select add policy
  * Leave prefix empty (or `*`) and `Read Only` and then select `Add`.

Your bucket is ready.

Now go to `feedbin.domain.tld` and create a new account. You're set!

You can make yourself an admin to manage users and to view the Sidekiq web interface.

To do so, run `docker exec -it feedbin-docker_feedbin-postgres_1 psql -U feedbin feedbin_production`, and enter:

```sql
UPDATE users SET admin=true WHERE id=1
```
