pipeline {
  agent {
    kubernetes {
      idleMinutes 5
      defaultContainer 'jenkins-slave'
      yamlFile 'jenkins-pod.yaml'
    }
  }
//   environment {
//     MYSQL_USER     = credentials('MYSQL_USER')
//     MYSQL_PASSWORD = credentials('MYSQL_PASSWORD')
//   }
  stages {
    stage ('Initialize the enviromnet') {
      steps {
        script {
          if (env.GIT_BRANCH == 'dev') {
            stage ('Stage: dev') {
                env.STAGE = 'dev'
                sh 'echo ${STAGE}'
            }
          } else if (env.GIT_BRANCH == 'main') {
            stage ('Stage: main') {
                env.STAGE = 'main'
                sh 'echo ${STAGE}'
            } 
          } else {
            stage ('Stage: prod') {
                env.STAGE = 'prod'
                sh 'echo ${STAGE}'
            }
          }            
        }
      }
    }
    stage('Build containers') {
      steps {
        dir('api') {
          sh 'make build stage=${stage}'
        }
        dir('web') {
          sh 'make build stage=${stage}'
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
    stage('Push artifacts') {
            parallel {
                stage('Push api') {
                    steps {
                      dir('api') {
                        sh 'make push stage=${stage}'
                      }
                    }
                }
                stage('Push web') {
                    steps {
                        dir('web') {
                          sh 'make push stage=${stage}'
                        }
                    }
                }
            }
        }
    stage('Deploy to the EKS cluster') {
            parallel {
                stage('Deploy api') {
                    steps {
                      dir('api') {
                        sh 'make deploy stage=${stage}'
                      }
                    }
                }
                stage('Deploy web') {
                    steps {
                        dir('web') {
                          sh 'make deploy stage=${stage}'
                        }
                    }
                }
            }
        }
  }
  post {
      always {
         sh "docker system prune -a --volumes -f"
      }
   }
}
