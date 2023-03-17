pipeline {
  agent {
    kubernetes{
      inheritFrom 'kube'
    }
  }
  stages{
    stage('git-checkout'){
      steps{
        checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'jenkins-token', url: 'https://github.com/MuhammadQadora/maven-jenkins-build-pipeline.git']])
      }
    }
  }
}