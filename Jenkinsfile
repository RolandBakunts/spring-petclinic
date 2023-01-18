pipeline {

    environment { 
        DOCKERHUB_CREDENTIALS=credentials('dockerhub-credentials')
        MERGE_REPOSITORY='mr'
        MAIN_REPOSITORY='main'
    }

    agent {
        // If you want to add agents below, change this to "none".
        node {
            label 'ubuntu-agent'
        }
    }
    stages {
        stage('Pipeline for main branch') {
            // You can add your own remote agent server.

            // agent {
            //     label "linux"
            // }
            when {
                branch 'main'
            }
            stages {
                stage('Build Docker Image') {
                    steps {
                        sh 'docker build -t $DOCKERHUB_CREDENTIALS_USR/$MAIN_REPOSITORY:$BUILD_NUMBER .'
                    }
                }

                // stage('Login DockerHub') {
                //     steps {
                //         sh 'docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW'
                //     }
                // }

                // stage('Deloy Docker Image to DockerHub') {
                //     steps {
                //         sh 'docker push $DOCKERHUB_CREDENTIALS_USR/$MAIN_REPOSITORY:$BUILD_NUMBER'
                //     }
                // }
            }
        }

        // stage('Pipeline for Merge Request') {
        //     // You can add your own remote agent server.

        //     // agent {
        //     //     label "linux"
        //     // }

        //     when {
        //         branch 'PR-*'
        //     }

        //     stages {
        //         stage('Generate code style report and save it as artifact') {
        //             steps {
        //                 sh './gradlew checkstyleMain'
        //                 archiveArtifacts artifacts: 'build/reports/checkstyle/main.html'
        //             }
        //         }

        //         stage('Test') {
        //             steps {
        //                 sh './gradlew compileJava'
        //             }
        //         }

        //         stage('Build without test') {
        //             steps {
        //                 sh './gradlew build -x test'
        //             }
        //         }

        //         stage('Build Docker Image') {
        //             steps {
        //                 sh 'docker build -t $DOCKERHUB_CREDENTIALS_USR/$MERGE_REPOSITORY:$BUILD_NUMBER .'
        //             }
        //         }

        //         stage('Login DockerHub') {
        //             steps {
        //                 sh 'docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW'
        //             }
        //         }

        //         stage('Deloy Docker Image to DockerHub') {
        //             steps {
        //                 sh 'docker push $DOCKERHUB_CREDENTIALS_USR/$MERGE_REPOSITORY:$BUILD_NUMBER'
        //             }
        //         }
        //     }
        // }

        post {
            always {
                sh 'docker logout'
            }
        }
    }
}