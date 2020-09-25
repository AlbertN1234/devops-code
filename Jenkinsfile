pipeline {
    agent any
    tools {
        maven 'M2_HOME'      /*that is the maven home, located on Global Configuration */

    }
    environment {
        registry = "albernana/tomcat_image"
        registryCredential = 'DockerID'
        dockerImage = ''
    }
    stages {
        stage ('Build') {
            steps {
                sh 'mvn clean'
                sh 'mvn install'
                sh 'mvn package'
            }
        }
        stage ('Test') {
            /* when {
                expression
                currentBuild.result == null || currentBuild.result == 'SUCCESS'
            } */
            steps {
                echo "test step"
                sh 'mvn test'
            }
        }
        stage ('Building image') {
            steps {
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage ('Deploy image') {
            steps {
                script {
                    docker.withRegistry('', registryCredential )
                    dockerImage.push()
                }
            }
        }
        stage ('Clean up') {
            steps {
                sh 'mvn clean'
            }
        }
    }

}
