def branch
def revision
def registryIp

pipeline {
    agent {
        docker { image 'jenkinsci/slave:latest' }
        }
    options {
        skipDefaultCheckout true
    }
    stages ('Download GitHub repo') {
        stage ('checkout') {
            steps{
                script {
                    print "Checkout stage is launched"
                    def mycommit = checkout scm
                    for (val in mycommit) {
                        print "key = ${val.key}, value = ${val.value}"
                    }
                    revision = sh(script: 'git log -1 --format=\'%h.%ad\' --date=format:%Y%m%d-%H%M | cat', returnStdout: true).trim()

                }
            }
        }
        stage ('build and push artifact') {
            steps {
                script {
                    script {
                      sh "docker build --no-cache . -t hammer2900/somo2900:${revision} --build-arg REVISION=${revision}"
                      sh "docker images"
                    //   docker.withRegistry("") {
                    //   sh "docker push ${registryIp}:${revision}"
                    //   sh "echo registryIp=818353068367.dkr.ecr.eu-central-1.amazonaws.com/tony > build.properties"  //HERE SHOULD BE INFO TO PUSH DOCKERIMAGE
                    //   sh "echo buildNumber=${revision} >> build.properties" 
                    }
                }
            }
        }
        stage ('clean workspace'){
            steps{
                cleanWs()
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: 'build.properties'
          }
        }
}
