pipeline {
  agent none
  stages{
    stage{
      agent {
        dockerfile {
          filename 'Dockerfile'
          reuseNode true
        }
      }
        stages {
          stage('build project') {
            steps {
              sh 'echo $PATH'
              sh 'mvn clean install'

          }
        }
      }
    }
  }
}


