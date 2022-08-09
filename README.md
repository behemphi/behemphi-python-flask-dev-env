# Purpose

This repo is the home of a proposed standardized development environment for 
all python flask applications. It is meant _only_ to be a starting point
(i.e. fork it) rather than an upstream repo that pushes changes down. 

# Building the Environment

If you are getting a docker env up for the first time you will first need
to install docker and a few other goodies.  Otherwise skip to the 
Dev Env Config section below.

In general, the goal of this project is to separate the code and configuraiton 
of a service from its run time environment. This allows the run time and 
configuration to be more easily maintained. (It's a form of loose coupleing)

## Machine Config

You will need to install docker on your machine.  The preferred way to do so
these days is via Homebrew:

`brew install --cask docker`

!!! note

  There are other ways to install Docker, however this one avoids the need 
  for other components such as virtualbox, etc.

!!! warning

  The first time you run the docker daemon, launch it via the GUI and accept
  the terms of service or you'll end up in a bit of a loop trying to trouble-
  shoot


## Dev Env Config (Tutorial Style)

This environment was conceived under the notion that any Tackle dev, at any 
time could start work in a repo based on it within 15 minutes of deciding to 
do so.

`docker build --tag wine-purse .`

You can verify you have a good build by running the container interactively:

```
docker run -it \
  --env-file env-dev.txt \
  --publish 5000:5001 \
  --volume "/Users/boyd.hemphill/code/tackle-python-flask-dev-env/:/opt/service" \
  wine-purse bash 
```

This leaves you sitting as the `root` user as a bash prompt. Try the following 
to get an idea of how development will work. 
1. Container: `cd /opt/app`
1. Container: `cat __init__.py`
1. Local Code Editor: Add the comment `# I am coding` to the top 
   of `__init__.py` and save
1. Container: `cat __init__.py`

Now you see the file has your addition.  What you are seeing is the ability to
work on your workstation (laptop) while using a container to run the software
while changes to the running code are happening in real time.  

Now see that the environment variables are set. In the container:

`env | grep`

You will see settings from the `env-dev.txt` file.

Try some other stuff to satisfy your curiousity about that container. 

Once you are done poking around in the container, exit (container will stop) and continue.

## Hello World

ex


# Code, Config and Runtime





