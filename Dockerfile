from ubuntu:20.04

# Get basic system packages in place. 
#
# Mostly for debugging right now. Need to make sure we have dev, test, load 
# test and prod buildable containers at some point.
# 
# All effectively on one line so that it is all in one image layer. Helps
# with build times later down the road.
run apt-get update --assume-yes && apt-get upgrade --assume-yes \
    && apt-get install --assume-yes \
        net-tools \
        python3-pip \
		procps \
	    telnet

# Choosing to run all custom code from /opt as a standard. Helps with debugging
# and during production troubleshooting in dire cases.
workdir /opt/service

# Load up requirements.txt so we can install our python dependencies.
# This happens in a single layer as well.
copy requirements.txt .

expose 8000

run pip3 install -r requirements.txt

cmd ["flask", "run", "--host=0.0.0.0"]