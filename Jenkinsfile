pipeline {
  agent {
    kubernetes {
      defaultContainer 'jenkins-slave'
      yamlFile 'jenkins-slave.yaml'
    }
  }
  stages {
    stage ('Manage the Environment') {
      steps {
        script {
          if (env.GIT_BRANCH == 'dev') {
            stage ('Stage: Development') {
                env.STAGE = 'dev'
                sh 'echo ${STAGE}'
            }
          } else if (env.GIT_BRANCH == 'main') {
            stage ('Stage: Main') {
                env.STAGE = 'main'
                sh 'echo ${STAGE}'
            } 
          } else {
            stage ('Stage: Production') {
                env.STAGE = 'prod'
                sh 'echo ${STAGE}'
            }
          }            
        }
      }
    }
    stage('Container image build') {
      steps {
        // dir('backend') {
        //   sh 'make build'
        // }
        dir('frontend') {
          sh 'make build'
        }
      }
    }
    // stage('Run tests') {
    //         parallel {
    //             stage('Backend unit test') {
    //                 steps {
    //                   dir('backend') {
    //                     sh 'make test'
    //                   }
    //                 }
    //             }
    //             stage('Frontend unit tests') {
    //                 steps {
    //                     dir('frontend') {
    //                       sh 'yarn test --watchAll=false --coverage --silent'
    //                     }
    //                 }
    //             }
    //         }
    //     }
    stage('Push to Repo') {
            parallel {
                // stage('API') {
                //     steps {
                //       dir('backend') {
                //         sh 'make push'
                //       }
                //     }
                }
                stage('WEB') {
                    steps {
                        dir('frontend') {
                          sh 'make push'
                        }
                    }
                }
            }
        }
    stage('Deploy to the EKS cluster') {
            parallel {
                // stage('API') {
                //     steps {
                //       dir('frontend') {
                //         sh 'make deploy'
                //       }
                //     }
                // }
                stage('WEB') {
                    steps {
                        dir('backend') {
                          sh 'make deploy'
                        }
                    }
                }
            }
        }
  }
}
