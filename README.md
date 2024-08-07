# Go Load Balancer

This repository contains a Go-based load balancer application that distributes traffic across multiple backend services using a round-robin algorithm.

## Features

- **Load Balancing**: Distributes traffic evenly across multiple backend services.
- **Simple Configuration**: Easily configurable to add or remove backend services.
- **Dockerized**: Runs in a Docker container for easy deployment.

## Getting Started

### Prerequisites

- Docker

### Clone the Repository

```sh
https://github.com/jyothiram266/go-load-balancer.git
cd go-load-balancer
```
### Build and Run the Application with Docker
###### Build the Docker image
```sh
docker build -t loadbalancer:latest .
```
### Run the Docker container
```sh
docker run -d -p 8000:8000 loadbalancer:latest
```
### Using Docker Compose
Docker Compose can be used to set up and run the load balancer along with your backend services.

Create a docker-compose.yml file
```yaml
version: '3.8'

services:
  loadbalancer:
    build: .
    ports:
      - "8000:8000"
    depends_on:
      - app1
      - app2
      - app3

  app1:
    image: your-app1-image
    expose:
      - "80"

  app2:
    image: your-app2-image
    expose:
      - "80"

  app3:
    image: your-app3-image
    expose:
      - "80"
```
Replace your-app1-image, your-app2-image, and your-app3-image with the actual images of your backend services.

Run Docker Compose
```sh
docker-compose up --build
```
This command will build the Docker image for the load balancer and start all the defined services.
### Application Configuration
The load balancer forwards requests to the following backend services by default:

- https://www.google.com
- https://www.facebook.com
- https://www.duckduckgo.com
You can modify the backend services in the main.go file:

```go
servers := []Server{
    newSimpleServer("http://app1:80"),
    newSimpleServer("http://app2:80"),
    newSimpleServer("http://app3:80"),
}
```

The main components of the application are:

- Server Interface: Defines methods for a server.
- Simple Server: Implements the Server interface and uses httputil.ReverseProxy to forward requests.
- LoadBalancer: Manages the list of servers and forwards requests using a round-robin algorithm.
- Example Usage

Access the load balancer at http://localhost:8000. The load balancer will forward requests to one of the backend services.

### Contributing
Contributions are welcome! Please submit a pull request or open an issue to discuss improvements or fixes.
