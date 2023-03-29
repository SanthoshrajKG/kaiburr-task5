pipeline {
    agent any
    tools{
        maven 'maven'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/SanthoshrajKG/kaiburr-task5']]])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t santhoshraj/kaiburr-task5 .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerhubpwd')]) {
                        sh 'docker login -u santhoshraj2002 -p ${dockerhubpwd}'
                    }
                    sh 'docker push santhoshraj/kaiburr-task5'

                }
            }

        }

    }

}