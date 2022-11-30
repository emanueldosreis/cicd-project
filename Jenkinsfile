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
                echo 'Deploying to Staging...'
                withCredentials([usernamePassword(credentialsId: 'Deploy', passwordVariable: 'passwordVar', usernameVariable: 'usernameVar')]) {
                // some block
                    sshPublisher(
                        failOnError: true,
                        continueOnError: false,
                        publishers: [ sshPublisherDesc( configName: 'staging', sshCredentials: [ username: "$usernameVar", encryptedPassphrase: "$passwordVar" ],
                        transfers: [ sshTransfer(
                                sourceFiles: 'dist/trainSchedule.zip',
                                removePrefix: 'dist/',
                                remoteDirectory: '/tmp',
                                execCommand: 'unzip /tmp/trainSchedule.zip -d /opt/train-schedule && sudo /usr/bin/systemctl start train-schedule'
                                ) ]
                         ) ]
                )
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
