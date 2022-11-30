pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Running build automation'
                sh './gradlew build generatePackage --no-daemon'
           }
           }
        stage('deployStaging') {
            steps {
                echo 'Deploying to Staging'
        }
    	}
        stage('testingStaging') {
            steps {
                echo 'Deploying to Prod...'
        }
        }
        stage('deployProd') {
            steps {
                echo 'Deploying to Prod...'
        }
        }
}
}
