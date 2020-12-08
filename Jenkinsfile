pipeline {
    agent  docker
    stages {
        stage('build') {
            steps {
                sh 'whoami'
                sh 'sudo su'
                sh 'whoami'
                sh 'docker info'
                sh 'mvn --version'
                sh 'echo "docker installed and running"'
                sh 'echo $PATH'
            }
        }
    }
}
