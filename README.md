Data:

#Architecture
Rails as a data-lake (See notes in Performance)
#

#Datasets
https://github.com/nytimes/covid-19-data

#Set-up

* create .env files

##Mysql

Create a new user and password - use if for the environment variable

##Supersets

https://preset.io/blog/2019-12-16-elasticsearch-in-superset/

https://www.alibabacloud.com/help/doc-detail/72706.htm
### Initialize the database
superset db upgrade

### Create an admin user (you will be prompted to set a username, first and last name before setting a password)
$ export FLASK_APP=superset
flask fab create-admin

### Create default roles and permissions
superset init


## Streamsets

## Scheduling jobs

Streamsets + Rails
	vs
Apache Airflow

### Set-up

$ docker exec -it sgstreamsets bash
$ {SDC_DIST}/bin/streamsets stagelibs -install="${SDC_LIBS}"

## Ideas & gotchas & TODOs

https://stackoverflow.com/questions/49963383/authentication-plugin-caching-sha2-password

### Performance

@todo add a worker https://github.com/Molanco/incubator-superset/blob/master/docker-compose.yml
https://pypi.org/project/elasticsearch-dbapi/

ElasticSearch:  https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html

Druid:

### Use a Vault to store credentials

