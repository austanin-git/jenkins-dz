pipeline {
  agent {

    docker {
      image 'austanin/maven-worker:latest'
    }
  }
  stages {
    stage('Copy source with configs') {
      steps {
                git 'https://github.com/austanin-git/austanin-boxfuse'
      }
    }

    stage('Build .war') {
      steps {
        sh 'cd ./boxfuse-sample-java-war-hello && mvn package -am -T 1C'
        sh 'docker build -t austanin/boxfuse:latest'
      }
    }

    stage('Publish to Dockerhub') {
      steps {
        withDockerRegistry([ credentialsId: "d123f966-5174-4bb7-a087-a5dce6614fef", url: "" ]) {
        sh 'docker push austanin/boxfuse:latest'
      }
    }
  }
 }
}