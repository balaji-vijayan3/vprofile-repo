pipeline {
    agent any
    tools {
	maven 'Maven3'
	}
    environment {
        APP_NAME = "vprofile-vprem"
        RELEASE = "1.0.0"
        DOCKER_USER = "balajivijayan10"
        DOCKER_PASSWORD = 'dockerhub'
        IMAGE_NAME = "${DOCKER_USER}" + "/" + "${APP_NAME}"
        TAG = "${RELEASE}-${BUILD_NUMBER}"
    }

    stages {
        stage('checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/balaji-vijayan3/vprofile-repo.git']])
            }
        }
        stage('Build Application') {
            steps {
                sh "mvn clean package"
            }
        }
        stage('Test Application') {
            steps {
                sh "mvn test"
            }
        }
        stage('Build & Push') {
            steps {
                script {
                docker.withRegistry('', DOCKER_PASSWORD) {
                docker_image = docker.build "${IMAGE_NAME}"
                    }
                    docker.withRegistry('', DOCKER_PASSWORD) {
                    docker_image.push("${TAG}")
                    }
                }
            }
        }
        
    }   
}
