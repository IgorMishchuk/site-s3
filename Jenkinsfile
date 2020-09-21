pipeline{
    agent any
    stages{
        stage('Upload'){
            steps{
                withAWS(){
                    s3Upload file:'/var/weissbeerger-docker/nginx/web/index.html', bucket:'weissbeerger-s3', path:'index.html', contentType:'text/html', acl:'PublicRead', tags:'{Name:Weissbeerger static index.html}'
                }
            }
        }
    }
}