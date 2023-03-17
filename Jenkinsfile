pipeline {
  agent {
    kubernetes {
      yaml """
kind: Pod
spec:
  containers:
  - name: git
    image: bitnami/git
  - name: kaniko
    image: gcr.io/kaniko-project/executor:debug
    imagePullPolicy: Always
    command:
    - sleep
    args:
    - 9999999
    volumeMounts:
      - name: jenkins-docker-cfg
        mountPath: /kaniko/.docker
  volumes:
  - name: jenkins-docker-cfg
    projected:
      sources:
      - secret:
          name: docker-credentials
          items:
            - key: .dockerconfigjson
              path: config.json
"""
    }
  }
    stages {
       stage ('git-checkout') {
        steps {
          conatiner('git'){
            git branch: 'main', credentialsId: 'jenkins-token', url: 'https://github.com/MuhammadQadora/maven-jenkins-build-pipeline.git'
          }
        }
       }
       stage('Build-image') {
            steps {
                git branch: 'main', credentialsId: 'jenkins-token', url: 'https://github.com/MuhammadQadora/maven-jenkins-build-pipeline.git'
                container (name: 'kaniko', shell: '/busybox/sh') {
                    sh '''
                    /kaniko/executor --context `pwd` --destination muhammadqadora/maven-app:latest
                    '''
                }
            }
        }
    }
}
