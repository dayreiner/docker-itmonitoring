# https://docs.docker.com/engine/reference/commandline/build/
# Build Context:  http://stackoverflow.com/questions/27068596/how-to-include-files-outside-of-dockers-build-context
if [ -z $CURRENT ]; then
	CURRENT=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
fi

docker build --no-cache=true -t dayreiner/splunk-universalforwarder:6.5.1-monitor -f ./universalforwarder/Dockerfile $CURRENT
docker build -t dayreiner/splunk-universalforwarder:latest -f ./universalforwarder/Dockerfile $CURRENT
