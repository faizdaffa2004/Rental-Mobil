pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                script {
                    echo "Cloning repository..."
                    // Clone the 'main' branch
                    git branch: 'master', url: 'https://github.com/faizdaffa2004/Rental-Mobil.git'
                }
            }
        }

        stage('Build Docker Image') { // mobilimage //mobilcontainer
            steps {
                script {
                    echo "Building Docker image for the main branch..."
                    bat "docker build -t mobilimage ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Use a fixed port for the main branch
                    def branchPort = 3008

                    echo "Stopping and removing any existing container for the main branch..."
                    bat "docker stop mobilcontainer || exit 0"
                    bat "docker rm mobilcontainer || exit 0"

                    echo "Running new container for the main branch on port ${branchPort}..."
                    bat "docker run --rm -d --name mobilcontainer -p ${branchPort}:80 mobilimage"

                    echo "Container for the main branch is running on port ${branchPort}"
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        always {
            echo 'Pipeline completed!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}