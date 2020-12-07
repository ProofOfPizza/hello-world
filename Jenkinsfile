pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh 'mvn --version'
                sh 'echo "docker installed and running"'
                sh 'echo $PATH'
            }
        }
    }
}
