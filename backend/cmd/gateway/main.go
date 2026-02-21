package main

import (
	"context"
	"fmt"
	"log"
	"net/http"
	"os"
	"strconv"
	"time"

	temperaturev1 "example.com/aufgabe/backend/gen/temperature/v1"
	"google.golang.org/grpc"
)

func main() {
	grpcTarget := os.Getenv("GRPC_TARGET")
	if grpcTarget == "" {
		grpcTarget = "aufgabe1-grpc:50051" // Kubernetes Service DNS
	}

	httpPort := os.Getenv("HTTP_PORT")
	if httpPort == "" {
		httpPort = "8080"
	}

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "text/html; charset=utf-8")
		fmt.Fprint(w, `<!doctype html>
<html>
<head><meta charset="utf-8"><title>Celsius → Kelvin (gRPC)</title></head>
<body style="font-family: sans-serif; max-width: 520px; margin: 40px auto;">
  <h2>Celsius → Kelvin (gRPC)</h2>
  <p>Diese Website ruft intern per <b>gRPC</b> den Temperature-Service auf.</p>
  <form method="GET" action="/convert">
    <label>Celsius:</label>
    <input name="c" type="number" step="0.01" value="25" />
    <button type="submit">Umrechnen</button>
  </form>
</body>
</html>`)
	})

	http.HandleFunc("/convert", func(w http.ResponseWriter, r *http.Request) {
		cStr := r.URL.Query().Get("c")
		c, err := strconv.ParseFloat(cStr, 64)
		if err != nil {
			http.Error(w, "Bitte Zahl als ?c=... angeben", http.StatusBadRequest)
			return
		}

		conn, err := grpc.Dial(grpcTarget, grpc.WithInsecure())
		if err != nil {
			http.Error(w, "gRPC connect error: "+err.Error(), http.StatusInternalServerError)
			return
		}
		defer conn.Close()

		client := temperaturev1.NewTemperatureServiceClient(conn)

		ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
		defer cancel()

		resp, err := client.CelsiusToKelvin(ctx, &temperaturev1.CelsiusToKelvinRequest{Celsius: c})
		if err != nil {
			http.Error(w, "gRPC call error: "+err.Error(), http.StatusInternalServerError)
			return
		}

		w.Header().Set("Content-Type", "text/html; charset=utf-8")
		fmt.Fprintf(w, `<!doctype html>
<html><head><meta charset="utf-8"><title>Result</title></head>
<body style="font-family:sans-serif; max-width:520px; margin:40px auto;">
  <h2>Ergebnis</h2>
  <p><b>%.2f °C</b> = <b>%.2f K</b></p>
  <p><a href="/">zurück</a></p>
</body></html>`, c, resp.Kelvin)
	})

	log.Printf("HTTP Gateway listening on :%s (gRPC target: %s)\n", httpPort, grpcTarget)
	log.Fatal(http.ListenAndServe(":"+httpPort, nil))
}
