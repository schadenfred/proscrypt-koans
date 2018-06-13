# ProScrypt Koans

## Introduction

Have you ever wondered what it's like to build something cool using computers and software that makes the world a better place? I'm not talking about building another hello world or trivial or toy app. I'm talking about building something that doesn't yet exist, something that solves a real problem, something that could plausibly be a startup or inspire one, and which can disrupt a trillion dollar industry.

My goal is to help you find out.

You might have other goals. Maybe you're a project manager or a UI / UX designer who wants to understand when the little neckbearded autistic shits she works with are wasting her time. Maybe you're one of those annoying smart kids in high school who hates football players and cheerleaders and vapes in the bathroom between class. Perhaps you're in prison -- literally, or just figuratively, looking for something to pass the time. An enlisted Army Ranger on watch, trying to keep awake. A Dad with three kids by two different baby mommas who doesn't want to spend the rest of his life on food stamps. Maybe you're homeless, like a friend I greatly admire was before he became a developer. Maybe you're a beauty-queen-trophy-wife who has always been quiet, and perfect, and who nobody thought was smart, but yesterday some fat ugly hater skank threw shade on your Jimmy Choo's, and now you're going to show that little slut what is the mothafuckin what.

Any goal, any motivator is good for the purposes of these koans.

I don't care what it is. And the code you write for machines will care not at all. Speaking of computers, you don't need a fancy machine. Almost any with an Internet connection will do. We don't care if you're good at math or science, or if you've gotten good grades as a student in the past, where you went to college, if you went to college, what you studied, how old you are, where you live, or what you drive. You don't need a credit card, and you don't need to be smart. Let me type that again:

You don't need to be smart.

What you do need is a few blocks of uninterrupted time to get started, a good attitude, a bit of unhealthy curiosity, some obsessiveness, some stubborn, the ability to pay attention to detail, the ability to focus, the humility to ask people for help when you're stuck, and a little bit of anger. A chip on your shoulder, that's really what you need. Because this tutorial and these koans are hard. There's nothing simple or easy about them and people who say "just do this" or "it's simple" before blazing through commands are nasty little shits. Computers and software and your fellow programmers will make you feel stupid, and that is painful. They will make me feel stupid every day. I wish there was a way to help you learn this stuff without making you feel stupid. Feeling stupid too often or for too long can break people. I've seen it. But if you finish these koans, if you overcome your rage, if you are able to replace it with confidence, and they help you to succeed in some way, there's nobody who will be happier than me. Not even your Mom. Because I'm not your Mom. I don't love you unconditionally. My happiness is driven by my ego, by my desire to claim some small credit for your success, and because I've been in your shoes, feeling stupid and suffering. My happiness at your success will 100% real.

### koans

I'm not a software architect. I'm not a computer scientist. I'm not a master developer or a senior develoepr or a tech lead. I'm just a developer. Most real developers are smarter than I am. Like, ten times as smart. But I am still productive, and still build cool stuff. I can build cool stuff because I don't care about titles, or how smart I am, or how long it takes me to build stuff. Because none of that matters. The only thing that matters is whether or not you like building stuff. Jim Weirich's ruby koans was pretty helpful to me in figuring this out. It's how I learned Ruby, but also how I learned not to care. In a later chapter, you'll see Jim's koans, and how he uses them to teach ruby, but for now, here's a definition of a koan that seems as good as any:

> a paradox to be meditated upon that is used to train Zen Buddhist monks to abandon ultimate dependence on reason and to force them into gaining sudden intuitive enlightenment

I'm not a Zen Buddhist monk, and I don't want you to abandon reason, and I think anger can be helpful as noted above. But I do like the idea of letting people teach themselves. It seems less patronizing. So, koans. More on that later, but first I need to bastardize a French phrase.

## Mise en place

[Mise en place](https://en.wikipedia.org/wiki/Mise_en_place) is a French culinary phrase, one meaning of which is "everything in its place." Just as a professional cook will have her salt and pepper, chopped vegetables, cigarettes and garnishes arranged the way she likes to the right and the left of her stove, so will you as a developer have your tools set up and arranged on your machine. Mise en place will change depending on the menu the cook is responsible for reproducing, just as your tools will change depending on the problems you're trying to solve, and the things you are trying to build. There's no one right way. But this tutorial will present my mise en place that you can look at and reflect on, before deciding on your own.

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
