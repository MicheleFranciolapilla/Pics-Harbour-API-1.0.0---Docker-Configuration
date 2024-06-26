# Pics Harbour API Docker Image

## Overview
This repository contains the essential files needed to build and run the Docker containers for the **Pics Harbour API**.<br>This robust platform empowers users to publish and manage images with associated metadata, using MySQL and phpMyAdmin for data persistence.

### Repository Contents
- `runApi.js`: Node.js script for starting the API.
- `runApi.sh`: Bash script for Unix-like systems to start the API.
- `docker-compose.yml`: Docker Compose file to orchestrate the container setup.

## Getting Started

### Prerequisites
- **Docker**:<br>Ensure Docker is installed on your machine. [Install Docker](https://docs.docker.com/get-docker/)
- **Git**:<br>Needed to clone and manage the repository. [Install Git](https://git-scm.com/downloads)
- **Node.js (optional)**: 
  - Required to run containers by executing `node runApi.js`. [Install Node.js](https://nodejs.org/en/download/)
  - Not necessary if running containers directly with `docker-compose up`

### Docker Image Pull, Setup & Configuration
1. **Pull the API Docker image (optional):**
   ```docker pull michelefranciolapilla76/pics_harbour_api```<br>
   Pulling the image directly is not mandatory as the command `docker-compose up` and start scripts are configured to automatically pull the latest image if it's not already present on your machine.
2. **Clone this repository:**
    - To clone the repository and automatically create a directory with the same name as the repository:<br>
    ```git clone https://github.com/MicheleFranciolapilla/Pics-Harbour-API-1.0.0---Docker-Configuration.git```
    - If you wish to clone the repository in the current directory without creating a new folder:<br>
    ```git clone https://github.com/MicheleFranciolapilla/Pics-Harbour-API-1.0.0---Docker-Configuration.git .``` 
3. **Navigate into the repository directory and execute the appropriate command to run the API:**
    -   ***Best practice to run containers:***
        For the correct procedures to start the containers, please refer to the ***Running the API*** section of the image overview, available at this [link](https://hub.docker.com/repository/docker/michelefranciolapilla76/pics_harbour_api/general).
    -   ***Using Docker Compose:***
        Set the optional SEED_DB environment variable to control database seeding before running the command:
        -   If you want to seed the database with Admin users:
            - ```SEED_DB=true docker-compose up``` (in Unix-based systems)
            - ```$env:SEED_DB="true"; docker-compose up``` (in Windows PowerShell)
            - ```docker-compose up``` (for all systems)
        - If you **don't** want to seed the database with Admin users:
            - ```SEED_DB=false docker-compose up``` (in Unix-based systems)
            - ```$env:SEED_DB="false"; docker-compose up``` (in Windows PowerShell)
    -   ***Using scripts:***
        -   To start the API using Node.js:
            -   If you want to seed the database with Admin users:
                ```node runApi```
            -   If you **don't** want to seed the database with Admin users:
                ```node runApi noseed```  
        -   To start the API on Unix-like systems:
            ```chmod +x runApi.sh```
            then:
            -   If you want to seed the database with Admin users:
                ```./runApi.sh```
            -   If you **don't** want to seed the database with Admin users:
                ```./runApi.sh noseed```

    In all cases, the optional parameter `-d` can be used to run the containers in detached mode.<br>All users (Admin) loaded into the database by the seeder have the same password: **Dogs&0Bugs**
4. **Setup and execution details:**
   The execution of `docker-compose up` or the start scripts will automatically create a directory named *mysqlDocker* in the host folder. This directory contains configuration and initialization scripts for MySQL. You may delete this directory and its contents if it's no longer required after setup.


## Additional Information
- **DockerHub:** For a detailed overview of the API features, user roles, and data management specifics, visit the [Docker repository](https://hub.docker.com/r/michelefranciolapilla76/pics_harbour_api/).
- **Static API Documentation:** The static Swagger-OpenAPI page is available at [Static API documentation](https://michelefranciolapilla.github.io/Pics-Harbour-API-1.0.0---Static-Documentation/).
- **Dynamic API Documentation and API Testing:** While running the containers, the Swagger-based documentation can be accessed at `/api-docs` endpoint for interactive testing and detailed route information.
- **API Detailed Information endpoints:** Information on API usage and configurations is available through the following endpoints (while containers are running):
    - `/info` - general information.
    - `/info/apiroutes?route[family]=all` - detailed information about all the API routes.
    *(Note: There are more keys and values for the query string than the ones used here)*
    - `/info/apiqueries?queryparam[info]=all` - detailed information about all the accepted queries, for each available route.
    *(Note: There are more values for the query string than the one used here)*

### Support and Feedback
For any inquiries, assistance, or to report bugs related to the Docker setup, please feel free to email at michele.franciolapilla@gmail.com.