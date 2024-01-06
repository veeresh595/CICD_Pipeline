pipeline{
 agent any
  tool{
    maven 'maven'
}

 enviornment{
  SCANNER_HOME=tool 'sonar-scanner'

}
  stages{

    stage('git checkout')
    steps{

      git branch:'main',url:'https://github.com/veeresh595/CICD_Pipeline.git'


   }

  }
}


