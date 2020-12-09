pipeline {
  agent none

  stages{
    stage('cleanup shit'){
      agent any
      stages {
        stage('clear out docker containers'){
          steps{
            sh 'docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
          }
        }
        stage('.... and images'){
          steps{
            sh 'docker system prune --all --force'
            sh 'docker system prune --all --volumes'
            sh 'docker rmi $(docker images -a -q)'
          }
        }
      }
    }
    stage('stick it in a container'){
      agent {
        dockerfile {
          filename 'Dockerfile'
          reuseNode true
        }
      }
    }
    stage('push to docker hub')
      stages {
        stage('push') {
          steps {
            sh 'docker images'
            sh 'docker tag release proofofpizza/hello-world:${env.GIT_COMMIT}.${env.BUILD_NUMBER}
            sh 'docker tag release proofofpizza/hello-world:latest
          }
        }
      }
    }
  }
}
