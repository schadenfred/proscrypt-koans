


so that you or members of a team can work on a code base separately and merge

on uses a program called Git under the hood. Please reflect on how to get to and start with Chapter 1 from this page, which is the master branch.
Each new chapter in our koans is also a branch in our code, and t


## Mise en place

More on that later but for now, let's bastardize a French phrase.
[Mise en place](https://en.wikipedia.org/wiki/Mise_en_place) is a French culinary phrase, one meaning of which is "everything in its place." Just as a professional cook will have her salt and pepper, chopped vegetables, cigarettes and garnishes arranged the way she likes to the right and the left of her stove, so will you as a developer have your tools set up and arranged on your machine. Mise en place will change depending on the menu the cook is responsible for reproducing, just as your tools will change depending on the problems you're trying to solve, and the things you are trying to build. There's no one right way. But this tutorial will present a mise en place that you can look at and reflect on, before deciding on your own.

## Terminal

These koans will require you to become familiar with your terminal if you aren't already. If you don't know how to open your terminal, please go to [duckduckgo.com](http://duckduckgo.com/) and type "How do I open my OPERATING SYSTEM terminal," replacing the capitalized letters with the name of your current machine's OS.

When you've opened your terminal and see something like [the image on the right side of this pae](https://en.wikipedia.org/wiki/Bash_), please create a directory in your home folder called work, with a subdirectory called training and within it a subdirectory called proscrypt-koans. When you can type:

`$ cd work/training/proscrypt-koans`

and then be in that directory, you've reached enlightenment.

### Git

These koans will also require you to set up a file version control system on your machine, which allows you to track the history of changes to your files and revert to the last working copy.

In your terminal, please type:

`$ git --version`

Your console should return something like:

`
git version 2.17.0
`

If it does not, please follow [these instructions](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

### koans

One definition of a koan is:

> a paradox to be meditated upon that is used to train Zen Buddhist monks to abandon ultimate dependence on reason and to force them into gaining sudden intuitive enlightenment

Each new chapter in our koans is also a branch in our code, and the site you are reading these koans on uses Git under the hood. Please reflect on how to get to and start with Chapter 1 from this page, which is the master branch.


# Koan 1-1

Please click this site repository's "branch" button. It will show you a pulldown menu with this repository's branches.

Reflect on how you would get a copy of this repository and all of these branches onto your local machine. When you run this command from the terminal:

`
$ git branch
`

...and it lists the same branches from the pull down menu above, you've reached enlightenment.

## Koan 1-2

Please reflect on how use Git to switch between Git branches. When you run `$ git status` from the terminal, and the first line returned is "On branch chapter-1," you've reached enlightenment.

## Koan 1-3

Please reflect on how you'd like to edit files. There are many excellent text editors out there. If you have not reflected on the subject at length, or have not yet formed an opinion, please [install](https://flight-manual.atom.io/getting-started/sections/installing-atom/) the Atom text editor.

When you can open this repository in your text editor, or by running:

`$ atom . &`

...you've reached enlightenment.

## koan 1-4
