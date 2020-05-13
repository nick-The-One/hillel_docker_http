registry-start:
	docker run -d -p 5000:5000 --name registry -v '~/Work/Projects/hillel_docker_http/registry':/var/lib/registry registry:2

registry-stop:
	docker container stop registry

registry-remove:
	docker container rm -v registry

build:
	docker build -t simpleserve:latest .

run:
	docker run --rm -it -p 8001:8000 simpleserve:latest

run-reg:
	docker run --rm -it -p 8001:8000 localhost:5000/simpleserve

push:
	docker tag simpleserve:latest localhost:5000/simpleserve
	docker push localhost:5000/simpleserve

pull:
	docker pull localhost:5000/simpleserve

local-cleanup:
	docker image remove simpleserve:latest
	docker image remove localhost:5000/simpleserve

minikube-start:
	minikube start

minikube-build-pod:
	kubectl create -f pod.yaml

minikube-expose:
	kubectl port-forward simpleserve 8000

minikube-ip:
	minikube service --url simpleserve
