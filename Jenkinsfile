pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh 'whoami'
                sh 'mvn --version'
                sh 'echo "docker installed and running"'
                sh 'echo $PATH'
            }
        }
    }
}
