pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'mobil-rental'
        CONTAINER_NAME = 'wizardly_noether'
        PORT_MAPPING = '8084:80'  // Adjust the port mapping as needed
    }

    stages {
        // stage('Checkout') {
        //     steps {
        //         // Clean workspace before checkout
        //         deleteDir()
        //         // Checkout the HTML source code from GitHub
        //         git url: 'https://github.com/faizdaffa2004/Rental-Mobil.git'
        //     }
        // }
            stage('Checkout') {
                steps {
                    deleteDir()
                    checkout([$class: 'GitSCM', branches: [[name: 'master']], userRemoteConfigs: [[url: 'https://github.com/faizdaffa2004/Rental-Mobil.git']]])
                }
            }

            stage('Build Docker Image') {
            steps {
                script {
                    // dir('testdeploy') {
                    //   sh 'ls -l'

                        // Build Docker image dengan konten HTML
                        // sh 'docker build -t test3 -f Dockerfile .'
                        docker.build("${DOCKER_IMAGE}",'-f Dockerfile .')
                        // sh 'docker build -t test3 -f Dockerfile .'
                    // }
                    // // Build Docker image with the HTML content
                    // docker.build("${DOCKER_IMAGE}", '-f Dockerfile .')
                }
            }
        }

        


        stage('Run Docker Container') {
            steps {
                script {
                    // Run Docker container based on the built image
                    docker.image("${DOCKER_IMAGE}").run("-p ${PORT_MAPPING} --name ${CONTAINER_NAME}")
                }
            }
        }
    }

    
}