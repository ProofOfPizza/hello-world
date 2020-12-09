pipeline {
  agent none

  stages{
    stage('clear out docker containers'){
      agent any
      environment {
        DOCK_CONT = '${sh(script:"docker ps -a -q", returnStdout: true)'
      }
      steps{
        sh 'docker stop ${DOCK_CONT} && docker rm ${DOCK_CONT}
      }
    }
    stage('.... and images'){
      agent any
      environment {
        DOCK_IMG = '${sh(script:"docker images -a -q", returnStdout: true)'
      }
      steps{
        sh 'docker system prune --all --force'
        sh 'docker system prune --all --volumes --force'
        sh 'docker rmi ${env.DOCK_IMG}'
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
