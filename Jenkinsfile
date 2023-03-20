pipeline {
  agent {
    kubernetes {
        serviceAccount 'pod-sa'
      yaml """
kind: Pod
spec:
  containers:
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
  environment {
    image = "muhammadqadora/maven-proj:latest"
    rootpass = credentials('root')
    user = credentials('db-user')
    pass = credentials('db-pass')
    db = credentials('db')
  }
  stages {
    stage('github'){
        steps{
            checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-token', url: 'https://github.com/MuhammadQadora/maven-jenkins-build-pipeline.git']])
        }
    }
    stage('Build with Kaniko') {
      steps {
        container(name: 'kaniko', shell: '/busybox/sh') {
          sh '''#!/busybox/sh
            /kaniko/executor --context `pwd` --destination muhammadqadora/maven-proj:latest
          '''
        }
      }
    }
  stage('deployment'){
    steps{
      sh '''
      #!/bin/bash
      curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
      chmod +x kubectl
      eval echo $(cat deployment.yaml) > deployment.yaml
      ./kubectl apply -f deployment.yaml
      '''
    }
  }
  }
}