pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'  // Adjust as needed
        TERRAFORM_VERSION = '1.3.6' // Adjust as needed
    }

    stages {

        stage('Clean Workspace') {
            steps {
                script {
                    cleanWs()
                }
            }
        }

        stage('Checkout') {
            steps {
                script{
                    git (
                        url: "https://github.com/mahendra-palla/terraform_IAM_creation.git",
                        branch: "main",
                        changelog:  true,
                        poll: true
                )

                }
            }
        }

        /*stage('Install Terraform') {
            steps {
                script {
                    // Install Terraform
                    sh 'curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip'
                    sh 'unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip'
                    sh 'sudo mv terraform /usr/local/bin/'
                }
            }
        } */

        
        stage('Install Terraform') {
            steps {
                script {
                    // Install Terraform
                    sh '''
                        echo "Installing Terraform version ${TERRAFORM_VERSION}"

                        # Update APK package index
                        apk update

                        # Install dependencies
                        apk add --no-cache curl unzip

                        # Download Terraform
                        curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

                        # Unzip the downloaded file
                        unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip

                        # Move Terraform binary to /usr/local/bin
                        mv terraform /usr/local/bin/

                        # Clean up
                        rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

                        # Verify installation
                        terraform version
                    '''
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
}