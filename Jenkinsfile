pipeline {
    agent any
    
    environment {
        // *** 1. ตรวจสอบชื่อ ID นี้ในหน้า Credentials ของ Jenkins ให้ตรงเป๊ะ ***
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
                    // เพิ่ม def เพื่อประกาศตัวแปรให้ถูกต้องตามมาตรฐาน
                    def appImage = docker.build("${DOCKER_IMAGE}")
                    
                    // เก็บตัวแปรไว้ใช้ใน stage ถัดไป (แก้ปัญหา scope)
                    env.DOCKER_IMAGE_NAME = "${DOCKER_IMAGE}"
                }
            }
        }

        stage('Push') {
            steps {
                echo 'Stage 3: Pushing to Docker Hub...'
                script {
                    docker.withRegistry('', "${DOCKER_HUB_CREDS}") {
                        // เรียกใช้ image ที่ build ไว้ขึ้นไป push
                        sh "docker push ${DOCKER_IMAGE}"
                    }
                }
            }
        }
    }
}