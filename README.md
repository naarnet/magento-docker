# Locally deploy Magento projects with Docker Compose

## Getting Started

These instructions will get you a copy of any Magento 2 project up and running on your local machine for development and testing purposes.

### Prerequisites

What things you need to install the software and how to install them

```
docker-compose
docker
git
```

### Installing

A step by step series of examples that tell you how to get a development env running

#### Magento with sample data

1. Choose your PHP Image version in docker-compose-scratch.yml for the containers (phpfpm:7.1, phpfpm:7.2)

2. Choose your Magento version (default is 2.3.0) in the environment variables of the setup container

3. (Optional) Customize your installation by updating any other env variables (M2_BASE_UR, M2SETUP_BASE_URL, M2SETUP_ADMIN_PASSWORD, etc)

4. Edit yout /etc/hosts file and  point your URL to localhost

```
echo "127.0.0.1 <M2_BASE_URL>" >> /etc/hosts
```

5. Move docker-compose-scratch.yml to docker-compose.yml

```
cp docker-compose-scratch.yml docker-compose.yml
```

6. Install Magento (this will install Magento only):

```
docker-compose run --rm setup
```

7. Deploy your stack

```
docker-compose up -d app
docker-compose logs -f
```

5. Your Magento code should be available in your local folder ./www

6. Verify your installation

```
docker-compose exec phpfpm bin/magento
```

#### Existing project

1. Choose por PHP Image version in docker-compose.yml (both setup and phpfpm container definitions)

2. Update the following variables

```
 - <PROYECTO>_codebase:latest
 - <PROYECTO>_db:latest
 - <DB_USER>
 - <URL>:<PUERTO>
 - ANY OTHER ENV VARIABLES YOU MAY WANT TO ADJUST
```

```
docker-compose up -d
```

3. Verify your instalation:

```
docker-compose exec phpfpm bin/magento
```

4. Copy the project files from container to local host:


```
CONTAINER_ID=$(docker-compose ps -q phpfpm)
docker cp $CONTAINER_ID:/srv/www .
```

You should see a new folder ./www in your current location containing Magento files.

5. Stop and delete your appdata container:

```
docker-compose stop appdata
docker-compose rm appdata
```

6. Map your local Magento files to the container so you can edit the files in your host, and changes get replicated to the container.

Uncomment the following line in your docker-compose.yml :

```
# - ./www:/srv/www
```

Recreate your php/appdata containers:

```
docker-compose up -d --remove-orphans phpfpm appdata
```

#### Running the tests

```
docker-compose exec phpfpm bin/magento
docker-compose logs -f
```

#### If anything goes wrong, delete your stack and start over:

```
docker-compose stop && docker-compose rm
rm -rf ./www
```

### Authors

* **Jose Castaneda** - *Initial work* -

