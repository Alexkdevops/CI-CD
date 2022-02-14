ver = 1.0
acct = $(shell aws sts get-caller-identity --query "Account" --output text)
reg = us-east-2
repo = web
image = $(acct).dkr.ecr.$(reg).amazonaws.com/$(repo):$(ver) 

login:
	@aws ecr get-login-password --region $(reg) | docker login --username AWS --password-stdin $(acct).dkr.ecr.$(reg).amazonaws.com

build:login
	@docker build -t $(repo):$(ver) .

push:build
	@docker tag $(repo):$(ver) $(acct).dkr.ecr.$(reg).amazonaws.com/$(repo):$(ver)
	@docker push $(image)

deploy:
	@cat deployment.yaml | sed "s|VER|$(ver)|g; s|NAMESPACE|$(repo)|g; s|ACCT|$(acct)|g; s|REG|$(reg)|g; s|REPO|$(repo)|g" | kubectl apply -f -




	


