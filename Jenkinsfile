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
 }  
} 


