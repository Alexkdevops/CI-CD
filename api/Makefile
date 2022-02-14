ver = 1.1
acct = $(shell aws sts get-caller-identity --query "Account" --output text)
reg = us-east-2
repo = apiapp
image = $(acct).dkr.ecr.$(reg).amazonaws.com/$(repo):$(ver) 

login:
	@aws ecr get-login-password --region $(reg) | docker login --username AWS --password-stdin $(acct).dkr.ecr.$(reg).amazonaws.com

build:
	@docker build -t $(repo):$(ver) .

push:login
	@docker tag $(repo):$(ver) $(acct).dkr.ecr.$(reg).amazonaws.com/$(repo):$(ver)
	@docker push $(image)




	


