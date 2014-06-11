Webexample
==========

This is an example of packaging and running a Phoenix application with docker.

Quick start:

    $ make
    $ docker run -p 8001:8001 webexample


## Overview

The build process works as follows:

  * clone this repo to `docker/webexample`
  * build a docker image named `webexample` using `docker/` as the context

If you are running docker inside a VM, you may need to perform a few additional
steps manually. One of them is adding a port forwarding rule in the VM settings
to map a port from the VM to the host OS.

Note that it is OK to hardcode the port number used inside the image the
way we did. When you run the image, you can map the container port to any other
available port on the host (or the VM in the case when docker itself is running
in a VM).


## Points of interest

### Elixir dependencies

The current setup fetches dependencies before building the docker image to
speed up the rebuild process. Depending on how you are planning to use docker,
you might want to include that as part of the image build or, alternatively,
add a rule to the Makefile that will run `mix deps.update --all` after pulling
the latest changes with git.

### Iterative development

An important thing to understand about this example: it demoes how one would
package an Elixir app in a docker image for deployment. This works fine if you
don't need to rebuild the image too often. This workflow differs in a number of
ways from using docker as part of the development process.

For the latter case you will have to come up with ways to make docker
automatically pick up the latest version of your project's code and update any
other environment settings in the presences of code changes. You could mount
the directory with your project code as a host volume in the running docker
container (passing the `-v` option to `docker run`). That implies building the
project either when the container starts or beforehand.

### Alternative build strategies

With docker it is possible to create "builder images". Those are images that
produce build artifacts when run. You could create such an image for your
project to have the compilation and running phases separate but still using the
same environment and Elixir versions (enforced via a single base image). This
workflow is not explored in the present demo.
