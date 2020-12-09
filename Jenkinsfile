pipeline {
  agent none

  stages{
    stage('build project'){
      agent any
      stages {
        stage('checkout'){
          git 'https://github.com/ProofOfPizza/hello-world.git'
        }
        stage('build'){
          sh 'mvn clean install package'
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
      stages {
        stage('bla') {
          steps {
            sh 'echo $PATH'
          }
        }
      }
    }
  }
}


