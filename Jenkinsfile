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

  
}
}


