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

In order to take advantage of some local feedback loops, and keep git hooks
under source control, run the following command:

`git config --local core.hooksPath .githooks/`

Now git will look for hooks in that directory and the team can share changes
to them in the usual way we manage code. 

## Dev Env Config (Tutorial Style)

This environment was conceived under the notion that any Tackle dev, at any 
time could start work in a repo based on it within 15 minutes of deciding to 
do so.

`docker build --tag wine-purse .`

You can verify you have a good build by running the container interactively:

```
docker compose up
```

Visit the fancy app [http://127.0.0.1:8000](http://127.0.0.1:8000)

### Tooling Tips

Docker provides an outstanding GUI for developers to leverage. Find the 
Docker Desktop application. 

1. In the left menu, click on the "Containers" icon. 
   1. You will see a list with your one stack in it.
   1. Click to expand the stack.  
1. Click on the Name of the container (not the stack)
   1. you are looking at the container Logs!
   1. Reload your browser and see a new request come up
1. In the upper right are some controls in circles. 
   1. Click on the CLI control and type.
      1. This leaves you sitting as the `root` user at a shell prompt. Try 
         the following to get an idea of how development will work. 
         1. Container: Type `bash` to get a more familiar and functional shell.
         1. Container: `cd /opt/app`
         1. Container: `cat __init__.py`
         1. Local Code Editor: Add the comment `# I am coding` to the top 
            of `__init__.py` and save
         1. Container: `cat __init__.py`
    1. In the running continer issue the command: `env | grep FLASK`
       1. You will see the values that are set in the containers environment
          from the `docker-compose.yml` file.
 1. Local Code Editor: Edit app/routes.py and change the string to 
    "Hello Tackle world"
    1. Note that when you save the file the logs role to show the server 
       restarted. This is real time development based on a Flask construct
       of running with the `FLASK_ENV` set to "development"
    1. Reload your browser and see that your change took effect. This works 
       because the code on your workstation is mounted as if in the running
       container. Changes locally are reflected in the container in real time.

Once you are done poking around in the container, exit (container will stop) 
and continue.

### VS Code

!!! Note that we have not yet adopted and IDE as a team. This is just notes for
    the strawman implementation of this repo.


System Python on the Mac is generally not supported by IDEs these days.  You
will need to install Python yourself.

`brew install python3`

[ref](https://code.visualstudio.com/docs/python/python-tutorial#_macos)

You will then need to install the Python extention to VS code. 
[Click here](https://marketplace.visualstudio.com/items?itemName=ms-python.python) to
go to the website and follow the directions. 

Next is to install the linter. We are using `pylint` Add

```json
{
    "python.linting.pylintEnabled": true,
}
```

To your `settings.json` file. 

## Building and Testing

From the tooling tips above, be sure you are familiar with the Docker Desktop 
and how to find the logs of your running container. 

### Build Metrics 

#### Linting

We use a stock version of Pylint with the single exception that our line length moves
from 80 to 88. See `.pylintrc` for details.

Manually run the linter with the command:

`docker compose run web pylint --recursive=y /opt/service`

Output will come directly to your CLI and will be present in the logs of the container
you can find in Docker Desktop.

#### Code Complexity



### Testing

`docker compose 


