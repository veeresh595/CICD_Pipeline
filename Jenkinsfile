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
   script{
           nexusArtifactUploader artifacts: [[artifactId: 'springboot', classifier: '', file: 'target/uber.jar', type: 'jar']], 
      	   credentialsId: 'nexus', groupId: 'com.example<', nexusUrl: 'tools.veereshdevops.info:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'Javapps-releas e', version: '1.0.0'
   
    }
   }
  }
 }  
} 


