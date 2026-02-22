package main

import (
	"encoding/json"
	"log"
	"net/http"
)

type ConvertRequest struct {
	Celsius *float64 `json:"celsius,omitempty"`
	Kelvin  *float64 `json:"kelvin,omitempty"`
}

type ConvertResponse struct {
	Celsius float64 `json:"celsius"`
	Kelvin  float64 `json:"kelvin"`
}

func main() {
	mux := http.NewServeMux()

	mux.HandleFunc("/healthz", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		w.Write([]byte("ok"))
	})

	mux.HandleFunc("/convert", func(w http.ResponseWriter, r *http.Request) {
		if r.Method != http.MethodPost {
			http.Error(w, "POST required", http.StatusMethodNotAllowed)
			return
		}

		var req ConvertRequest
		if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
			http.Error(w, "invalid json", http.StatusBadRequest)
			return
		}

		var c, k float64
		if req.Celsius != nil {
			c = *req.Celsius
			k = c + 273.15
		} else if req.Kelvin != nil {
			k = *req.Kelvin
			c = k - 273.15
		} else {
			http.Error(w, "provide celsius or kelvin", http.StatusBadRequest)
			return
		}

		resp := ConvertResponse{Celsius: c, Kelvin: k}
		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(resp)
	})

	addr := ":8080"
	log.Printf("HTTP backend listening on %s", addr)
	log.Fatal(http.ListenAndServe(addr, mux))
}
