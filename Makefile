#Define the image name
REPOSITORY := kostiantynpolishko3
IMAGE := okteto/pagination-react
TAG := v1.0.0

# Define the container name
CONTAINER := reactapp-default
CONTAINER_DEV := okteto-pagination
V := v1

#Define port mapping
PORT := 4000:9000

#Main scripts of Docker commands
mi:
	docker build -t $(IMAGE):$(TAG) .

rmi:
	docker rmi $(IMAGE):$(TAG)

createdev:
	docker container create -p $(PORT) --name $(CONTAINER_DEV)_$(V) $(IMAGE):$(TAG)

rundev:
	docker run -d -p $(PORT) --name $(CONTAINER_DEV)_$(V) $(IMAGE):$(TAG)

rundevhttps:
	docker run -d -it -p $(PORT) --rm --name $(CONTAINER_DEV)_$(V) $(IMAGE):$(TAG)

stopdev:
	docker stop $(CONTAINER_DEV)_$(V)

start:
	@echo "Starting Docker container..."
	docker start $(CONTAINER)

stop:
	@echo "Stopping Docker container..."
	docker stop $(CONTAINER)

lsc:
	docker ps -a