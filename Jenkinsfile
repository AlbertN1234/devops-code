pipeline {
    agent any
    tools {
        maven 'M2_HOME'      /*that is the maven home, located on Global Configuration */

    }
    environment {
        registry = "albernana/tomccat_image"
        registryCredential = 'DockerIDJenkinsfile'
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
        stage ('Deploy Image') {
            steps {
                 script {
                    docker.withRegistry( '', registryCredential ) {
                    dockerImage.push ()
          }
        }
      }
   }
        def dockerImage
        stage ('publish docker') {
        withCredentials([usernamePassword(credentialsId: 'myregistry-login', passwordVariable: 'DOCKER_REGISTRY_PWD', usernameVariable: 'DOCKER_REGISTRY_USER')]) {
            /* assumes Jib is configured to use the environment variables */
            sh "./mvnw -ntp jib:build"
        }
    }
        stage ('Clean up') {
            steps {
                sh 'mvn clean'
            }
        }
    }

}
