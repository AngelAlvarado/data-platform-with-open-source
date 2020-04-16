# Architecture
Rails as a data-lake (See notes in Performance)
Streamsets as an ETL/Streaming tool and Job scheduler
Rails as a job scheduler
Superset as a data visualization tool
Docker and Docker-compose orchestes all the containers

## Datasets

This data platform uses the [New York Times](https://github.com/nytimes/covid-19-data
) dataset to analyze COVID19 cases at the county level across the US

## Set-up

* There are multiple `.env.example` files in each of the open source tools used by this platform. Go ahead and make a copy of them without the .example extension. Docker compose will use these files to load environment variables into each container.

* Run: `$ docker-compose up`

* There's additional setup for each tool which can be automated later on. Follow the instructions in each section.

## Mysql

* Create a new user and password - use if for the environment variable

## Supersets


* Initialize the database `$ superset db upgrade`

* Create an admin user (you will be prompted to set a username, first and last name before setting a password) `$ flask fab create-admin`

* Create default roles and permissions `$ superset init`

## Streamsets

* Download additional needed libraries by exec'ng into the continaer `$ docker exec -it sgstreamsets bash`
* and run `$ {SDC_DIST}/bin/streamsets stagelibs -install="${SDC_LIBS}"`


## Performance

This platform can handle millions of records in the datalake. However, there are multiple benefits of using a big data storage such as [Druid](https://medium.com/airbnb-engineering/druid-airbnb-data-platform-601c312f2a4c) when  working at Petabyte scale. Additionally [ElasticSearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html) is compatible with (Superset and Streamsets)[https://preset.io/blog/2019-12-16-elasticsearch-in-superset] and is a good fit for holding enourmous amounts of data.

Additional basic performance for Supersets:

* Add a (Superset worker)[https://github.com/Molanco/incubator-superset/blob/master/docker-compose.yml] to help rendering visualizations.

## Security

* Use a Vault to store credentials


## Ideas & gotchas & TODOs

* Mysql version 8 and above has changed their (authentication method)[https://stackoverflow.com/questions/49963383/authentication-plugin-caching-sha2-password]. This platform uses Mysql 5.x but it's recommended to use MariaDB or Posgrest.

### Scheduling jobs

Streamsets + Rails
	vs
Apache Airflow
