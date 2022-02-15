podTemplate(yaml: """
apiVersion: v1
kind: Pod
metadata:
  labels:
    some-label: some-label-value
spec:
  containers:
  - name: jenkins-slave
    image: 604269064751.dkr.ecr.us-east-2.amazonaws.com/jenkins-slave:1.0
    imagePullPolicy: Always
    command:
    - cat
    tty: true
    env:
    - name: DOCKER_HOST
      value: 'tcp://localhost:2375'
  - name: dind-daemon
    image: 'docker:18-dind'
    command:
    - dockerd-entrypoint.sh
    tty: true
    securityContext:
      privileged: true    
"""
) {
    node(POD_LABEL) {  
      properties([
	    pipelineTriggers([
          [$class: 'GitHubPushTrigger'],
          pollSCM('*/1 * * * *'),
	      ])
	    ])       
      checkout scm
      container('jenkins-slave') {
        sh '''
        ./deploy.sh
        '''
      }
    }
}
