pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "M3"
    }
    

    stages {
        
      stage('Clone repository') {
        /* Cloning the Repository to our Workspace */

        checkout scm
    }
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
               // git 'https://github.com/jglick/simple-maven-project-with-tests.git'

                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true clean package"

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
                post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    //junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts 'target/*.jar'
                }
            }
        }
          
      stage('Build image') {
        /* This builds the actual image */

        app = docker.build("mariakritou/casecoursework")
    }
          
            stage('Push image') {
   
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
            } 
                echo "Trying to Push Docker Build to DockerHub"
    } 
        }
    }

