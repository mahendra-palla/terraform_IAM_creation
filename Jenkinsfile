pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'  // Adjust as needed
        TERRAFORM_VERSION = '1.3.6' // Adjust as needed
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout your code (Terraform configuration)
                checkout scm
            }
        }

        stage('Install Terraform') {
            steps {
                script {
                    // Install Terraform
                    sh 'curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip'
                    sh 'unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip'
                    sh 'sudo mv terraform /usr/local/bin/'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // Initialize Terraform
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Show the Terraform plan
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    // Apply the Terraform configuration
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }

    post {
        always {
            // Clean up actions
            sh 'terraform destroy -auto-approve || true'
        }
    }
}
