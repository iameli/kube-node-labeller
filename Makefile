
.PHONY: all push

all: .
	docker build -t iameli/kube-node-labeller .

push: .
	docker push iameli/kube-node-labeller
