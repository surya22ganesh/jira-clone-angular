pipeline {
    agent any

    stages {
        stage('ls') {
            steps {
                sh 'ls'
            }
        }
        stage('trivy scan'){
            steps {
                sh 'trivy fs . > trivyfsoutput.txt'
            }
        }
        stage('docker build') {
            steps {
                sh ''' 
                    docker build -t surya22ganesh/jira .
                '''
            }
        }
        stage('docker push') {
            steps {
                sh ''' 
                    docker login -u username -p password
                    docker push surya22ganesh/jira
                '''
            }
        }
        stage('trivy image scan'){
            steps{
                sh 'trivy image surya22ganesh/jira > trivyreport.txt'
            }
        }
         stage('docker container run') {
            steps {
                script {
                    try {
                        echo 'Starting Docker conatiner...'
                        sh 'sudo docker run -dit --name jiracontainer -p 80:80 surya22ganesh/jira'
                    } catch (Exception e) {
                        echo 'catched the error ! Error: ' + e.toString()
                        sh 'sudo docker rm jiracontainer -f'
                        sh 'sudo docker run -dit --name jiracontainer -p 80:80 surya22ganesh/jira'
                        currentBuild.result = 'FAILURE'
                    } finally {
                        echo 'Cleaning up...'
                    }
                }
            }
        
        }
         stage('docker image prune') {
            steps {
                sh ''' 
                    docker image prune -f
                '''
            }
        }

    }
}
