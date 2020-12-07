pipeline {
    agent { docker { image 'maven:3.3.3' } }
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
