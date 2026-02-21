package main

import (
	"context"
	"log"
	"net"
	"os"

	temperaturev1 "example.com/aufgabe/backend/gen/temperature/v1"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

type server struct {
	temperaturev1.UnimplementedTemperatureServiceServer
}

func (s *server) CelsiusToKelvin(ctx context.Context, req *temperaturev1.CelsiusToKelvinRequest) (*temperaturev1.CelsiusToKelvinResponse, error) {
	c := req.GetCelsius()
	return &temperaturev1.CelsiusToKelvinResponse{Kelvin: c + 273.15}, nil
}

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "50051"
	}

	lis, err := net.Listen("tcp", ":"+port)
	if err != nil {
		log.Fatalf("listen error: %v", err)
	}

	grpcServer := grpc.NewServer()
	reflection.Register(grpcServer)
	temperaturev1.RegisterTemperatureServiceServer(grpcServer, &server{})

	log.Printf("gRPC server listening on :%s\n", port)
	if err := grpcServer.Serve(lis); err != nil {
		log.Fatalf("serve error: %v", err)
	}
}
