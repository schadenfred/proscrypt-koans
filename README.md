# Chapter 2

According to Franklin Spinney, [Ghengis John Boyd](http://radio-weblogs.com/0107127/stories/2002/12/23/genghisJohnChuckSpinneysBioOfJohnBoyd.html) believed that:

> [A]ny conflict could be viewed as a duel wherein each adversary observes (O) his opponent's actions, orients (O) himself to the unfolding situation, decides (D) on the most appropriate response or counter-move, then acts (A). The competitor who moves through this OODA-loop cycle the fastest gains an inestimable advantage by disrupting his enemy's ability to respond effectively. He showed in excruciating detail how these cycles create continuous and unpredictable change, and argued that our tactics, strategy, and supporting weapons' technologies should be based on the idea of shaping and adapting to this change — and doing so faster than one's adversary.

There's much more to Boyd's thinking, and you can read more about it [here](https://www.artofmanliness.com/articles/ooda-loop/), but for now, let's get started with an observation.

## Observation

I had broken my glasses skiing in Lake Tahoe, and was out of contact lenses, and so went to [Deputy Optics](https://www.deputyoptics.com/) down in Carson City, Nevada. I showed Wesley, the Optician, my broken glasses. He asked if I had my prescription. I didn't -- Who keeps eyeglass prescriptions in their wallet though anyways, right? -- Then he said he could call and get it faxed to him by my optometrist. We called, only to be told the prescription was out of date, and it was the optometrist's policy not to send copies of out-of-date prescriptions. I didn't have time to get an appointment with a nearby optometrist, so Wesley used a machine to analyze the broken glasses to guess at the prescription, and told me he'd have them ready the next day before wiring my broken frames together and sending me home. No problem there, at least with Wesley -- I'm still impressed by his customer service and that he seemed to so genuinely care -- but it bugged me that the optometrist wouldn't even send a copy of the old prescription. I mean, it's my medical record, not his, and I payed for it, so why can't I just have a copy of it? Am I right? Or amirite?

Turns out I'm wrong, and that optometrists in California and pretty much everywhere else in this country have bribed their state legislatures to prevent opticians from making glasses based on out of date prescriptions. I guess I don't blame them. If I could use the government to force everyone who wants to learn programming to pay me for this tutorial, I probably I would.

"But I'm poor," you'd say.

"Fuck you, pay me," I'd say.

## Orient

Humans have different mental models we use to make decisions. A fighter pilot in a dogfight has her pedals and yoke, her radio, her gauges and instruments, and her training to put herself between the sun and any threat. A basketball player has her body, her knowledge of her teammates and of her opponents, and her 3-point skills. If you wear contacts, you might have a mental model in place that allowed you to avoid the frustration I had above; maybe you thought ahead unlike my dumb ass and bought extra pairs of glasses and contacts; or maybe you asked your optometrist to email you a copy of your prescription way back when and you can find it by searching your email and then you can use it buy unregulated eyeglasses made by child laborers in Phnom Penh. Regular people don't always have tools or mental models to fight against cronyism -- except maybe with your vote, or if you're wealthy enough, with a well timed political donation. But you aren't regular.

You're elite.

If you've gotten this far, you have mental models of some kind already: Knowing what it is to be polite, how to show respect, how to persuade, other people's wants and needs, your understanding of economics, accounting, and business processes, and your sense of humor. Maybe you're a little bit entrepreneurial. Maybe you've developed mental models of Steve Blank's [Customer Development](https://en.wikipedia.org/wiki/Customer_development), or of Eric Ries's ironically much fatter and doughier [lean startup methodology](https://en.wikipedia.org/wiki/Lean_startup). As we go through these koans, your inventory of models will grow to include familiarity with the tools we just installed, as well as with new ones, including [agile software development](https://en.wikipedia.org/wiki/Agile_software_development) and [test driven development](https://en.wikipedia.org/wiki/Test-driven_development). Some will prove useful later, others won't. Take what you like.

## Decide

We don't have to know much about what we're going to build to decide that we're going to build, well, something. Something awesome. Something that helps people and pays these patronizing cronies back.

Where to start though?

Well, since most of the time when I'm developing, I think of people as users. So let's decide to start by building a way for users to sign up, sign in, log out, and update their personal information.

## Act

Check out the chapter-2 branch on your machine using koan 1.9 as inspiration. When you do:

`$ git branch`

...and it shows 'chapter-2' with an asterisk next to it, go back to the terminal you ran koan 1.11 in and do:

`$ docker-compose up`


### koan 2.2

Up until now, you've been reading koans add devise to gemfile
run bundle
rails g devise install

docker compose up -d database web
add config.action default url
add confirmable module

. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

     In production, :host should be set to the actual host of your application.

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root to: "home#index"

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

  4. You can copy Devise views (for customization) to your app by running:

       rails g devise:views


install devise




know much about what our solution will look like. But we know we aren't going to just sit back and not fight. We're going to fight. exactly what our app will look like but let's decide to get started anyway, using . We're  You miss 100% of the shots you don't take, Let's get back at these cronies by building a website that gets back at the cronies, gives you control of your medical records, and forces them to respect us.


Wihypothesis

<table>
<thead>
<tr>
<th>foo</th>
<th>bar</th>
</tr>
</thead>
<tbody>
<tr>
<td>baz</td>
<td>bim</td>
</tr></tbody></table>

We don't know exactly what our app will look like but let's decide to get started anyway, using . We're  You miss 100% of the shots you don't take, Let's get back at these cronies by building a website that gets back at the cronies, gives you control of your medical records, and forces them to respect us.




 and beat them other than

 If you aren't a programmer, maybe your mental model would include calling your local representatives in congress. Or just complaining. But as developers, we have a whole bunch of different mental models we can use.


But I feel like that would probably make you angry, just as what optometrists are doing every day makes me angry. I mean it's my record, right? Why can't I have access to my records? Patronizing little crony jerks. So now it's payback time. I'm going to show you how to build a web app that takes away their power and gives it back to people like you and me. Obviously they'll fight and cry and try to make what we're doing illegal or something, but let's fight that battle when we have millions of dollars in venture capital to buy lawyers and politicians and beat them at their own game.

## koan 2.1

Think about a problem you have seen out there. Something that frustrated you. There are problems all over the place. For example, we have something like 40 years of medical statistics proving that birth control pills are safe, or at least not much more dangerous than cough syrup. And yet in order to get them prescribed, America's fatherly order of elite gynecologists has successfully lobbied the federal government to force women to show them their vaginas before having sex to a mostly male political class in the Senate and the House of Representatives by making the argument that if they don't control your ability to have sex using birth control pills, you won't come into their offices and let them look at your vaginas and make sure you aren't growing oysters down there. Or something. I'm not saying that it's a bad idea to go to the gynecologist to have your vagina checked for oysters, I'm just saying that patronizing behavior from doctors and politicians is a real thing, and that women are smart enough to use cough syrup without the cashier putting a speculum down their throats. You know? So for this koan, think of a problem you've seen and write a story about why you came to think of the problem like I did above. You can skip this koan but I'd love it if you wrote down your problem and emailed me a copy.

## koan 2.2

Now let's be a bit more specific about the problem we're trying to solve:

1. Prescriptions are still on paper. This means they
