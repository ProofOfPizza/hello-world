pipeline {
  agent none

  stages{
    stage('clear out docker containers'){
      agent any
      environment {
        DOCK_CONT = sh(script:'docker ps -a -q', returnStdout: true)
      }
      when {
        expression {
            return env.DOCK_CONT != null;
        }
      }
      steps{
        echo 'containers were found (running) ... stopping and removing'
        sh "docker stop $env.DOCK_CONT && docker rm $env.DOCK_CONT"
      }
    }
    stage('.... and images'){
      agent any
      environment {
        DOCK_IMG = sh(script:'docker images -a -q', returnStdout: true)
      }
      when {
        expression {
            return env.DOCK_IMG != null;
        }
      }
      steps{
        echo 'images were found.... pruning now... '
        sh 'docker system prune --all --force'
        sh 'docker system prune --all --volumes --force'
        sh "docker rmi $env.DOCK_IMG"
      }
    }
    stage('stick it in a container'){
      agent {
        dockerfile {
          filename 'Dockerfile'
          additionalBuildArgs '-t proofofpizza/hello-world:first'
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
          agent any
          steps {
            echo 'Tagging and pushing to docker hub'
            sh 'docker images'
            sh 'docker tag proofofpizza/hello-world:first proofofpizza/hello-world:latest'
            sh "docker tag proofofpizza/hello-world:first proofofpizza/hello-world:$env.GIT_COMMIT"
            sh "docker image push proofofpizza/hello-world:latest proofofpizza/hello-world:$env.GIT_COMMIT"
          }
        }
      }
    }
  }
}
