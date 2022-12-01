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
		withCredentials([usernamePassword(credentialsId: 'Deploy', passwordVariable: 'passwordVar', usernameVariable: 'usernameVar')]) {
                // some block
                    sshPublisher(
                        failOnError: true,
                        continueOnError: false,
                        publishers: [ sshPublisherDesc( configName: 'staging', sshCredentials: [ username: "$usernameVar", encryptedPassphrase: "$passwordVar" ],
                        transfers: [ sshTransfer(
                                sourceFiles: 'dist/my-distitrubion.zip',
                                removePrefix: 'dist/',
                                remoteDirectory: '/',
                                execCommand: 'unzip -o my-distitrubion.zip -d wwww/ && rm my-distitrubion.zip'
                                ) ]
                         ) ]
                )
        }
        }
    	}
        stage('testingStaging') {
            steps {
                echo 'Testing staging...'
		sh 'curl http://a4e5c46d762c.mylabserver.com:80'
        }
        }
        stage('deployProd') {
             steps {
                echo 'Deploying to Prod'
		input 'Does the staging environment look good ?'
		input 'Are you sure ?' 
		withCredentials([usernamePassword(credentialsId: 'Deploy', passwordVariable: 'passwordVar', usernameVariable: 'usernameVar')]) {
                // some block
                    sshPublisher(
                        failOnError: true,
                        continueOnError: false,
                        publishers: [ sshPublisherDesc( configName: 'production', sshCredentials: [ username: "$usernameVar", encryptedPassphrase: "$passwordVar" ],
                        transfers: [ sshTransfer(
                                sourceFiles: 'dist/my-distitrubion.zip',
                                removePrefix: 'dist/',
                                remoteDirectory: '/',
                                execCommand: 'unzip -o my-distitrubion.zip -d wwww/ && rm my-distitrubion.zip'
                                ) ]
                         ) ]
                )
        }
        }
    	}
}
}
