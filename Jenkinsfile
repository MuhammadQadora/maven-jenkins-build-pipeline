pipeline {
    agent {
        kubernetes {}
    }
    stages{
        stage('github'){
            steps{
                /usr/bin/git
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'jenkins-token', url: 'https://github.com/MuhammadQadora/maven-jenkins-build-pipeline']])
            }
        }
    }
}