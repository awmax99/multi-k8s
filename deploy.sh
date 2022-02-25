docker build -t awmax99/multi-client:latest -t awmax99/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t awmax99/multi-server:latest -t awmax99/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t awmax99/multi-worker:latest -t awmax99/multi-worker:$SHA  -f ./worker/Dockerfile ./worker
docker push awmax99/multi-client:latest
docker push awmax99/multi-client:$SHA
docker push awmax99/multi-server:latest
docker push awmax99/multi-server:$SHA
docker push awmax99/multi-worker:latest
docker push awmax99/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployment/client-deployment client=awmax99/multi-client:$SHA
kubectl set image deployment/server-deployment server=awmax99/multi-server:$SHA
kubectl set image deployment/worker-deployment worker=awmax99/multi-worker:$SHA

