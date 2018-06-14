Congratulations! You've solved your first koan and unlocked more koans. Drink that in for second before I bastardize a French culinary phrase.

## Mise en place

One meaning of [mise en place](https://en.wikipedia.org/wiki/Mise_en_place) is "everything in its place." Just as a professional cook will have her salt and pepper, chopped vegetables, garnishes and cigarettes arranged the way she likes to the right and the left of her stove, so too will you as a developer have your tools set up and arranged on your machine. Mise en place will change depending on the menu the cook is responsible for reproducing, just as your tools will change depending on the problems you're trying to solve and the things you are trying to build. There's no one mise-en-place but this tutorial will present a mise-en-place you can look at and reflect on before deciding on your own. It will include:

1. Terminal -- Bash.
2. Text editor -- Atom.
3. Source control -- Git.
4. Git host -- Github.
5. Containerization -- Docker

We'll go into each of these in more detail later.

## koan 1.1: Terminal or Console

These koans will require you to become familiar with your terminal.

When you've opened your terminal and see something like [the image](https://en.wikipedia.org/wiki/Bash_(Unix_shell)) on the right side of this page, you're ready to move on.

[reflect for windows](https://duckduckgo.com/?q=how+do+open+terminal+on+windows&t=h_&ia=web)

[reflect for mac](https://duckduckgo.com/?q=how+do+open+terminal+on+mac&t=h_&ia=web)

[reflect for linux](https://duckduckgo.com/?q=how+do+open+terminal+on+linux&t=h_&ia=web)


## koan 1.2: Work Directories

Create a directory in your home folder called "work." Then change into that directory and from inside it, create another directory called "training" and change into it.

When you can type this command without the terminal barfing, you're ready to move on:

`$ cd ~/work/training`

[reflect](http://mally.stanford.edu/~sr/computing/basic-unix.html).  

## koan 1.3: Git

You're reading these koans on Github, which uses a version control system called Git under the hood. Since Github expects you to have Git installed on your machine, go to your terminal and type:

`$ git --version`

If something like the following is returned:

`git version 2.17.0`

...then you're ready to move on.

[reflect](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

## koan 1.4: Create a GitHub Account

Create an account on GiHub.

When you can navigate with your browser to:

`https://github.com/YOUR-USERNAME`

...where YOUR-USERNAME is the name you've chosen to sign up with, you're ready to move on.

## koan 1.5: Fork these koans

Log into your GitHub account and fork these koans.

When you can navigate to:

`https://github.com/YOUR-USERNAME/proscrypt-koans`

...you're ready to move on.

[reflect](https://help.github.com/articles/fork-a-repo/)

## koan 1.6: Clone your Fork

Clone these koans onto your machine from your fork. When you can type:

`$ cd ~/work/training/proscrypt-koans`

...you're ready move on.

[Reflect](https://help.github.com/articles/cloning-a-repository/)

## koan 1.7: Docker

Developers work with other developers, and thus their code must run on other machines. One way to make this easier is to standardize the operating system and environment our application runs in using a set of tools called Docker. When you can type:

`$ docker --version`

and it returns something like:

`Docker version 18.03.1-ce, build 9ee9f40`

...you're ready to move on.

[reflect mac](https://docs.docker.com/docker-for-mac/install/)

[reflect windows](https://docs.docker.com/docker-for-windows/install/)

[reflect linux](https://docs.docker.com/engine/installation/linux/)

## koan 1.7: Docker Compose

While we're at it, let's install Docker Compose. When you can type:

`$ docker-compose --version`

and it returns something like:

`docker-compose version 1.20.1, build 5d8c71b`

...you're ready to move on.

[reflect](https://docs.docker.com/v17.09/compose/install/)

## koan 1.8: Text Editor

If you have a text editor or IDE installed and that you prefer to use, namaste. Otherwise, install Atom. When you can type:

`$ atom . &`

...and it opens up our project, you're ready to move on.

[reflect](https://flight-manual.atom.io/getting-started/sections/installing-atom/)
