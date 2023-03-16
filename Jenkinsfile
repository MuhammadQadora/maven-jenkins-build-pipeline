pipeline {
    agent any

    stages {
        stage('github'){
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'jenkins-token', url: 'https://github.com/MuhammadQadora/maven-jenkins-build-pipeline.git']])
            }
        }
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
    }
}
