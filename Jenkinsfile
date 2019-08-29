node {  
    stage('Build') { 
      steps{
        script{
            print "Checkout stage is launched"
            def mycommit = checkout scm
            for (val in mycommit) {
                print "key = ${val.key}, value = ${val.value}"
            }
      revision = sh(script: 'git log -1 --format=\'%h.%ad\' --date=format:%Y%m%d-%H%M | cat', returnStdout: true).trim()
  }
    }
    stage('Deploy') { 
      steps {
        container('docker') {
            script {
                    sh "ls"
                    sh "pwd"
                }   
            }
        }
    }
}
