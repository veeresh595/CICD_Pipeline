pipeline{
 agent any
  tools{
    maven 'maven'
}

 enviornment {
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


