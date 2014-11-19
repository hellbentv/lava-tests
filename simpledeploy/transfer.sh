#!/bin/bash

npm install
bower install

go get github.com/PuerkitoBio/ghost/handlers
go get github.com/gorilla/mux
go get github.com/dutchcoders/go-clamd
go get github.com/goamz/goamz/s3
go get github.com/goamz/goamz/aws
go get github.com/golang/gddo/httputil/header
go get github.com/kennygrant/sanitize

grunt serve
grunt build

go run transfersh-server/*.go -provider=local --port 8080 --temp=/tmp/ --basedir=/tmp/ 

go build -o transfersh-server *.go
