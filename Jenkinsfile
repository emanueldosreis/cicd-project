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
                    app = docker.build("emanueldosreis/mycicd-0.2")
                    app.inside {
                        sh 'ls'
                    }
                }   
           }
           }  
        stage('Push New Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com/', 'docker_hub_login') {
                        app.push('latest')  
                    }
                }   
           }
           }    
}
}
