pipeline {
  agent none

  stages{
    stage('start up'){
      agent any
      steps{
        withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
          echo 'welcome to the pipeline'
          sh 'docker login -u $DOCKER_USER -p $DOCKER_PASS'

        }
      }
    }
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
    stage('stick it in an image'){
      agent {
        dockerfile {
          filename 'Dockerfile.app'
//          filename 'Dockerfile.ans'
          additionalBuildArgs '-t proofofpizza/hello-world:latest'
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
            sh "docker tag proofofpizza/hello-world:latest proofofpizza/hello-world:$env.GIT_COMMIT"
            sh "docker image push proofofpizza/hello-world:latest"
            sh "docker image push proofofpizza/hello-world:$env.GIT_COMMIT"
          }
        }
      }
    }
    stage('use ansible to pull on dockerhost'){
      stages {
        stage('pull ?') {
          agent {
            dockerfile {
              filename 'Dockerfile.ans'
              additionalBuildArgs '-t ansible'
              reuseNode true
            }
          }
          steps {
            echo 'we git ansible in a docker... now lets use it'
            sh 'docker run -d ansible -v $(pwd) --private-key ~/.ssh/id_rsa'
          }
        }
      }
    }
  }
}
