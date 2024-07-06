#!/bin/bash

#variable
BUCKET_S3="web.demo.aws.io"
AWS_PROFILE="lab"
BUILD_DIR="build"

#paso1
echo "------------------------"
echo "paso 1 descarga de dependencias"
echo "------------------------"
npm install 

#paso2
echo "------------------------"
echo "paso 2 Contruyendo el proyecto"
echo "------------------------"
npm run build

#paso3
echo "------------------------"
echo "paso 3 Depliegue en S3"
echo "------------------------"

aws s3 sync $BUILD_DIR s3://$BUCKET_S3 --profile $AWS_PROFILE

echo "Despliegue completado"