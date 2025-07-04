// Jenkinsfile

pipeline {
    agent any

    stages {
        stage('Container  Build') {
            agent {
                docker {
                    image 'python:3.9-slim'
                    args '--user root'
                }
            }
            steps {
                echo 'Iniciando o Build...'
                sh 'pip install -r requirements.txt'
                echo 'Build concluído com sucesso!'
            }
        }
        stage('Container Test') {
            agent {
                docker {
                    image 'python:3.9-slim'
                    args '--user root'
                }
            }
            steps {
                echo 'Iniciando o Teste...'
                sh 'pip install -r requirements.txt'
                sh 'pytest -v --junitxml=test-results.xml tests/'
            }
            post {
                always {
                    junit 'test-results.xml'
                }
            }
        }
    }
    post {
        always {
            echo 'Pipeline finalizado. Limpando o workspace.'
            cleanWs()
        }
    }
}
