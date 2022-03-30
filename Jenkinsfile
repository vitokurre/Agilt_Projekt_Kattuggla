pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/vitokurre/Agilt_Projekt_Kattuggla.git'
            }
        }
        stage('Robot Framework') {
            steps {
                sh 'robot --variable BROWSER:headlesschrome -d Results Tests'
            }
            post {
                always {
                    script {
                          step(
                                [
                                  $class              : 'RobotPublisher',
                                  outputPath          : 'Results',
                                  outputFileName      : '**/output.xml',
                                  reportFileName      : '**/report.html',
                                  logFileName         : '**/log.html',
                                  disableArchiveOutput: false,
                                  passThreshold       : 50,
                                  unstableThreshold   : 40,
                                  otherFiles          : "**/*.png,**/*.jpg",
                                ]
                          )
                    }
                }
            }

        }
    }
    
}
