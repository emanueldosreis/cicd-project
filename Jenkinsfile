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
        
        def remote = [:]
        remote.name = "Staging Server"
        remote.host = "a4e5c46d762c.mylabserver.com"
        remote.allowAnyHosts = true

        node {
            withCredentials([sshUserPrivateKey(credentialsId: 'sshUser', keyFileVariable: 'identity', passphraseVariable: '', usernameVariable: 'userName')]) {
                remote.user = userName
                remote.identityFile = identity
                stage("SSH Steps Rocks!") {
                    sshCommand remote: remote, command: 'whoami'
                }
            }
        }
        
        
}
}
