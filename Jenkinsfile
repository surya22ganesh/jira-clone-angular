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
        // stage('docker build') {
        //     steps {
        //         sh ''' 
        //             docker build -t surya22ganesh/jira .
        //         '''
        //     }
        // }
        // stage('docker push') {
        //     steps {
        //         sh ''' 
        //             docker login -u surya22ganesh -p Surya@ganesh
        //             docker push 
        //         '''
        //     }
        // }

        // stage('trivy image scan'){
        //     steps{
        //         sh 'trivy image jira > trivyreport.txt'
        //     }
        // }
    }
}
