pipeline {
  agent none

  stages{
//    stage('build project'){
//      agent any
//      stages {
//        stage('checkout'){
//          steps{
//            git 'https://github.com/ProofOfPizza/hello-world.git'
//          }
//        }
//        stage('build'){
//          steps{
//            sh 'mvn clean install package'
//          }
//        }
//      }
//    }
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
            sh 'docker images'
          }
        }
      }
    }
  }
}
