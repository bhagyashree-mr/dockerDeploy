def dockerImg
pipeline {
    agent any
    
    environment {
        registry = "bhagyashreemreddy/dockerdeploy"
        img = "${registry}:${env.BUILD_ID}"
    }
    stages {
        stage('Checkout') {
            steps {
                echo "Code checkout from the GitHub"
                checkout scm: [$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[credentialsId: 'Github-jenkins-integration', url: 'https://github.com/bhagyashree-mr/dockerDeploy.git']]]
                sh 'ls -la'
            }
        }

        stage('Build') {
            steps {
                echo "Building the image"
                script {
                    dockerImg = docker.build("${img}")
                }
            }
        }

        stage('Release') {
            steps {
                echo "Releasing the application to the Docker Hub"
                script {
                    withDockerRegistry(credentialsId: 'docker-jenkins-integration') {
                        dockerImg.push()
                        dockerImg.push('latest')
                    }
                }
            }
        }

        stage('Run') {
            steps {
                echo "Running the application"
                script {
                    def cont = docker.image("${img}").run("-d")
                    def containerId = cont.id
                    echo "Container ID: ${containerId}"
                    sh "docker logs ${containerId}"
                }
            }
        }


        
    }
}
