FROM alco/ubuntu-elixir:v0.13.3
MAINTAINER Alexei Sholik <i.dont.really@maintain.it>

## Prerequisites ##

# Install anything else you want to have as part of your container.
# In this case we need git for Mix to pick up git-deps from mix.lock.
RUN sudo apt-get update
RUN sudo apt-get install -y git

RUN mix local.rebar
RUN mix local.hex --force
RUN mix hex.update


## Install the app ##

# We assume the deps have already been fetched
ADD webexample /deploy/webexample


## Compile ##

# It is important to set MIX_ENV *before* compiling the code
ENV MIX_ENV prod

# Setting working directory to the app's root should also happen before
# compilation
WORKDIR /deploy/webexample

# This will run during build process, so that we don't need to compile
# anything when running the container
RUN mix compile


## Set up running environment ##

# If you're running docker in a VM (for instance, if you're on OS X), you'll
# have to add a port forwarding rule for this port in the VM settings to make
# it available on the host OS
ENV PORT 8001

# Could have set ENTRYPOINT here, but I couldn't not override it from command
# line. Setting CMD allows us to run the container with e.g. bash in the
# future if needed

# We don't use 'mix phoenix.start' here because we need to pass additional
# options to the run task
CMD ["mix", "run", "-e", "Webexample.Router.start", \
                                "--no-deps-check", "--no-compile", "--no-halt"]
