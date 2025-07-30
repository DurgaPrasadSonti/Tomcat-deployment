pipeline {
    agent any

    tools{
        jdk 'jdk11'
        maven 'maven3'
    }
    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Ushaprasad143/Petclinic-Jenkins-Project.git'
            }
        }
        
         
         stage('Compile') {
            steps {
                sh "mvn clean compile"
            }
        }
        
         stage('Build') {
            steps {
                sh "mvn clean package -DskipTests=true"
            }
        }
        
        stage('Deploy to Tomcat') {
            steps {
                sh "cp target/petclinic.war /opt/apache-tomcat-9.0.90/webapps"
            }
        }
        
       
       
        
       
       
       
        
    }
}
