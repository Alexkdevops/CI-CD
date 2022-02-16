acct = $(shell aws sts get-caller-identity --query "Account" --output text)
image = $(acct).dkr.ecr.$(reg).amazonaws.com/$(repo):$(ver) 
include stages/$(stage)


build:
	@aws ecr get-login-password --region $(reg) | docker login --username AWS --password-stdin $(acct).dkr.ecr.$(reg).amazonaws.com
	@docker build -t $(image) .

push:
	@docker push $(image)

deploy:
	@cat deployment.yaml | sed "s|VER|$(ver)|g; s|NAMESPACE|$(repo)|g; s|ACCT|$(acct)|g; s|REG|$(reg)|g; s|REPO|$(repo)|g" | kubectl apply -f -




	


