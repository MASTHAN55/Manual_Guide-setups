1. Server creation.
   * create 3-servers, t2.medium (1-master, 2-slave servers).

2. Do all servers.
   * install docker.
     yum install docker -y
   * docker init [connect all servers with token].

3. give permissions [Do master server].
   chmod 777 /var/run/docker.sock           // giving permissions for docker.sock 
   systemctl daemon-reload
   systemctl restart docker.service

3. Do master server.
   * install jenkins.

        pipeline {
    agent any
    
    stages {
        stage('checkout') {
            steps {
                git 'https://github.com/MASTHAN55/dockermsproject.git'
            }
        }
        stage('build') {
            steps {
                sh 'docker build -t $image .'
            }
        }
        stage('tag') {
            steps {
                sh 'docker tag $image $repo'
            }
        }
        stage('push') {
            steps {
                sh 'docker login -u masthan733 -p $password'
                sh 'docker push $repo'
            }
        }
        stage('deploy') {
            steps {
                sh 'docker stack deploy -c docker-compose.yml hello'
            }
        }
    }
}

docker stack ls
docker stack rm paytm



     DOCKER FILE	: To create image by automation.
     DOCKER COMPOSE	: To create multiple containers on single server.
     DOCKER SWARM	: To create multiple containers oMultiple servers.
     DOCKE STACK	: Docker swarm + Docker compose










