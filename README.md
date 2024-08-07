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
git clone https://github.com/your-username/your-repo.git
cd your-repo
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
Application Configuration
The load balancer forwards requests to the following backend services by default:

https://www.google.com
https://www.facebook.com
https://www.duckduckgo.com
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

Contributing
Contributions are welcome! Please submit a pull request or open an issue to discuss improvements or fixes.
