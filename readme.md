# Pics Harbour API Docker Image

## Overview
This repository contains the essential files needed to build and run the Docker containers for the **Pics Harbour API**. This robust platform empowers users to publish and manage images with associated metadata, using MySQL and phpMyAdmin for data persistence.

### Repository Contents
- `runApi.js`: Node.js script for starting the API.
- `runApi.sh`: Bash script for Unix-like systems to start the API.
- `docker-compose.yml`: Docker Compose file to orchestrate the container setup.

## Getting Started

### Prerequisites
- **Docker**: Ensure Docker is installed on your machine. [Install Docker](https://docs.docker.com/get-docker/)
- **Node.js**: Required to execute `node runApi.js`. [Install Node.js](https://nodejs.org/en/download/)
- **Git**: Needed to clone and manage the repository. [Install Git](https://git-scm.com/downloads)

### Docker Image Pull, Setup & Configuration
1. **Pull the API Docker image:**
   ```docker pull michelefranciolapilla76/pics_harbour_api```
2. **Clone this repository:**
   ```git clone https://github.com/MicheleFranciolapilla/Pics-Harbour-API-1.0.0---Docker-Configuration.git```

3. **Navigate into the repository directory and execute the appropriate command to run the API:**
    -   ***Using Docker Compose:***
        Set the optional SEED_DB environment variable to control database seeding before running the command:
        -   If you want to seed the database with Admin users:
            ```SEED_DB=true docker-compose up```
            or 
            ```docker-compose up```
        - If you don't want to seed the database with Admin users:
            ```SEED_DB=false docker-compose up```
    -   ***Using scripts:***
        -   To start the API using Node.js:
            -   If you want to seed the database with Admin users:
                ```node runApi.js```
            -   If you don't want to seed the database with Admin users:
                ```node runApi.js noseed```  
        -   To start the API on Unix-like systems:
            ```chmod +x runApi.sh```
            then:
            -   If you want to seed the database with Admin users:
                ```./runApi.sh```
            -   If you don't want to seed the database with Admin users:
                ```./runApi.sh noseed```

    In all cases, the optional parameter `-d` can be used to run the containers in detached mode.
    All users (Admin) loaded into the database by the seeder have the same password: **Dogs&0Bugs**

## Additional Information
- **DockerHub:** For a detailed overview of the API features, user roles, and data management specifics, visit the [Docker repository](https://hub.docker.com/r/michelefranciolapilla76/pics_harbour_api/).
- **Static API Documentation:** The static Swagger-OpenAPI page is available at [Static API documentation](https://michelefranciolapilla.github.io/Pics-Harbour-API-1.0.0---Static-Documentation/).
- **Dynamic API Documentation and testing:** While running the containers, the Swagger-based documentation can be accessed at `/api-docs` endpoint for interactive testing and detailed route information.
- **API Detailed Information endpoints:** Information on API usage and configurations is available through the following endpoints (while containers are running):
    - `/info` - general information.
    - `/info/apiroutes?route[family]=all` - detailed information about all the API routes.
    *(Note: There are more keys and values for the query string than the ones used here)*
    - `/info/apiqueries?queryparam[info]=all` - detailed information about all the accepted queries, for each available route.
    *(Note: There are more values for the query string than the one used here)*

### Support and Feedback
For any inquiries, assistance, or to report bugs related to the Docker setup, please feel free to email at michele.franciolapilla@gmail.com.