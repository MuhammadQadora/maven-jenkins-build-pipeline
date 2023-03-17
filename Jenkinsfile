pipeline {
  agent any
  stages {
    stage('git'){
      steps {
        git branch: 'main', credentialsId: 'jenkins-token', url: 'https://github.com/MuhammadQadora/maven-jenkins-build-pipeline.git'
      }
    }
  }
}