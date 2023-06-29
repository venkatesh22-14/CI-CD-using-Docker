pipeline {
    agent any
	
	  tools
    {
       maven "mvn"
    }
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'master', url: 'https://github.com/venkatesh22-14/CI-CD-using-Docker.git'
             
          }
        }
	 stage('Execute Maven') {
           steps {
             
                sh 'mvn package'             
          }
        }
        

  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t samplewebapp:latest .' 
                sh 'docker tag samplewebapp kvg345/samplewebapp:latest'
                //sh 'docker tag samplewebapp kvg345/samplewebapp:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
          sh  'docker push kvg345/samplewebapp:latest'
        //  sh  'docker push kvg345/samplewebapp:$BUILD_NUMBER' 
        }
                  
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps 
			{
                sh "docker run -d -p 8003:8080 kvg345/samplewebapp"
 
            }
        }
 stage('Run Docker container on remote hosts') {
             
            steps {
                sh "docker -H ssh://jenkins@172.31.28.25 run -d -p 8003:8080 kvg345/samplewebapp"
 
            }
        }
    }
	}
    
