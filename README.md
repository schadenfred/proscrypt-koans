# Chapter 1

Congratulations, you've solved your first koan.

Which if you think about it, is kind of like solving a koan about solving koans.

And which if I think about it, is kind of like saying I've introduced you to the concept of recursion in programming. We'll see more examples of recursion later. For now you may choose to think of recursion as Russell Brand fixing his hair inside a house of mirrors.

I know I do.

And now I'm going to bastardize a French culinary phrase.

## Mise en place

One meaning of [mise en place](https://en.wikipedia.org/wiki/Mise_en_place) is "everything in its place." Just as a professional cook will have her salt and pepper, chopped vegetables, garnishes, unfiltered Gauloises and ashtray arranged the way she likes them to the right and the left of her stove, so too will you as a developer have your tools set up and arranged on your machine. A cook's mise en place will change depending on the menu she's responsible for reproducing, as will yours change depending on the things you're trying to build. The mise presented in this chapter is a plausible starting point, and will include:

1. Terminal -- Bash.
2. Text editor -- Atom.
3. Source control -- Git.
4. Git host -- Github.
5. Containerization -- Docker

Don't worry if you don't know what these things are. Just understand that setting up your mise is one of the most difficult things developers have to do. If I could have you do this chapter later, after first building your confidence first, I would. But I can't.

But you've got this. You can do it.

## koan 1.1: Terminal

If you've never used your terminal before, it is to the developer what the light saber is to Darth Vader, what incognito mode is to the pornography addict, and what lecturing middle aged liberals about race is to Trevor Noah. Use one of these links to figure out how to open it, install it, or both.

[Reflect for windows](https://duckduckgo.com/?q=how+do+open+terminal+on+windows&t=h_&ia=web)

[Reflect for mac](https://duckduckgo.com/?q=how+do+open+terminal+on+mac&t=h_&ia=web)

[Reflect for linux](https://duckduckgo.com/?q=how+do+open+terminal+on+linux&t=h_&ia=web)

When you've opened your terminal and see something like the [image](https://en.wikipedia.org/wiki/Bash_(Unix_shell)) on the right side of this page, you're ready to move on.

## koan 1.2: Work Directories

Here's what my terminal prompt looks like:

`schadenfred@summerseve:~$`

It doesn't matter what your terminal prompt looks like. It might end with a `#` or a `%` or a `$`. When I ask that you enter a command, I'll abbreviate the full prompt to the '$' character, followed by the command:

`$ <command>`

Now let's go to your home directory. To do so, go to your prompt and enter 'cd':

`$ cd`

This changes your directory into your home folder. Now let's make a new directory inside your home folder called 'work':

`$ mkdir work`

To confirm the above command made a work directory in your home folder, request a list of directories:

`$ ls`

You should see output that lists your directories, one of which is the newly created work directory. To confirm that there is nothing inside this new directory, enter:

`$ ls work/`

You should see nothing. Great. Change into the work directory we just made:

`$ cd work`

Make a new directory called 'training,' and change into it.

When you can do this command without the terminal barfing:

`$ cd ~/work/training`

...you're ready to move on:

[Reflect](http://mally.stanford.edu/~sr/computing/basic-unix.html).  

## koan 1.3: Git

You're reading these koans on Github, which uses a version control system called 'Git' under the hood. GitHub expects you to have Git installed:

[Reflect](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

Once you've installed it, do:

`$ git --version`

...and if you see something like this:

`git version 2.17.0`

...you're ready to move on.

## koan 1.4: Create a GitHub Account

Create an account on [GiHub](https://github.com). When you can navigate with your browser to:

`https://github.com/YOUR-USERNAME`

...where YOUR-USERNAME is the name you chose at GitHub, you're ready to move on.

## koan 1.5: Fork these koans

You may think of forking a repository as making a copy of it, and pretending it's your own. Once you can navigate to:

`https://github.com/YOUR-USERNAME/proscrypt-koans`

...you're ready to move on.

[Reflect](https://help.github.com/articles/fork-a-repo/)

## koan 1.6: Set up your keys

GitHub needs you to make a set of keys on your machine. One is public, and one is private. Then GitHub needs you to make a copy of the public key and paste it inside the setting page of your GitHub account. Here are some instructions on how to do that:

[Setup Keys](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)

When you can see an SSH key in your [GitHub Settings](https://github.com/settings/keys) page, move on.

## koan 1.7: Clone your Fork

Copy your fresh new fork of these koans onto your machine, using the 'clone' command.

[Reflect](https://help.github.com/articles/cloning-a-repository/)

When you can do:

`$ cd ~/work/training/proscrypt-koans`

...you're ready move on.

## koan 1.8: Docker

Since developers work with other people, their code must run on other people's machines. To make sure our code works on your machine -- which might be Windows, Mac, or one of the Linux flavors -- use Docker to set up a virtual machine inside your machine, download and install a custom 'image' into the Docker machine, and then spool up several linked 'containers' on that image which will compose our application. For now you may choose to think of Docker, images, and containers as like that movie 'Inception' with Leonardo DiCaprio, that except instead of navigating dreams inside of dreams, you'll be running machines inside of machines.

Install Docker:

[Reflect mac](https://docs.docker.com/docker-for-mac/install/)

[Reflect windows](https://docs.docker.com/docker-for-windows/install/)

[Reflect linux](https://docs.docker.com/engine/installation/linux/)

When you can do:

`$ docker --version`

...and it returns something like:

`Docker version 18.03.1-ce, build 9ee9f40`

...you're ready to move on.

## koan 1.9: Docker Compose

Install Docker Compose:

[Mac](https://docs.docker.com/v17.09/compose/install/#mac)

[Windows](https://docs.docker.com/v17.09/compose/install/#windows)

[Linux](https://docs.docker.com/v17.09/compose/install/#linux)

When you can do:

`$ docker-compose --version`

...and it returns something like:

`docker-compose version 1.20.1, build 5d8c71b`

...you're ready to move on.

## koan 1.10: Text Editor

If you already have a text editor, namaste. Otherwise, install Atom:

[reflect](https://flight-manual.atom.io/getting-started/sections/installing-atom/)

When you can do something similar to:

`$ atom . &`

...and it opens up our project, you're almost there.

Install the 'haml' package:

[reflect](https://flight-manual.atom.io/using-atom/sections/atom-packages/)

Once you can navigate inside Atom to Packages > Settings View > Manage Packages and see that the haml package is installed, you're ready to move on.

## koan 1.11: Checkout this branch

Switch your cloned version of your fork of this code to the 'chapter-1' branch -- the same one you're reading right now. To do so we'll pass a 'checkout' command and several arguments to git. The first argument is '-b' for branch, the second is 'chapter-1' for the name of the branch you want to create, and the third is 'origin/chapter-1' the branch in your forked repo you need to be tracking.

`$ git checkout -b chapter-1 origin/chapter-1`

When you can open a copy of this README.md file in your text editor, you're ready to move on.

[reflect](https://stackoverflow.com/questions/1783405/how-do-i-check-out-a-remote-git-branch)

## koan 1.12:

Orchestrate the building of our starter ProScrypt app and database and the network connections between the two using Docker Compose:

`$ docker-compose build`

Spool it up:

`$ docker-compose up -d`

Create our database:

`$ docker-compose exec web bin/rails db:create`

When you can click [this link](http://localhost:3000/), and it looks like: ![this picture](http://guides.rubyonrails.org/images/getting_started/rails_welcome.png)

...you're ready to move on.

## What you've learned

The hardest parts of being a novelist and heroin addict are getting over your fear of needles and tourniquets and coming out to your family as a narcissist. Let's recapitulate:

  1. You've figured out how to open and use your terminal.
  2. You've set up a professional text editor. There are plenty of good text editors out there including Vim, Emacs, and SublimeText, as well as more powerful IDE's like RubyMine, but Atom is good and free and should work fine on any OS.
  3. You've created an account on GitHub, forked these koans into a repo at your username on GitHub, created keys on your machine and put the public key on GitHub, and cloned your fork of these koans onto your machine. Then you checked out and switched into the chapter-1 branch of the koans, which tracks the chapter-1 branch your fork.
  4. You've installed Docker and Docker Compose, and learned some commands that basically turn you into Steve McQueen.

Now that you've finished the hardest chapter, the rest of these koans will feel pretty much exactly like a series of gauzy, kale-fueled conversations with Judy Blume.

Switch to the "chapter-2 branch."
