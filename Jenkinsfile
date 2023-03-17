pipeline {
  agent {
    kubernetes{
    }
  }
  stages{
    stage('install-git'){
      steps{
        sh '''
        sudo apt update -y && sudo apt install git -y
        git --version
        '''
      }
    }
    stage('git-checkout'){
      steps{
        checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'jenkins-token', url: 'https://github.com/MuhammadQadora/maven-jenkins-build-pipeline.git']])
      }
    }
  }
}