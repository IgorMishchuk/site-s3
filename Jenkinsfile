pipeline{
    agent any
    stages{
        stage('Upload'){
            steps{
                withAWS(){
                    s3Upload file:'/var/jenkins-docker/nginx/web/index.html', bucket:"site-s3-${BRANCH_NAME}", path:'index.html', contentType:'text/html', acl:'PublicRead', tags:'{Name:Static index.html}'
                }
            }
        }
    }
}