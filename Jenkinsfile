pipeline {
    agent { label "robot" } // run on an agent, which has Robot Framework installed

    stages {
        stage("Run Robot") {
            steps {
                // --nostatusrc prevents your job from failing automatically if any
                // tests fail. This is then later handled with the RF plugin with
                // pass thresholds
                sh script: "robot database.robot", returnStatus: true
            }
        }
    }

    post {
        always {
            robot outputPath: 'logs', passThreshold: 80.0, unstableThreshold: 70.0
        }
    }
}