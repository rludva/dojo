package main

import (
  "log"
  "net/http"
)

type server struct{}

func (s *server) ServeHTTP(w http.ResponseWriter, r *http.Request) {
  w.Header().Set("ContentType", "application/json")
  switch r.Method {
  case "GET":
    w.WriteHeader(http.StatusOK)
    w.Write([]byte(`{"message": "Hello World.."}`))
  case "POST":
    w.WriteHeader(http.StatusCreated)
    w.Write([]byte(`{"message": "Hello from POST World.."}`))
  }
}

func main() {
  s := &server{}
  http.Handle("/", s)
  log.Fatal(http.ListenAndServe(":6062", nil))
}

// https://dev.to/moficodes/build-your-first-rest-api-with-go-2gcj
