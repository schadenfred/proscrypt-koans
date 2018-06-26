# Chapter 2

![image](https://www.seba.blog/wp-content/uploads/2017/07/ooda-loop-e1500631690732.png)

According to Franklin Spinney, [Ghengis John Boyd](http://radio-weblogs.com/0107127/stories/2002/12/23/genghisJohnChuckSpinneysBioOfJohnBoyd.html) believed that:

> [A]ny conflict could be viewed as a duel wherein each adversary observes (O) his opponent's actions, orients (O) himself to the unfolding situation, decides (D) on the most appropriate response or counter-move, then acts (A). The competitor who moves through this OODA-loop cycle the fastest gains an inestimable advantage by disrupting his enemy's ability to respond effectively.

There's much more to Boyd's thinking but let's get started with an observation, or a story, take your pick, that is as good an entry point as any into our first OODA loop.

## Observe

Last winter, I broke my glasses skiing in Lake Tahoe, and was out of contact lenses, and so went to [Deputy Optics](https://www.deputyoptics.com/) in Carson City, Nevada. I showed Wesley, the Optician, my broken glasses. He asked if I had my prescription. I didn't -- Who keeps eyeglass prescriptions in their wallet though anyways, right? -- so Wesley called my optometrist's office, only to be told the prescription was out of date, and that it was the optometrist's policy not to send out-of-date prescriptions. Since I didn't have time to get an appointment with a nearby optometrist, Wesley used a machine to analyze the broken glasses to guess at the prescription, told me he'd have a new pair based on it ready the next day, wired my broken frames together, and sent me home. No problem there, at least with Wesley -- I'm still impressed by his customer service, and that he seemed to so genuinely care -- but it bugged me that the optometrist wouldn't even send a copy of the old prescription. I mean, it's my medical record, not hers, and I payed for it, so why can't I just have a copy? Am I right?

Or amirite?

Well it turns out I'm wrong, and I'm the fuckface, and that optometrists in California and pretty much everywhere else have bribed their state legislatures to keep opticians from making glasses based on out of date prescriptions. I guess I don't blame them. If I could use the government to force everyone who wants to learn programming to pay me for this tutorial, I would.

"But I'm poor," you'd say.

"Fuck you, pay me," I'd say.

## Orient

Humans have different mental models we use to make decisions. A fighter pilot in a dogfight has her pedals and yoke and buttons and radio and gauges and instruments and also her training to put herself between the sun and any threat. A basketball player has her body, her knowledge of her teammates and her opponents, and her 3-point skills. If you wear contacts, maybe you have a mental model that caused you to think ahead and buy extra pairs of glasses and contacts, or to have asked your optometrist to email you a copy of your prescription way back when, and now you can find it by searching your email, and you maybe you can use it buy glasses from twelve year olds in Phnom Penh and have them airmailed to you. But regular people don't always have tools or mental models to fight against crony capitalists in healthcare -- except maybe with their vote, or if they're wealthy enough, a well timed political donation.

But you aren't regular.

You're elite.

If you've gotten this far, you have mental models of some kind already: Knowing what it is to be polite, how to show respect, how to persuade, other people's wants and needs, your understanding of economics, accounting, and business processes, and your sense of humor. Maybe you're a little bit entrepreneurial. Maybe you've developed mental models of Steve Blank's [Customer Development](https://en.wikipedia.org/wiki/Customer_development), or of Eric Ries's ironically much fatter and doughier [lean startup methodology](https://en.wikipedia.org/wiki/Lean_startup). As we go through these koans, your inventory of models will grow to include familiarity with the tools we just installed, as well as with new ones like [agile software development](https://en.wikipedia.org/wiki/Agile_software_development) and [test driven development](https://en.wikipedia.org/wiki/Test-driven_development). Some will prove useful later, others won't. Take what you like.

## Decide

We don't have to know much about what we're going to build to decide that we're going to build, well, something. Something awesome. Something that helps people and fixes a broken system.

Where to start though?

Well, most of the time when I'm developing, I think of people as users. So let's decide to start by building a way for users to sign up, sign in, log out, and update their personal information. If you decide you like developing, Michael Hartl's [Ruby on Rails Tutorial](https://www.railstutorial.org/) is a great way to learn about this stuff. But a lot of professional developers prefer to use a packaged system, and Plataformatec's [devise](https://github.com/plataformatec/devise) because it keeps us from doing anything too stupid.  

## Act

Check out the chapter-2 branch on your machine. When you do:

`$ git branch`

...and it shows 'chapter-2' with an asterisk, rebuild your images and containers:

`$ docker-compose build`

...and bring them up:

`$ docker-compose up database`

Inside the terminal you'll see a bunch of output from our database that looks something like this:

> database_1  | 2018-06-26 20:06:02.825 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432 \n
database_1  | 2018-06-26 20:06:02.825 UTC [1] LOG:  listening on IPv6 address "::", port 5432
database_1  | 2018-06-26 20:06:02.835 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
database_1  | 2018-06-26 20:06:02.874 UTC [22] LOG:  database system was shut down at 2018-06-26 07:01:42 UTC
database_1  | 2018-06-26 20:06:02.900 UTC [1] LOG:  database system is ready to accept connections


the server and Let's open a new terminal to

`$ docker-compose exec web bundle exec guard`

You should see a red failure error in this terminal now. Buried inside that red text is your next koan -- Koan 2.1. Read it, reflect on it, and then make it pass in one of two ways:

1. Changing an existing file in your editor and saving it, before going back to the test terminal and hitting the spacebar.

2. Running a command inside the application, from the command line. In order to run commands inside our app, let's open a second terminal, in the same directory you're in, and then tell Docker Compose to open an interactive shell to our app inside that terminal:

`$ docker-compose exec web sh`

...which should make your new terminal prompt inside our app look something like:

`/usr/src/app #`

Once you've run your command in the second terminal, the application shell, go back to your test terminal and hit space bar. If you've run the right command, the koan should pass and you should see a new one, until they're all finished.
