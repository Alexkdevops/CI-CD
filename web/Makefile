acct = $(shell aws sts get-caller-identity --query "Account" --output text)
image = $(acct).dkr.ecr.$(reg).amazonaws.com/$(repo):$(ver) 
include stages/$(stage)

login:
	@aws ecr get-login-password --region $(reg) | docker login --username AWS --password-stdin $(acct).dkr.ecr.$(reg).amazonaws.com

build: login
	@docker build -t $(image) .

push: build
	@docker push $(image)

deploy: push
	@echo "deploys into $(namespace) environment"
	@cat deployment.yaml | sed "s|VER|$(ver)|g; s|NAMESPACE|$(repo)|g; s|ACCT|$(acct)|g; s|REG|$(reg)|g; s|REPO|$(repo)|g" | kubectl apply -f -




	


