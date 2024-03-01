import jenkins.model.*
import hudson.tools.*



pipeline {
    agent any
    stages {
        stage('Build') { 
            steps {
                bat 'npm install' 
            }
        }
       
        stage('SonarQube Analysis') {
            steps{
                script{
             // Use the correct installation name for SonarScanner
                def scannerHome = tool 'Sonarqube_exec';
                withSonarQubeEnv() {
                    bat "net start ${scannerHome}/bin/windows-x86-64/SonarService.bat"
                }
            }
        }
        }
        
        stage('Test') {
            steps {
                bat '.\\jenkins\\scripts\\test.bat'
            }
        }
        stage('Deliver') {
            steps {
                bat '.\\jenkins\\scripts\\deliver.bat'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                bat '.\\jenkins\\scripts\\kill.bat'
            }
        }
         
    }
    
}
