
pipeline {
    agent any
    stages {
        stage('Build') { 
            steps {
                bat 'npm install' 
                print('test_1')
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
