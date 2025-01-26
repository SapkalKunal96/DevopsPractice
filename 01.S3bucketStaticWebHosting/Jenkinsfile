pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'  // Change to your desired AWS region
        S3_BUCKET = 'www.cloudenthusiastic.online'  // Your S3 bucket name
    }

    stages {
        stage('Code Checkout') {
            steps {
                echo 'No need as we are using pipeline script for checkout'
               
                git branch: 'main', url: 'https://github.com/SapkalKunal96/devopsK.git'
            
                // Checkout code from a private GitHub repository
                // Add checkout logic here
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform --version'
                sh 'cd /var/lib/jenkins/workspace/01.S3Bucket/01.S3bucketStaticWebHosting/terraform'
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'cd /var/lib/jenkins/workspace/01.S3Bucket/01.S3bucketStaticWebHosting/terraform'
                sh 'terraform plan --auto-approve'
            }
        }

        stage('Pushing code to S3') {
            steps {
                // Set AWS credentials using Jenkins' AWS Credentials plugin
            //     withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'jenkins-aws-key-id']]) {
            //         script {
            //             // Set AWS credentials using Jenkins' AWS Credentials plugin
            //             try {
            //                 sh """
            //                     aws s3 ls
            //                     cd /var/lib/jenkins/workspace/01.S3Bucket/01.S3bucketStaticWebHosting
            //                     aws s3 sync . s3://${S3_BUCKET}/ --exclude 'Jenkinsfile' --delete
            //                 """
            //             } catch (Exception e) {
            //                 error "AWS S3 sync failed: ${e.getMessage()}"
            //             }
            //         }
            //     }
            // }
        }

        stage('Test Website') {
            steps {
                // sh 'curl www.cloudenthusiastic.online'
                // Add your deployment steps here
            }
        }
    }
    }
}
