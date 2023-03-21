pipeline {
    agent any


    stages {
        stage('git pull') {
            steps {
                git branch: 'main',
                    url: 'git@github.com:anish-9999/software-prod-miniproj.git'
            }
        }

        stage('Create SnapShot') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage ('Build Docker Image') {
            steps {
                sh 'docker build -t anish-9999/software-prod-miniproj .'

            }
        }

        stage ('Push Docker Image to DockerHub') {
            steps{
                sh 'docker push anish-9999/software-prod-miniproj'
            }

        }

//         stage('Run ansible for deployment') {
//             steps {
//                 ansiblePlaybook colorized: true, disableHostKeyChecking: true, installation: 'Ansible', inventory: './inventory', playbook: 'calc_deploy.yml'
//             }
//         }

    }
}