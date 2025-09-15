# Conformance Platform

This project contains the Conformance Platform.

## Clone repos

This project only contains the docker details. It assumes you have cloned the relevant modules into this directory.

## Docker Usage

To run this project using Docker, follow these steps:

1.  **Create a `.env` file:**
    Create a `.env` file in the root of the project and add the following environment variables. These are required by the `backend` service in the `docker-compose.yml` file.

    ```
    SPRING_DATASOURCE_PASSWORD=<your_database_password>
    ```

2.  **Build and run the Docker containers:**
    Open a terminal in the root of the project and run the following command:

    ```
    docker-compose up --build
    ```

    This command will build the Docker images for the `frontend` and `backend` services and start the containers.

3.  **Access the application:**
    Once the containers are running, you can access the application at the following URLs:
    - **Frontend:** [http://localhost:3001](http://localhost:3001)
    - **Backend:** [http://localhost:8080](http://localhost:8080)
