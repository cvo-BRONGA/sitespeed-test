pipeline {
  agent {
    docker {
      label 'pipes-azure-east-agents'
      registryCredentialsId 'artifactory-jfrog-credentials'
      registryUrl 'https://gapinc-docker-repo.jfrog.io/'
      image 'gapinc-docker-repo.jfrog.io/s-sell-brodps/webapps-toolchain-jenkins-azure-agent-node18:1.0.0'
      args '--group-add 985 -v /var/run/docker.sock:/var/run/docker.sock --shm-size=1g --network host'
    }
  }

    stages {
        stage('Test') {
            steps {
                echo 'run sitespeed cmd'
                // this uses ${WORKSPACE} instead of $(pwd) not sure what is the difference but this doesn't allow the --plugins.add flag
                // sh 'docker run -v ${WORKSPACE}:/sitespeed.io sitespeedio/sitespeed.io --outputFolder output https://www.gap.com/ https://bananarepublic.gap.com/'
                // an attempt to unzip a file within the pipeline
                // unzip zipFile: 'Sitespeed_20Results.zip', dir: "/var/jenkins_home/jobs/sitespeed-test-2/builds/${currentBuild.number}/htmlreports/"
                sh 'docker run --rm -v "$(pwd):/sitespeed.io" sitespeedio/sitespeed.io --outputFolder output https://www.gap.com https://bananarepublic.gap.com/ --plugins.add analysisstorer'
              
            }
        }
    }
    post {
        success { 
            echo 'store sitespeed results in a directory called output'
            publishHTML (target : [allowMissing: false,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: './output',
                reportFiles: 'sitespeedResults.html',
                reportName: 'Sitespeed Results',
            ])
        }
    }
}