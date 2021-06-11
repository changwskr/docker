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

cp ./$svc.dockerfile ./$svc/dockerfile

cd ./$svc
docker build -t $svc:latest .
rtn=$?
if [ $rtn -eq 1 ]
then
	echo "docker build file"
else
	echo "============================================================="
	docker images
	echo "============================================================="
fi

