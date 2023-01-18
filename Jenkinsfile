pipeline {

    environment { 
        DOCKERHUB_CREDENTIALS=credentials('rolandgryddynamics-dockerhub')
        MERGE_REPOSITORY='mr'
        MAIN_REPOSITORY='main'
    }

    agent {
        node {
            label 'ubuntu-master'
        }
    }
    stages {
        stage('nested jenkinsfile for main') {
            when {
                branch 'main'
            }
            stages {
                stage('Building Distributable Package') {
                    steps {
                        echo 'Building'
                    }
                }
                stage('Archiving Package') {
                    steps {
                        echo 'Archiving Aritfacts!'
                    }
                }
            }
        }

        // stage('checkstyle') {
        //     when {
        //         branch 'PR-*'
        //     }
        //     steps {
        //         sh './gradlew checkstyleMain'
        //         archiveArtifacts artifacts: 'build/reports/checkstyle/main.html'
        //     }
        // }
                
        // stage('test') {
        //     when {
        //         branch 'PR-*'
        //     }
        //     steps {
        //         sh './gradlew compileJava'
        //     }
        // }

        // stage('build') {
        //     when {
        //         branch 'PR-*'
        //     }
        //     steps {
        //         sh './gradlew build -x test'
        //     }
        // }
    
        // stage('Build Docker image') {
        //     when {
        //         branch 'PR-*'
        //     }
        //     steps {
        //         echo 'Login to DockerHub'
        //         sh 'docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW'

        //         sh 'docker build -t $DOCKERHUB_CREDENTIALS_USR/$MERGE_REPOSITORY:$BUILD_NUMBER .'
        //     }
        // }

        // stage('Login DockerHub') {
        //         steps {
        //     }
        // }

        // stage('deploy Docker image PR') {
        //     when {
        //         branch 'PR-*'
        //     }
        //     steps {
        //        sh 'docker push $DOCKERHUB_CREDENTIALS_USR/$MERGE_REPOSITORY:$BUILD_NUMBER'
        //     }
        // }

        // stage('Build Docker image Master branch') {
        //     when {
        //         branch 'main'
        //     }
        //     steps {
        //         echo 'Login to DockerHub'
        //         sh 'docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW'

        //         sh 'docker build -t $DOCKERHUB_CREDENTIALS_USR/$MAIN_REPOSITORY:$BUILD_NUMBER .'
        //     }
        // }

        // stage('deploy Docker image master branch') {
        //     // You can add your own remote agent server
            
        //     // agent {
        //     //   label "linux"
        //     // }
        //     when {
        //         branch 'main'
        //     }
        //     steps {
        //         sh 'docker push $DOCKERHUB_CREDENTIALS_USR/$MAIN_REPOSITORY:$BUILD_NUMBER'
        //     }
        // }

        // post {
        //     always {
        //         sh 'docker logout'
        //     }
        // }
    }
}