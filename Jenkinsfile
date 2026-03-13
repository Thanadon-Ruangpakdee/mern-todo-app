pipeline {
    agent any
    
    environment {
        // ชื่อตรงนี้ต้องตรงกับ ID ที่ตั้งใน Jenkins
        DOCKER_HUB_CREDS = 'dockerhub-creds' 
        // ชื่อ image สำหรับ push
        DOCKER_IMAGE = "thanadonruangpakdee/finead-todo-app:latest"
    }

    stages {
        stage('Build') {
            steps {
                echo 'Installing dependencies in todo_backend...'
                dir('TODO/todo_backend') {
                    sh 'npm install'
                }
            }
        }

        stage('Containerise') {
            steps {
                echo 'Building Docker Image...'
                script {
                    // สร้าง Image จาก Dockerfile ที่อยู่ Root
                    appImage = docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        stage('Push') {
            steps {
                echo 'Pushing to Docker Hub...'
                script {
                    // ใช้ Credentials Provider เพื่อความปลอดภัย (10 คะแนน)
                    docker.withRegistry('', "${DOCKER_HUB_CREDS}") {
                        appImage.push()
                    }
                }
            }
        }
    }
} // ปิด Pipeline ที่นี่