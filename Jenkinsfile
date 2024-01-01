pipeline {
    agent { label 'kaniko'}

    stages {
        stage("Cleanup Workspace") {
            steps {
                cleanWs()
            }
        }

        stage("Checkout from SCM"){
            steps {
                git url: 'https://github.com/DafaWiratama/jm-angular-testing', branch: 'master'
            }
        }

        stage('Build and push to registry') {
            steps {
                container(name:'kaniko', shell: '/busybox/sh') {
                    sh """#!/busybox/sh

                        /kaniko/executor \
                        --cleanup \
                        --compressed-caching=false \
                        --log-format=text \
                        --reproducible \
                        --context `pwd` \
                        --dockerfile `pwd`/Dockerfile \
                        --use-new-run \
                        --destination=harbor.jaya-makmur.cloud/jaya-makmur/jm-angular-testing:latest
                    """
                }
            }
        }
    }
}
