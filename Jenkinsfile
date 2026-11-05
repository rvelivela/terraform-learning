pipeline {
    agent {
        label 'terraform-agent'
    }

    triggers {
        pollSCM('H/2 * * * *')
    }

    stages {

        stage('Terraform Version') {
            steps {
                sh 'echo Running Pipeline from Jenkinsfile'
		sh 'terraform version'
            }
        }

        stage('Terraform Format Check') {
            steps {
                sh 'terraform fmt -check -recursive'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([
                    file(
                        credentialsId: 'google-credentials',
                        variable: 'GOOGLE_APPLICATION_CREDENTIALS'
                    )
                ]) {
                    sh 'terraform plan'
                }
            }
        }

        stage('Approval') {
            steps {
                input 'Approve Terraform Apply?'
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([
                    file(
                        credentialsId: 'google-credentials',
                        variable: 'GOOGLE_APPLICATION_CREDENTIALS'
                    )
                ]) {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
