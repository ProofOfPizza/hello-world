pipeline {
  agent none

  stages{
    stage('clear out docker containers'){
      agent any
      steps{
        sh 'docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
      }
    }
    stage('.... and images'){
      agent any
      steps{
        sh 'docker system prune --all --force'
        sh 'docker system prune --all --volumes --force'
        DOCK = "${sh(script:'docker images -a -q', returnStdout: true)"
        sh 'docker rmi ${DOCK}'
      }
    }
    stage('stick it in a container'){
      agent {
        dockerfile {
          filename 'Dockerfile'
          reuseNode true
        }
      }
      steps{
        echo 'we did it'
      }
    }
    stage('push to docker hub'){
      stages {
        stage('push') {
          steps {
            sh 'docker images'
            sh 'docker tag release proofofpizza/hello-world:${env.GIT_COMMIT}.${env.BUILD_NUMBER}'
            sh 'docker tag release proofofpizza/hello-world:latest'
          }
        }
      }
    }
  }
}
