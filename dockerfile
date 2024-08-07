# Stage 1: Build the Go application
FROM golang:1.20-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Go source code
COPY main.go .

# Build the Go application
RUN go build -o loadbalancer main.go

# Stage 2: Create a small image with the built binary
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /root/

# Copy the built binary from the builder stage
COPY --from=builder /app/loadbalancer .

# Expose the port on which the load balancer will run
EXPOSE 8000

# Command to run the binary
CMD ["./loadbalancer"]
