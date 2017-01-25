#https://docs.docker.com/engine/reference/commandline/build/
if [ -z $CURRENT ]; then
	CURRENT=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
fi

docker build --no-cache=true -t dayreiner/splunk:6.5.1-monitor -f ./enterprise/Dockerfile $CURRENT
docker build -t dayreiner/splunk:latest -f ./enterprise/Dockerfile $CURRENT
