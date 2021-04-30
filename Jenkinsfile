  

node {
    def app

    stage('Clone repository') {
        /* Cloning the Repository to our Workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image */

        app = docker.build("wisekingdavid/casecoursework")
    }

   

    stage('Push image') {
   
        docker.withRegistry('https://registry.hub.docker.com', 'davs-dockerHub') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
            } 
                echo "Trying to Push Docker Build to DockerHub"
    }
}
