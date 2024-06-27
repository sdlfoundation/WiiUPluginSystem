mkdir -p ./Rom && rm -rf ./Rom/* && \

if [ -z "$(docker images -q wups 2> /dev/null)" ]; then
	docker build -t wups ./
else
  	echo 'Skipping build'
fi

docker run \
	-v $(pwd):/wups \
	wups
