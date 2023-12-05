# README

### Versions
* Ruby 3.2.2
* Rails 7.1.2

## Orga²


### Description
Orga² (pronounced ***orga two***) is an application to manage teams and maintenances.

### Installation
* First download the Git project
* Go into the project directory
* Install the Gems
* Create the databases
* Run migrations
* Run the seeds to create the first user
```
git clone https://github.com/SalimBXL/orga².git
cd orga²
bundle install
rails db:create db:migrate db:seed
```

### Configuration
To run correctly the database, you need to configure it by creating an ***.env*** file with all parameters.
```
touch .env
echo "DATABASE_PROD_NAME: orga2-prod" >> .env
echo "DATABASE_DEV_NAME: orga2-dev" >> .env
echo "DATABASE_TEST_NAME: orga2-test" >> .env
echo "DATABASE_PORT: 5432" >> .env
echo "DATABASE_USERNAME: <your-username>" >> .env
echo "DATABASE_PASSWORD: <your-password>" >> .env
```


### Utilisation
To run the server, you have many options.

**Run server in dev mode** 
* In localhost : `rails server`
* Trough the network : `rails server -b <server-ip> -p 3000`

**Run server in production mode**
```
rails server -b <server-ip> -p <your-open-port> -e production
```


### Contributions
<TODO>


### Licence
<TODO>


### Thanks
<TODO>


### Contact
* Github: http://www.github.com/SalimBXL
* Email: <TODO>
* Website: <TODO>


### Badges
<TODO>
`[![Build Status](lien-vers-votre-build-status-badge)](lien-vers-votre-projet)`
