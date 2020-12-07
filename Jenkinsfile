pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh 'whoami'
                sh 'sudo su'
                sh 'whoami'
                sh 'mvn --version'
                sh 'echo "docker installed and running"'
                sh 'echo $PATH'
            }
        }
    }
}
