pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Running build automation'
                sh './gradlew build generatePackage --no-daemon'
           }
           }    
        stage('Build Docker Image') {
            steps {
                script {
                    app = docker.build("emanueldosreis/mycicd-0.2-${env.BUILD_TAG}")
                    app.inside {
                        sh '$(netstat -ant | grep :80)'
                        sh 'echo $?'
                    }
                }   
           }
           }    
}
}
