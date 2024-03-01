import jenkins.model.*
import hudson.tools.*



pipeline {
    agent any
    stages {
        stage('Build') { 
            steps {
                script{
                def jenkinsInstance = Jenkins.getInstance()
                def toolDescriptor = Jenkins.getInstance().getDescriptorList(ToolDescriptor.class)
                
                toolDescriptor.each { descriptor ->
                    println("Tool Type: ${descriptor.displayName}")
                    descriptor.getInstallations().each { installation ->
                        println("- Name: ${installation.name}")
                        println("  Home: ${installation.home}")
                    }
                }
                }
                bat 'npm install' 
            }
        }
       
        stage('SonarQube Analysis') {
            steps{
                script{
            withSonarQubeEnv() {
              bat 'SonarService.bat'
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
