#!groovy
pipeline {
	agent none
  stages {
	stage('Maven Install') {
	agent {
	docker {
		image 'maven:3.8.6'
        }
      }
      steps {
	sh 'mvn clean install -Dcheckstyle.skip'
      }
    }
    stage('Docker Build') {
	agent any
      steps {
	sh 'docker build -t usertestnad/spring-petclinic:latest .'
      }
    }
  stage ('Docker Push') {
	agent any
	steps{
	 withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
		sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
		sh 'docker push usertestnad/spring-petclinic:latest'
	 }
	}
  }
  }
}
