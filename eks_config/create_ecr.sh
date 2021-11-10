echo -n 'repo name: ' && read NAME

aws ecr create-repository \
--repository-name demo-flask-backend \
--image-scanning-configuration scanOnPush=true \
--region ap-northeast-2
