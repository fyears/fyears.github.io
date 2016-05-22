---
published: true
layout: post
title: Docker for Windows beta setup
tags:
  - technology
  - python
  - r
  - data science
categories: technology
---

## what

While developing on Windows, sometimes I need to switch to a *nix-like environment. Right now Docker has released the [Docker for Windows (beta)](https://beta.docker.com/). But the documents are lacking and I did not use Docker too much before, so sometimes I got confused, and here are some notes.

## docker installation

Currently Docker for windows and mac are inside beta, so we need to [register](https://beta.docker.com/) and wait for the download link and activation code.

Moreover, we need a Windows 10 pro + with the Hyper-V virtual machine engine enabled. Virtualbox is unusable while using Docker based on Hyper-V. And we may need to configure the Virtual Switch before or after installing Docker, unless we do not have any configuration changed before.

After installation, we get a `MobyLinuxVM` virtual machine in Hyper-V Manager. And also the disk is defaultly located at `C:\Users\Public\Documents\Hyper-V\Virtual hard disks` called `MobyLinuxVM.vhdx`. The virtual disk file is always increasing and could become really huge.

## start Docker and manage file sharing

If we want to mount a directory / folder, we need to manage the local **drive(s)** available to the containers. Only after that we can share the directories on that drive to containers. It's confused at first time, but after figuring out the concepts it's easy to understand.

1. Double-click the "Docker for Windows" in the start menu.

2. Right-click on the Docker mascot on the notification area on the taskbar, then "Settings..." then "Manage shared drives..." then select the drives then "Ok". User password is needed.

## start, commit, shutdown the images

On Windows, `PowerShell` (or `Git Bash`) (not `cmd` though) is the (better) terminal in *nix replacement. After double-clicking the "Docker for Windows" in the start menu, we could run this inside `PowerShell` to check the status.

```bash
docker info
docker ps
docker images
```

[jupyter/datascience-notebook](https://github.com/jupyter/docker-stacks/tree/master/datascience-notebook) is one of the official docker image by Python Jupyter Project. We could (should) use it if we are doing Python / R / data science development. But pay attention that the image is huge (5 ~ 10 GB).

```bash
docker pull jupyter/datascience-notebook
```

After pulling the images, we could start the images. The simpliest way is

```bash
docker run -d -p 8888:8888 jupyter/datascience-notebook
```

But if we want to mount the directory, we should use `-v from-dir:to-dir`, and if the directory has the white spaces, we should use `-v 'from dir:to dir'`. This really confused me in the beginning, because the quotation marks should wrap the whole parameter string, instead of the substring before the colon! Moreover, if using `jupyter/datascience-notebook`, we should mount the folder as `/home/jovyan/work`. For example,

```bash
docker run -d -p 8888:8888 -v 'C:/all projects:/home/jovyan/work' jupyter/datascience-notebook
# abcde... # container id
```

According to the [#211](https://github.com/jupyter/docker-stacks/issues/211), if we want to grant the `sudo` privilege, we could add `--user root -e GRANT_SUDO=yes`:

```bash
docker run -d -p 8888:8888 --user root -e GRANT_SUDO=yes jupyter/datascience-notebook
```

Attention that in this case we could login the system as `jovyan` and run `sudo apt-get update` **inside** the terminal opened in jupyter notebook in the browser, but if we login the system directly using `docker exec -it`, we would become the user `root`.

After some manipulations,  we could use [`commit`](https://docs.docker.com/engine/reference/commandline/commit/) to save a snapshot of the container.

```bash
docker commit $(docker ps -aq) testcontainer
```

If we want to shut down the container, use 'rm', optionally with `-f`:

```bash
docker rm -f $(docker ps -aq)
```

After running `rm` in the `PowerShell`, we could exit Docker for Windows.

## running

While running `jupyter/datascience-notebook`, we could "log in" to the `bash` inside:

```bash
docker exec -it $(docker ps -aq) /bin/bash
```

Or access the jupyter notebook using browser using one of the addresses:

```
http://docker:8888
http://docker.local:8888
```

Attention: `localhost` is not the right anwser at least on the Windows! It is another confusion at the first time.

## End

So please start happy hacking, using the Linux developement enviroment on Windows.
