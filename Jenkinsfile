pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'Docker_cred_c2'
        IMAGE_NAME = 'priyadrshini/new_docker_image'
    }

    stages {

        stage('Build Java Application') {
            steps {
                bat 'javac Main.java'
            }
        }

        stage('Run Java Program') {
            steps {
                bat 'java Main'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %IMAGE_NAME%:latest .'
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                credentialsId: 'Docker_cred_c2',
                usernameVariable: 'USER',
                passwordVariable: 'PASS')]) {

                    bat 'echo %PASS%| docker login -u %USER% --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                bat 'docker push %IMAGE_NAME%:latest'
            }
        }
    }
}
