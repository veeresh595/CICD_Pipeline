pipeline{
 agent any
  tools{
    maven 'maven'
}

 environment{

  SCANNER_HOME=tool 'sonar-scanner'

}
  stages{

    stage('git checkout'){

    steps{

   git branch:'main',url:'https://github.com/veeresh595/CICD_Pipeline.git'


   }
  }
       stage('Unit test'){

        steps{

          sh 'mvn test'

    
     }
  
    } 
     
       stage('Integration test'){

       steps{
            
	    sh 'mvn verify -DskipUnitTests'
      
   }
  }
      stage('Maven build'){
      steps{
          
	  sh 'mvn clean package'

   }
  }
       stage('code analysis'){
       
       steps{
       script{

           withSonarQubeEnv(credentialsId: 'sonar') {

           sh 'mvn clean package sonar:sonar'

     }	   
    }    
   } 
  }        
    stage('Quality gate check'){
    steps{
    script{
           waitForQualityGate abortPipeline: false, credentialsId: 'sonar'
    } 
   }  
  }

   stage('upload to nexus'){
   steps{
   script{ def readPomVersion = readMavenPom file: 'pom.xml'
           def nexusRepo= readPomVersion.version.endsWith("SNAPSHOT") ? "Javapps-snapshots":"Javapps-release" 

           nexusArtifactUploader artifacts: [[artifactId: 'springboot', classifier: '', file: 'target/Uber.jar', type: 'jar']], credentialsId: 'nexus', groupId: 'com.example', nexusUrl: 'tools.veereshdevops.info:8081', nexusVersion: 'nexus3', protocol: 'http', repository: nexusRepo, version:"${readPomVersion.version}" 
    }
   }
  }

      stage('Docker image build'){
      steps{
      script{
             sh 'docker image build -t $JOB_NAME:v1.$BUILD_ID .'
	     sh 'docker image tag $JOB_NAME:v1.$BUILD_ID veeresh595/$JOB_NAME:v1.$BUILD_ID'
             sh 'docker image tag $JOB_NAME:v1.$BUILD_ID veeresh595/$JOB_NAME:latest'
    }
   }
  }

   stage('Docker image push'){

   steps{
   script{
          withCredentials([gitUsernamePassword(credentialsId: 'dockerhub', gitToolName: 'Default')]) {
           sh 'docker login -u veeresh595 -p $(dockerhub_credentials)'
	   sh 'docker push $JOB_NAME:v1.$BUILD_ID veeresh595/$JOB_NAME:v1.$BUILD_ID' 
           sh 'docker push $JOB_NAME:v1.$BUILD_ID veeresh595/$JOB_NAME:latest'
}  

    }  
   }
  }
 }  
} 


