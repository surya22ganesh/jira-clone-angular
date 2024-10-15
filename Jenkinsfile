pipeline {
    agent any

    stages {
        stage('ls') {
            steps {
                sh 'ls'
            }
        }
        stage('trivy scan'){
            sh 'trivy fs . > trivyfsoutput.txt'
        }
        stage('docker build') {
            steps {
                sh ''' 
                    sudo docker build -t jira .
                '''
            }
        }
        stage('trivy image scan'){
            steps{
                sh 'trivy image jira > trivyreport.txt'
            }
        }
    }
}
