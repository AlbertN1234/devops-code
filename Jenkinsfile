peline {
    agent any
        tools {
	        maven 'M2_HOME'      /*that is the maven home, located on Global Configuration */

		    }
		        environment {
			        registry = "albernana/tomcat_image"
				        registryCredential = 'DockerID'
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
																		            when {
																			                    expression
																					                    currentBuild.result == null || currentBuild.result == 'SUCCESS'
																							                }
																									            steps {
																										                    echo "test step"
																												                    sh 'mvn test'
																														                }
																																        }
																																	        stage ('Deploy') {
																																		            steps {
																																			                    script {
																																					                        docker.build registry + ":$BUILD_NUMBER"
																																								                }
																																										            }
																																											            }
																																												            stage ('Clean up') {
																																													                steps {
																																															                sh 'mvn clean'
																																																	            }
																																																		            }
																																																			        }

																																																				}pipeline {
    agent any
    tools {
        maven 'M2_HOME'      /*that is the maven home, located on Global Configuration */

    }
    environment {
        registry = "albernana/tomcat_image"
        registryCredential = 'DockerID'
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
            when {
                expression
                currentBuild.result == null || currentBuild.result == 'SUCCESS'
            }
            steps {
                echo "test step"
                sh 'mvn test'
            }
        }
        stage ('Deploy') {
            steps {
                script {
                    docker.build registry + ":$BUILD_NUMBER"
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
