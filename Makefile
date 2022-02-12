ver = 1.0
acct = $(shell aws sts get-caller-identity --query "Account" --output text)
reg = us-east-2
repo = nginxapp

nginx:
	@amazon-linux-extras install nginx1 -y
	@systemctl start nginx
	@systemctl enable nginx
	@echo "Testing Nginx"
	@curl http://localhost:80

build:
	@docker build -t $(repo):$(ver) .

login:build
	@aws ecr get-login-password --region $(reg) | docker login --username AWS --password-stdin $(acct).dkr.ecr.$(reg).amazonaws.com

push:login
	@docker tag $(repo):$(ver) $(acct).dkr.ecr.$(reg).amazonaws.com/$(repo):$(ver)
	@docker push $(acct).dkr.ecr.$(reg).amazonaws.com/$(repo):$(ver)

run:push
	@docker run -d $(repo):$(ver)


	


