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
        '''
      }
    }
  }
}