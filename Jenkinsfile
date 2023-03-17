pipeline {
  agent {
    kubernetes{
      yaml'''
      apiVersion: v1
      kind: Pod
      spec:
        containers:
        - name: mygit
          image: alpine/git
      '''
  }
  stages{
    stage('git-checkout'){
      steps{
        container('mygit'){
          checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'jenkins-token', url: 'https://github.com/MuhammadQadora/maven-jenkins-build-pipeline.git']])
        } 
      }
    }
  }
}