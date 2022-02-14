ver = 2.0
acct = $(shell aws sts get-caller-identity --query "Account" --output text)
reg = us-east-2
repo = apiapp
image = $(acct).dkr.ecr.$(reg).amazonaws.com/$(repo):$(ver) 

login:
	@aws ecr get-login-password --region $(reg) | docker login --username AWS --password-stdin $(acct).dkr.ecr.$(reg).amazonaws.com

build:login
	@docker build -t $(repo):$(ver) .

push:build
	@docker tag $(repo):$(ver) $(acct).dkr.ecr.$(reg).amazonaws.com/$(repo):$(ver)
	@docker push $(image)




	


