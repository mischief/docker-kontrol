all:	docker

docker:	bin/kontrol
	docker build -t mischief/kontrol:latest .

bin/kontrol:
	docker run --rm -v ${PWD}:/opt golang:1.4 /bin/bash -c "\
		go get -d -u github.com/koding/kite/...; \
		CGO_ENABLED=0 go build -installsuffix cgo -o /opt/bin/kontrol github.com/koding/kite/kontrol/kontrol; \
		CGO_ENABLED=0 go build -installsuffix cgo -o /opt/bin/kitectl github.com/koding/kite/kitectl; \
	"

clean:
	docker run --rm -v ${PWD}:/opt -w /opt/bin busybox rm -f kontrol kitectl
	docker rmi mischief/kontrol:latest

