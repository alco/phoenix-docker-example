.PHONY: docker clean

all: docker

docker: docker/webexample
	cd $< && git pull --rebase && mix deps.get
	docker build -t webexample docker/

docker/webexample:
	cd docker && git clone .. webexample


clean:
	rm -rf docker/webexample
