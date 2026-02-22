FROM golang:1.23 AS build
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app ./http

FROM gcr.io/distroless/static:nonroot
COPY --from=build /app/app /app
EXPOSE 8080
USER nonroot
ENTRYPOINT ["/app"]
