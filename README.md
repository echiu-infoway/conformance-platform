# Conformance Platform

This project contains the Conformance Platform.

## Clone repos

This project only contains the docker details. It assumes you have cloned the relevant modules into this directory.
You can run clone.sh to do this for you.

## Docker Usage

To run this project using Docker, follow these steps:

1.  **Create a `.env` file for docker compose env variables:**
    Create a `.env` file in the root of the project and add the following environment variables. These are required by the `backend` service in the `docker-compose.yml` file.

    ```
    SPRING_DATASOURCE_PASSWORD=<your_database_password>
    ```

1.  **Create a `.env.productdion` file for UI env variables:**
    Create a `.env.production` file in the root of the project and add the following environment variables. These are required by the `backend` service in the `docker-compose.yml` file.

    ```
    VITE_API_BASE_URL=http://localhost:8080/api
    VITE_BYPASS_AUTH=true
    ```

1.  **Build and run the Docker containers:**
    Open a terminal in the root of the project and run the following command:

    ```
    docker-compose up --build
    ```

    This command will build the Docker images for the `frontend` and `backend` services and start the containers.

1.  **Access the application:**
    Once the containers are running, you can access the application at the following URLs:
    - **Frontend:** [http://localhost:3001](http://localhost:3001)
    - **Backend:** [http://localhost:8080](http://localhost:8080)
