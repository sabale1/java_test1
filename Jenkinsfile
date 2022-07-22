pipeline {
  agent any
  tools {
    maven 'MAVEN_HOME-3.6.3'
  }
  
	environment{
	registry="prasabale/java_project"
	registryCredential='Docker_Access'
	//dockerImage=''
	}
	
    //each branch has 1 job running at a time
  options {
    disableConcurrentBuilds()  
  }

  stages{
	stage('git') {
		steps{
		git 'https://github.com/sabale1/java_test1.git'
		}	
	}
   
   stage('Code Coverage') {
        steps{
          	script {
                	git 'https://github.com/sabale1/java_test1.git',
                 	echo 'Code Coverage'
                 	jacoco()
                    }
                     	
            }
    }

	stage('docker Image'){
		steps{
			script{
		 	sh "docker build -t prasabale/java_project ."	
			}
			}
		}
		
stage('Registring image') {
		steps{
			script{
				docker.withRegistry('',registryCredential){
				//dockerImage.push()
				sh "docker push prasabale/java_project"
				}
			}
		}
	}


  }
	
}
