pipeline {
    agent { docker { image 'maven:3.3.3' } }
    stages {
        stage('build')
        when { branch 'jenkins-as-code' } {
            steps {
                sh 'mvn --version'
                sh 'echo "blaaa2"'
                sh 'echo $PATH'

            }
        }
    }
}
