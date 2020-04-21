# Architecture
Rails as a data-lake (See notes in Performance)
Streamsets as an ETL/Streaming tool and Job scheduler
Rails as a job scheduler
Superset as a data visualization tool
Docker and Docker-compose orchestes all the containers

## Datasets

This data platform uses the [New York Times](https://github.com/nytimes/covid-19-data) dataset to analyze COVID19 cases at the county level across the US

## Set-up

* There are multiple `.env.example` files in each of the open source tools used by this platform. Go ahead and make a copy of them without the .example extension. Docker compose will use these files to load environment variables into each container.

* Run: `$ docker-compose up`

* There's additional setup for each tool which can be automated later on. Follow the instructions in each section.

## Mysql

* Create a new user and password - use if for the environment variable

## Superset


* Initialize the database `$ superset db upgrade`

* Create an admin user (you will be prompted to set a username, first and last name before setting a password) `$ flask fab create-admin`

* Create default roles and permissions `$ superset init`

## Streamsets

* Download additional needed libraries by exec'ng into the continaer `$ docker exec -it sgstreamsets bash`
* and run `${SDC_DIST}/bin/streamsets stagelibs -install="${SDC_LIBS}"`


## Performance

This platform can handle millions of records in the datalake. However, there are multiple benefits of using a big data storage such as [Druid](https://medium.com/airbnb-engineering/druid-airbnb-data-platform-601c312f2a4c) when  working at Petabyte scale. Additionally [ElasticSearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html) is compatible with (Superset and Streamsets)[https://preset.io/blog/2019-12-16-elasticsearch-in-superset] and is a good fit for holding enourmous amounts of data.

Additional basic performance for Supersets:

* Add a (Superset worker)[https://github.com/Molanco/incubator-superset/blob/master/docker-compose.yml] to help rendering visualizations.

## Security

* Use a Vault to store credentials

### Error handling 

Pipelines in Streamsets can handle error at the pipeline level or stage level. Given that we are assuming NYT data has FIPS and 89 records were ignored while inserting into the database: 

This is what the error at the stage level looks like:

```
 Record1 : ( View Details... )
LIST_MAP

    0 date :
    STRING 2020-03-05

    1 county :
    STRING Unknown

    2 state :
    STRING Rhode Island

    3 fips :
    STRING

    4 cases :
    STRING 2

    5 deaths :
    STRING 0
```

These are stored in the folder /streamsets/errors for later analisis.
## Ideas & gotchas & TODOs

* Mysql version 8 and above has changed their (authentication method)[https://stackoverflow.com/questions/49963383/authentication-plugin-caching-sha2-password]. This platform uses Mysql 5.x but it's recommended to use MariaDB or Postgres.


* @todo make the dashboard public: https://stackoverflow.com/questions/50295010/is-there-a-way-to-create-read-only-dashboard-in-apache-superset


### Scheduling jobs

* Streamsets + Rails
o
* Apache Airflow

### Resources

Counties with FIPS from census data: https://www.census.gov/geographies/reference-files/time-series/geo/gazetteer-files.html 

US population by county (includes FIPS): https://www2.census.gov/programs-surveys/popest/datasets/2010-2019/counties/totals/co-est2019-alldata.csv

Race, etnicity by county (includes FIPS) from American Community Survey 2018 5-year estimates: https://data.census.gov/cedsci/table?q=county%20race%20etnicity&hidePreview=true&tid=ACSDP5Y2018.DP05&vintage=2018&moe=false&g=0100000US.050000


NYT made some teaks some county FIPS which are not accounted in this project. Here's a wayt to handle these edge cases https://www.arcgis.com/home/item.html?id=53935d5d1c8540539d290072fcda77c1


Not used here but popular website to get geolocalization data http://www.datasciencetoolkit.org/	
	https://www.esri.com/arcgis-blog/products/arcgis-pro/3d-gis/how-to-map-new-york-times-coronavirus-time-series-data-in-arcgis-pro/
	https://www.arcgis.com/home/item.html?id=b42b1e3daf96457b804a1246ee3d4a10