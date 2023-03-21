pipeline {
    agent any
    
    environment{
	    PATH = "/opt/homebrew/bin:$PATH"
	}

    stages {
        stage('git pull') {
            steps {
                git branch: 'main',
                credentialsId: 'f0e572a0-ac30-4fa3-8897-33219df15a61',
                    url: 'https://github.com/anish-9999/software-prod-miniproj.git'
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
		sh 'docker login -u anish9999 -p dckr_pat_79tvhUvN5wcUiL-Xzw7dCjclBRA https://index.docker.io/v1/'
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