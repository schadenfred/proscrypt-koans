# Chapter 2

![image](https://www.seba.blog/wp-content/uploads/2017/07/ooda-loop-e1500631690732.png)

According to Franklin Spinney, [Ghengis John Boyd](http://radio-weblogs.com/0107127/stories/2002/12/23/genghisJohnChuckSpinneysBioOfJohnBoyd.html) believed that:

> [A]ny conflict could be viewed as a duel wherein each adversary observes (O) his opponent's actions, orients (O) himself to the unfolding situation, decides (D) on the most appropriate response or counter-move, then acts (A). The competitor who moves through this OODA-loop cycle the fastest gains an inestimable advantage by disrupting his enemy's ability to respond effectively.

There's much more to Boyd but let's get started with an observation.

## Observe

Last winter, I broke my glasses skiing in Lake Tahoe, and was also out of contact lenses, and so went to [Deputy Optics](https://www.deputyoptics.com/) down in Carson City].

I showed Wesley, the Optician, my broken glasses.

He asked if I had my prescription.

I didn't.

Wesley called my optometrist's office, only to be told the prescription was out of date and that it was the optometrist's policy not to send out-of-date prescriptions because people might die or whatever. Since I didn't have time to get an appointment with a local optometrist, Wesley used a machine to analyze the broken glasses to guess at the prescription before telling me he'd have a new pair based on the machine prescription ready the next day, wiring my broken frames together, and sending me home. No problem there, at least with Wesley. I'm still impressed by his customer service, and that he seemed to so genuinely care. But it bugged me that the optometrist wouldn't even send a copy of the old prescription. I mean, it's my medical record, not hers, and I payed for it, so why can't I just have a copy? Am I right?

Or amirite?

Well it turns out that I'm wrong, and that I'm a total pathetic worthless loser, and that optometrists in California and pretty much every state have bribed their legislatures to keep opticians from making glasses based on out of date prescriptions even if you're not in high school and not a criminal and you vote and you pay taxes and are just trying to get through life without killing yourself or hurting anyone else. I guess I don't blame them. If I could use the government to force everyone who wants to learn programming to pay me for this tutorial, I would.

"But I'm poor," you'd say.

"Fuck you, pay me," I'd say.

## Orient

Humans have different mental models we use to make decisions. A fighter pilot in a dogfight has her pedals and her yoke and buttons and dials and her radio and gauges and instruments and also her training to put herself between the sun and any threat. A basketball player has her body, her knowledge of her teammates and her opponents, and her 3-point shooting skills. If you wear contacts, maybe you have a mental model that's different from mine, one that allowed you to think ahead and buy extra pairs of glasses and contacts, or to even to have told your optometrist to email you a copy of your prescription way back when, before you paid her, so that now you can find it by searching your email, and you can use it because you're a genius bitcoin investor with wads of delicious wealth and you can buy glasses made by twelve year olds in Phnom Penh and have them airmailed to you. But regular people don't always have tools or mental models to fight against crony capitalists in healthcare -- except maybe with their vote, or if they're wealthy enough, a well timed political donation.

Lucky for you, you aren't regular.

You're elite.

If you've gotten this far, you have mental models of some kind: Knowing what it is to be polite, how to show respect, how to persuade, models of other people's wants and needs, models of economics, of accounting, business, psychology, and even your sense of humor. Maybe you're a little bit entrepreneurial, and your mental models include Steve Blank's [Customer Development](https://en.wikipedia.org/wiki/Customer_development), or Eric Ries's ironically much fatter and doughier [lean startup methodology](https://en.wikipedia.org/wiki/Lean_startup). As we go through these koans, your inventory of models will grow to include familiarity with the tools we just installed, as well as new ones like [agile software development](https://en.wikipedia.org/wiki/Agile_software_development) and [test driven development](https://en.wikipedia.org/wiki/Test-driven_development). Some of these models will prove useful later, others won't. Take what you like. In the brothel of ideas, everyone has their own kinks.

## Decide

We don't have to know much about what we're going to build to decide that we're going to build, well, something. Something awesome. Something that helps people and fixes a broken system.

Where to start though?

I don't have it figured out, necessarily, at this stage. But most of the time when I'm developing, I think of people as users. So yeah, let's decide to start by building a way for users to sign up, sign in, log out, and update their personal information.

## Act

Check out the chapter-2 branch on your machine. When you can do:

`$ git branch`

...and it shows 'chapter-2' with an asterisk, you're good.

Shut everything down from the previous branch.

`$ docker-compose down`

Remove all images, containers, and volumes.

`$ docker system prune -a`

...and bring up our database container:

`$ docker-compose up database`

You'll see output from our database container like this:

> Starting proscryptkoans_database_1 ... done
> Attaching to proscryptkoans_database_1
> database_1  | 2018-06-26 20:06:02.825 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
> database_1  | 2018-06-26 20:06:02.825 UTC [1] LOG:  listening on IPv6 address "::", port 5432
> database_1  | 2018-06-26 20:06:02.835 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
> database_1  | 2018-06-26 20:06:02.874 UTC [22] LOG:  database system was shut down at 2018-06-26 07:01:42 UTC
> database_1  | 2018-06-26 20:06:02.900 UTC [1] LOG:  database system is ready to accept connections

Hit Ctrl-C.

When the terminal prompt reappears, bring up our web container:

`$ docker-compose up web`

You'll see output from our web container like this:

> Starting proscryptkoans_web_1 ... done
> Attaching to proscryptkoans_web_1
> web_1       | => Booting Puma
> web_1       | => Rails 5.2.0 application starting in development
> web_1       | => Run `rails server -h` for more startup options
> web_1       | Puma starting in single mode...
> web_1       | * Version 3.11.4 (ruby 2.5.1-p57), codename: Love Song
> web_1       | * Min threads: 5, max threads: 5
> web_1       | * Environment: development
> web_1       | * Listening on tcp://0.0.0.0:3000
> web_1       | Use Ctrl-C to stop

Hit Ctrl-C.

When the terminal reappears, start both containers:

`$ docker-compose up`

...and you will see output from the web application container concatenated with that from the database container.

Hit Ctrl-C.

Start both containers again, but this time in a -d detached state:

`$ docker-compose up -d`

...which gives us this output:

> Starting proscryptkoans_database_1 ... done
> Starting proscryptkoans_web_1      ... done

Sometimes I like to see the output, sometimes I don't. You'll figure out what works best for you. If you like seeing the output in this terminal, open a new one.

Remember that stuff earlier about dreams inside dreams and machines inside machines? Let's tunnel from a terminal in your machine into a terminal running inside a container inside Docker on your machine:

`$ docker-compose exec web sh`

Your dream machine terminal prompt will look like this:

`/usr/src/app #`

From now on we will distinguish between terminals. If the command looks like this:

`$ <command>`

You should run it inside your machine.

If the command looks like this:

`# <command>`

You should run it in your web app container terminal.

Tell your web app to create a new postgres database inside our database container:

`# bin/ docker-compose exec web bin/rails db:create`

Run our migrations to create a schema:

`# bin/rails db:migrate`

Verify that our web app created a db/schema.rb file for you:

`$ git status`

Run our koans:

`$ docker-compose exec web bundle exec guard`

Read the koan, reflect on it, and make it pass by doing one of these two things:

1. Use your editor to change code in an existing file.

2. Run a command inside your web container's shell

Once you think you've correctly edited the code or run th ecommand, Go to your koans terminal and hit spacebar. If the koan passes, the terminal will move you to the next koan and so on.
