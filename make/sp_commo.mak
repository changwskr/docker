svc=`echo $0 | cut -c1-8`
if [ ! -d ./$svc ]
then
	mkdir ./$svc	
fi

if [ ! -f ./$svc.dockerfile ]
then
	echo "./$svc.dockerfile is not found"
	exit
fi

pid=`docker ps | grep $svc | awk '{print $1}'`
if [ "$pid" != "" ]
then
	echo "---------------------------1"
	echo docker stop $svc
	docker stop $svc
fi

cid=`docker ps -a | grep $svc | awk '{print $1}'`
if [ "$cid" != "" ]
then
	echo "---------------------------2"
	echo docker rm $cid
	docker rm $cid
fi

did=`docker images $svc | grep $svc | awk '{print $3}'`
if [ "$did" != "" ]
then
	echo "---------------------------3"
	echo docker rmi $did
	docker rmi $did
fi

cp ./$svc.dockerfile ./$svc/dockerfile
cp $HOME/src/$svc.js ./$svc

cd ./$svc
docker build -t $svc:latest .
rtn=$?
if [ $rtn -eq 1 ]
then
	echo "docker build fail"
else
	echo "============================================================="
	docker images
	echo "============================================================="
	docker create --name $svc $svc:latest
	docker start $svc
fi

