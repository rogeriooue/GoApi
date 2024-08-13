FROM golang:1.22

# Set working directory
WORKDIR /go/src/app

# Copy the source code
COPY . .

# Expose the port
EXPOSE 8000

# Build the app
RUN go build -o main cmd/main.go

# Run the app
CMD ["./main"]
