# Chapter 1

Congratulations, you've solved your first koan!

Which if you think about it, is kind of like solving a koan about solving koans.

And which if I think about it, is kind of like saying I've introduced you to recursion in programming. We'll explore recursion in more depth later, but for now you may think of recursion as not unlike Russell Brand fixing his hair inside a house of mirrors.

And now I'm going to bastardize a French culinary phrase.

## Mise en place

One meaning of [mise en place](https://en.wikipedia.org/wiki/Mise_en_place) is "everything in its place." Just as a professional cook will have her salt and pepper, chopped vegetables, garnishes, unfiltered Gauloises and ash tray arranged the way she likes, to the right and the left of her stove, so too will you as a developer have your tools set up and arranged on your machine. A cook's mise en place will change depending on the menu she's responsible for reproducing, as will yours depending on the things you're trying to build. The mise presented in this chapter is a plausible starting point, and will include:

1. Terminal -- Bash.
2. Text editor -- Atom.
3. Source control -- Git.
4. Git host -- Github.
5. Containerization -- Docker

Don't worry if you don't know what these things are. For now just understand that setting up your environment is one of the most difficult things developers have to do. If I could have you do this chapter later after building your confidence first, I would, but I can't.

## koan 1.1: Terminal or Console

If you've never used your terminal before, the terminal is to the developer what the light saber is to Darth Vader, what incognito mode is to the sex addict, and what jokes about how dumb white people are to Chris Rock.   

When you've opened your terminal and see something like the [image](https://en.wikipedia.org/wiki/Bash_(Unix_shell)) on the right side of this page, you're ready to move on.

[Reflect for windows](https://duckduckgo.com/?q=how+do+open+terminal+on+windows&t=h_&ia=web)

[Reflect for mac](https://duckduckgo.com/?q=how+do+open+terminal+on+mac&t=h_&ia=web)

[Reflect for linux](https://duckduckgo.com/?q=how+do+open+terminal+on+linux&t=h_&ia=web)


## koan 1.2: Work Directories

Here's what my terminal prompt looks like:

`schadenfred@summerseve:~$`

It doesn't matter what your terminal prompt looks like, but it probably ends with a `#` or a `%` or a `$`. When I ask that you enter a command at the prompt, I'll abbreviate the above prompt to just the '$' character, followed by the command:

`$ <command>`

Now let's go to your home directory. To do so, enter 'cd':

`$ cd`

This puts you into your home folder on most machines. Now let's create a new directory to work in called 'work':

`$ mkdir work`

To confirm the above command created a directory in your home folder, let's ask for a list of directories and files by typing 'ls':

`$ ls`

Now let's 'change' into the work 'directory':

`$ cd work`

Now from inside this directory, create a new directory called 'training,' and change into it.

When you can do this command without the terminal barfing, you're ready to move on:

`$ cd ~/work/training`

[Reflect](http://mally.stanford.edu/~sr/computing/basic-unix.html).  

## koan 1.3: Git

You're reading these koans on Github, which uses a version control system called Git under the hood. Since GitHub expects you to have Git installed, let's see if it is:

`$ git --version`

If something like the following is returned:

`git version 2.17.0`

...then you're ready to move on.

[Reflect](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

## koan 1.4: Create a GitHub Account

Create an account on [GiHub](https://github.com).

When you can navigate with your browser to:

`https://github.com/YOUR-USERNAME`

...where YOUR-USERNAME is the name you've chosen to sign up with, you're ready to move on.

## koan 1.5: Fork these koans

You may think of forking a repository as making a copy of it, and pretending it's your own. Once you can navigate to:

`https://github.com/YOUR-USERNAME/proscrypt-koans`

...you're ready to move on.

[Reflect](https://help.github.com/articles/fork-a-repo/)

## koan 1.6: Clone your Fork

Let's get a copy of your fork of this repository onto your machine using the 'clone' command. When you can do:

`$ cd ~/work/training/proscrypt-koans`

...then you're ready move on.

[Reflect](https://help.github.com/articles/cloning-a-repository/)

## koan 1.7: Docker

Developers work with other developers, and thus their code must run on other machines. Docker is basically like that movie 'Inception' except instead of dreams inside of dreams, it gives you machines inside of machines. Install it. When you can do:

`$ docker --version`

and it returns something like:

`Docker version 18.03.1-ce, build 9ee9f40`

...you're ready to move on.

[Reflect mac](https://docs.docker.com/docker-for-mac/install/)

[Reflect windows](https://docs.docker.com/docker-for-windows/install/)

[Reflect linux](https://docs.docker.com/engine/installation/linux/)

## koan 1.7: Docker Compose

While we're at it, let's install Docker Compose. When you can do:

`$ docker-compose --version`

and it returns something like:

`docker-compose version 1.20.1, build 5d8c71b`

...you're ready to move on.

[reflect](https://docs.docker.com/v17.09/compose/install/)

## koan 1.8: Text Editor

If you already have a text editor, namaste. Otherwise, install Atom. When you can do something similar to:

`$ atom . &`

...and it opens up our project, you're ready to move on.

[reflect](https://flight-manual.atom.io/getting-started/sections/installing-atom/)

## koan 1.9: Checkout this branch on your machine

Let's get your machine switched to this branch of our code -- the one you're reading. To do so we're going to pass a 'checkout' command, and several arguments to Git. The first argument to Git is that we'd like to checkout a branch '-b'; the second argument is that we'd like to call the branch 'chapter-1,' and the third argument is that we'd like our local branch 'chapter-1' to track our 'origin' remote's 'chapter-1' branch.

`$ git checkout -b chapter-1 origin/chapter-1`

When you can open a copy of this README.md file in your text editor, you're ready to move on.

[reflect](https://stackoverflow.com/questions/1783405/how-do-i-check-out-a-remote-git-branch)

## koan 1.10:

Let's build our starter ProScrypt app using Docker Compose:

`$ docker-compose up -d`

And spool it up:

`$ docker-compose up -d`

And create our database:

`$ docker-compose exec web rails db:create`

When you can click [this link](http://localhost:3000/), and it says "Yay, You're on Rails!" and looks something like ![this picture](http://guides.rubyonrails.org/images/getting_started/rails_welcome.png)

...you're ready to move on.

## koan 1.11:

Let's shut our containers down using Compose:

`$ docker-compose down`

And let's clean up any unnecessary containers:

`$ docker system prune`

When you can do:

`$ docker ps`

...and see there are no running containers, move on.

## What you've learned

I'm told that the hardest parts of being a novelist and heroin addict are getting over your fear of needles and tourniquets before coming out to your family as a narcissist. Let's recapitulate:

  1. You've figured out how to open and use your terminal.
  2. You've set up a professional text editor. There are plenty of great text editors out there including Vim, Emacs, and SublimeText, as well as more powerful IDE's like RubyMine, but Atom is plenty good for now.
  3. You've created an account on GitHub, forked these koans, cloned a copy of them onto your machine, and then checked out and switched into a new branch.
  4. You've installed Docker and Docker Compose, and learned a few powerful commands that basically turn you into Leonardo DiCaprio in Inception if that move was about computers inside computers inside computers instead of dreams inside dreams inside dreams.

Now that you've finished the hard part the rest of these koans will feel pretty much exactly like a series of gauzy, kale-fueled conversations with Judy Blume.

Switch to the "chapter-2 branch."
