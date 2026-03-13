pipeline {
    agent any
    
    environment {
        DOCKER_HUB_CREDS = 'dockerhub-creds' 
        DOCKER_IMAGE = "thanadonruangpakdee/finead-todo-app:latest"
    }

    stages {
        stage('Build') {
            steps {
                echo 'Stage 1: Installing dependencies...'
                dir('TODO/todo_backend') {
                    sh 'npm install'
                }
            }
        }

        stage('Containerise') {
            steps {
                echo 'Stage 2: Building Docker Image...'
                script {
                    appImage = docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        stage('Push') {
            steps {
                echo 'Stage 3: Pushing to Docker Hub...'
                script {
                    docker.withRegistry('', "${DOCKER_HUB_CREDS}") {
                        appImage.push()
                    }
                }
            }
        }
    }
} // อย่าลืมปีกกาปิดตัวสุดท้ายนี้เด็ดขาด