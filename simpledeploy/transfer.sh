#!/bin/bash
apt-get update
apt-get -y install git npm gccgo-go curl mercurial
ln -s /usr/bin/nodejs /usr/bin/node

npm install -g bower
npm install -g grunt-cli
npm install grunt-contrib-imagemin --save-dev


git clone https://github.com/hellbentv/transfer.sh
cd transfer.sh

#npm install
npm install 
#bower install
bower install --config.interactive=false --allow-root

export GOPATH=/root/transfer.sh

go get github.com/PuerkitoBio/ghost/handlers
go get github.com/gorilla/mux
go get github.com/dutchcoders/go-clamd
go get github.com/goamz/goamz/s3
go get github.com/goamz/goamz/aws
go get github.com/golang/gddo/httputil/header
go get github.com/kennygrant/sanitize

go get github.com/russross/blackfriday
go get github.com/dutchcoders/go-virustotal
grunt serve
grunt build

go run transfersh-server/*.go -provider=local --port 8080 --temp=/tmp/ --basedir=/tmp/ 

cd transfersh-server
go build -o transfersh-server *.go
