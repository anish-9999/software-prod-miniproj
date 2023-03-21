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

 	stage('Docker Build Image')
        {
            steps{
                script{
                    imageName = docker.build "anish9999/calc_img"
                }
            }
        }
        stage('Push Docker Image')
        {
            steps{
                script{
                    docker.withRegistry("", 'docker_jenkins' ){
                        imageName.push()
                    }
                }
            }
        }

//         stage('Run ansible for deployment') {
//             steps {
//                 ansiblePlaybook colorized: true, disableHostKeyChecking: true, installation: 'Ansible', inventory: './inventory', playbook: 'calc_deploy.yml'
//             }
//         }

    }
}