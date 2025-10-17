set -e


NAME="kubernetes-node-api"
USERNAME="driedsoba"
IMAGE="$USERNAME/$NAME:latest"


echo "Building Docker image..."
docker build -t $IMAGE .


echo "Pushing Docker image to registry..."
docker push $IMAGE

echo " Applying Kubernetes configurations..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo " Getting pods..."
kubectl get pods

echo " Getting services..."
kubectl get services

echo "Fetching the main service"
kubectl get services $NAME-service
