/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

VAR Davor = 2
VAR Edmond = 0
VAR Stallion = 0
VAR Bee = 0
VAR wallet = 0
VAR gun = 1
VAR handcuffs = 1
VAR handcuff_key = 1
VAR taser = 1
VAR radio = 1
VAR late = 0
VAR deal = 0
VAR edited_deal = 0
VAR laundry =1
VAR see_E =0


->intro

== intro ==
{Hello!!! My name is Bee! It is your lucky day! You have been selected to test run my real life dating simulator!| }
* ["AH-! What the hell are you?!"] -> what
* [Swat at the strange flying creature.] -> swat
* ["I did not agree to this."] -> agree
* ["Dating simulator? Sounds fun. How do I play?"]
~ Bee = Bee + 1
-> explain
  
== agree == 
Haha! You're funny. Everyone wants romance! 
-> romance

== what ==
Don't be alarmed! I am your friend! I will be your Narrator and Host! Now don't mind my adorably strange appearence. 
-> intro

== swat ==
~ Bee = Bee - 2
OW!!! Hey! I'm here to help you! Your loveless life was just so sad to me! So I will help your pathetic existance! 
-> romance

== romance ==
* [You don't know what this is and you're going to ignore it. You have laundry to do anyway.] -> ignore
* ["I don't need your help with romance."] -> need
* ["Alright then, 'Bee.' What does this real life dating simulator look like?"]
~ Bee = Bee + 1
-> explain
 == ignore ==
 ~ Bee = Bee -1
 Hey. Heeeeey! I know you can see me!! Stop doing your laundry! Heeeellloooo! HELLO! 
 * ["Did you just- steal my laundry?"] 
 ~laundry = laundry -1
 You did it to yourself! You were ignoring me and I need you to play my game!
 -> ignore2
 
 == ignore2 ==
 *["Where did it even go?"]
 Don't worry about it. 
-> romance
 
 == need ==
 Yes you do. You have no love life. 
 *["I'm married to my job."] -> ridiculous
 *["I don't trust your taste."]
 ~ Bee = Bee -1
 -> ridiculous
 
 == ridiculous==
 Ridiculous. 
 Now can we start? 
 You don't actually have a choice by the way. 
 I'll make your life hell till you agree. 
 Hahahahah.
 Just kidding! 
 No but really have fun getting anything productive done! 
 heheehehe..
 Don't look at me like that. 
 *["Alright. Let's get this over with. Come on, what do I have to do?"]
 -> explain
 
 
 == explain ==
 I'm so happy you're on board! 
 *["I'm not, but please, do continue."] 
 ->explain2
 *["Yes, I'm thrilled."] 
 ~ Bee = Bee + 1
 -> explain2
 
 ==explain2 ==
 So basically I will be manipulating your daily life to set up ideal situations for romance to blossom! 
 All you have to do is follow the flow of the story to maximize romance points! Something I will be keeping track of for you! 
 There will be three romancable men, good news for you is you already know one! 
 * ["Oh god- promise me it's not a co-worker."]
 ...
 Listen- 
 He's quite the gentleman. 
 He may be older than you but- 
-> explain3
== explain3 ==
* ["It's Captain Davor, isn't it? You can't make me romance a commanding officer."]
Ha hahaha- 
Um well- 
Yes? 
Back on topic! 
Go ahead and get ready for the day so we can start the dating simulator! 
-> laundry1
 == laundry1 ==
 *{laundry==1} ["Alright"] 
 -> work
 *{laundry==0} ["I need my laundry back for that."]
 Oh- right. 
 Here.
 Happy now? 
 -> happy
 
 == happy ==
 *["Not remotly."] 
 ~ Bee = Bee -1
 I'm being nice! 
 Appreciate me. 
 -> work
 *["Yep."]
 ~ Bee = Bee +1
 Good!
 -> work
 
 -> END
 
 == work ==
 Now then! Lets head out! 
/* {Bee} */
* {Bee <= -2} ["Where is my wallet?"] -> wallet1 
* {Bee > -2} [Grab your gun, badge, and wallet then head out the door.]
~ wallet = wallet +1
 -> to_work

== wallet1 ==
Hehehehehe
... 
No idea~ <3
*["I need my wallet."]
Find it then.
Why should I know where it is? 
-> search

== search ==
* [Search.] -> search2
* [You don't want to be late. Better to just go without today. Grab gun and badge then head out the door.] ->to_work
* ["Enough. This isn't cute. Give it back."]
Whhhhy the hell should I do that?? 
You aren't cooperating!
You know I'm just trying to help you?? 
-> b_convo

==b_convo==
~ late = late +1
*["I'll try your game IF you give me back my wallet and don't interfere with my job."] ->deal1
*["Listen, this isn't helping me. I'm not playing your game. I have actully important things to be doing."]
Haha
You think I care?
No no. 
You are my player. 
I am your narrator. 
You WILL do what I say. 
This is my game.
-> my_player

== my_player ==
~ late = late +1
*[Oh I see. It's cute you pretended this was for my sake but now that we're being honest what is this about? What are you getting out of this?"] -> getting_out
*{Bee <= -4}["I'm not YOUR anything. I'm a person. I don't know WHAT you are but you will not control me."]
-> not_your
*{Bee>-4} ["I'm not YOUR anything. I'm a person. I don't know WHAT you are but you will not control me."] ->control

== getting_out ==
~ late = late +1
I-
You-
hahaha
You are a smart human, huh?
Alright. 
Now I said this was a test.
A test to see if the magical output is worth the energy gained.
*["I'm sure there are plenty of people who would want to play your game. Why did you pick me?"]
I was- 
a bit short on time-
It doesn't matter. 
I have and now I can't undo it. 
->getting_out2
==getting_out2 ==
~ late = late +1
*[So we're stuck with each other? Perhaps we can come to an agreement?]
Yes! 
The agreement is you play my game and I find you the love of your life! ->getting_out3
== getting_out3 ==
~ late = late +1
*["I need you to understand that is not benefiting me."]
Yes it is. 
Okay don't look at me like that.
FINE!
No it's not. But it's gonna be super entertaining for me. 
-> getting_out4
== getting_out4 ==
~ late = late +1
*["No... This isn't going to work. I have a job, and you need something from me I cannot provide. Bee, please. Find someone else. Someone who actually wants your romantic help."]
I-
no!
It's not fair!
It's not-
I- 
no...
..
I can't..
DAMN IT!

->gone
== gone ==
*[The creature disappeares in a flash of light. You gather your things and head to work. To this day part of you wonder if it was even real.]
-> END

== not_your ==
You stupid mortal!
You are dealing with a creature so far beyond yourself! 
How can you stand here in the presence of power and not cower?
Not obey?!
*[“I’m not afraid of you.”]
That’s your mistake then.
Humans have lost their fear of the mystical. 
I’ll remind you. ->nothing

== nothing ==
*[Nothing.]
-> sound
== sound ==
*[Sound.] -> lights
== lights ==
*[Lights.] -> dancing
== dancing ==
*[Dancing.] -> laughing
==laughing==
*[Laughing.] -> blurred
== blurred ==
*[Blurred.] -> movement 
==movement ==
*[Movement.] -> mocking
== mocking==
*[Mocking]-> pain
== pain ==
*[Pain]-> time
==time ==
*[Time.] 
Are you sorry? -> sound1
== sound1 ==
*[Sound.] -> lights1
== lights1 ==
*[Lights.] -> dancing1
== dancing1 ==
*[Dancing.] -> laughing1
==laughing1==
*[Laughing.] -> blurred1
== blurred1 ==
*[Blurred.] -> movement1 
==movement1 ==
*[Movement.] -> mocking1
==mocking1 ==
*[Mocking.]-> pain1
==pain1==
*[Pain.]
-> time1
==time1 ==
*[Time.] ->save

==save ==
*[When you come back to your senses there's a teen crouching in front of you with a nuetral face, their lips are moving but you don't know what they're saying. There's a woman behind them covered in blood. You look around and see other creatures that look like Bee all dead- The woman walks up to you, her cane clicking on the floor, and offers her hand.]
-> saved

==saved
*[Take her hand.]
"You're safe now." 
->END


== control ==
You humans are all so stupid! 
Ugh! 
I can’t do this anymore..
This isn’t worth it.
*[With a flash of light the creature is gone. You often wonder if it was ever really there.]
-> END


== deal1 ==
~ late = late +1
... 
But I reeeealllly want to mess with your job-
Fine. 
Here's the deal.
You play my game.
Actually play it.
And I will not mess with your police work.
If you agree to the terms let's seal it with a handshake. 
*[Shake hand.] -> shake
*["That's not what I said. I said I'd try your game."] -> e_deal
*[This isn't worth it. Just go to work.]
Are you ignoring me again? 
Ugh whatever. 
Time to goooo! 
-> grab

==e_deal ==
~ Bee = Bee -1
GAH! 
You're being so difficult! 
If you're just going to try I'm not doing both. 
You get the wallet. 
Or you get the no messing with police work thing. 
*["I want the promise. My work is too important."] ->promise
*["Just give me my wallet. This is insane."] 
~Bee = Bee -1
~ Bee = Bee +3 
~ wallet = wallet +1
Whatever. 
Here.
Now you have to try.
You gave a verbal agreement. 
You said so. 
-> grab

== shake==
~ deal = deal + 1
~ Bee = Bee + 6
~ wallet = wallet +1
Ha-
Hahahaha
HAHAHAHAHAHAHAHhhahahaHAAHAHAhahaHAAAHAa
God you have no idea how good that feels! I do love making deals! 
Let's get you to work.
*[Grab your wallet, badge and gun... The concern is settling in.] 
-> to_work
== promise ==
Fine. 
Shake my hand and we will have a deal. 
*[Shake hand.]
~ Bee = Bee + 1
~ late= late + 1
~ edited_deal = edited_deal +1
God- 
That wasn't too hard was it?!
Grab your shit. 
We're going. -> grab

== grab ==
*[Grab your {wallet: wallet,} gun, and badge, then head out to work.]
-> to_work

== search2 ==
+ [Bedroom.] -> bedroom
+ [Kitchen.] -> kitchen
+ [Laundry room.]-> laundryroom
+ [Living room.] ->livingroom
+ [Bathroom.] ->bathroom
== bedroom
+ [Bedside table.]
{This room looks unlived in-|Nice guess except it's not there.|Stop looking there.|}
-> advance_late
+ [Under bed.]
{Gotta check everywhere, huh?|Hahahahahahahahahahahahah.|}
-> advance_late
+ [All the pockets.]
{Your clothes are so bad.|This is taking foreveeer!|IF YOU CHECK THE POCKETS ONE MORE GODDAMN TIME-|}
~ Bee = Bee -1

-> advance_late

 
 == kitchen
 + [Drawers] 
 {Yeesh- your snack selection needs work.|Looks like a bunch of pots and pans to me.|Why would your keys be with your food??|Please stop checking here.|}
 -> advance_late
 + [Counters] 
 {Wow you are a neat freak, not a speck on these- Great wife material.|Hmm you're great at looking for thing.|If your keys were here you would be able to see them.|Oh my god stop.|}
 -> advance_late
 + [Above the fridge]
 {Wow you're really tall- don't worry I can work with that.|Why would you have put the keys up there?|They aren't up there!|}
-> advance_late
 
 == laundryroom ==
 + [In the sock pile.]
 {You should really fold these.|I think if the keys were here you would have felt them the first time.| They aren't in the socks.|}
 -> advance_late
 + [In the dryer.]
 {You sure are thorough.|You are too thorough.|You're insane.|}
 -> advance_late
 + [Under the basket.]
 {You have such a boring wardrob. Remind me to fix that later.|They aren't here.|}
 -> advance_late
 
 ==bathroom==
 + [Sink counter.]
 Your keys aren't in the bathroom, that would be insane.
 -> advance_late
 + [Under sink.]
 You really just have to check everywhere huh?
 -> advance_late
 + [Trash can.]
Ew.
-> advance_late
 
 == livingroom==
  + {late < 35} [The table by the door.]
  Not there.
 HAHAHAHAHAHAHAHhhahahaHAAHAHAhahaHAAAHAa
 -> advance_late
 + {late >= 35}[The table by the door.]
 -> end_loop
 +[Under couch.]
 {Reasonable spot to look.|I don't think it will magically appear the second time hahahahaha.|There is just dust and cobwebs down there!}
 
-> advance_late
 

== advance_late ==
~ late = late + 5
{Oooo do you have time for this?|Hahaha, look at the clock.|It's funny to watch you scramble.|You're getting later.|Tick Tock.|Okay this feels excessive.|This was fun for a bit but I'm bored now.|Oh my god!! They're by the door okay??|I told you where they were!!! Go get them!|You know where they are. Fuck you.}
-> search2

== end_loop==
Oh look at that! 
Your wallet! 
THANK GOD! 
That was so boring! 
To the fun stuff!
*[Pick up wallet, badge and gun.]
~ wallet= wallet +1
-> to_work

== to_work== 
You're on track to be {late} minutes late!
{late == 0:Good Job! Though I had all these plans for if you were late and now I can't do them.}
{late>=35: WOW! I am impressed! I was hoping you'b be late but that's crazy.|}
Alright! 
Our heroine protagonist walks down the busy streets of Los Angeles. {late >30: She is running behind and thus moves quickly to try and avoid any-|It appears to be a day like any other. Little does she know-}
*[“What are you doing?”]
Narrating!! 
Now can I continue? 
I'm gonna set the scene cause this is boring as hell. 
-> watched


== watched ==
*[Bee’s narration is lost on you as you suddenly have the strongest feeling of being watched. You should walk faster. Something dangerous is here.] ->to_work2
*[You want to know what this feeling is. Look around.] -> look_around
*[“Are you responsible for this feeling of being watched?”]-> you_too

== you_too ==
Huh? 
You feel it too??
I have no idea what that is! 
Let’s get you to work. 
Then I can start the REAL narration!
*{deal == 0} [Stop to look around.] -> look_around
*{deal == 1} [Stop to look around.] -> break_deal
*[Go to work.] -> to_work2

== look_around==
{you_too: I'll just keep setting the scene till then. Good practice!|-walking along their own seperate ways like busy worker ants-}
*[Your eyes do a sweep of the street. Bee's narration of it being a normal day feels accurate until your eyes fall on a woman. Her hair is black with orange and yellow streaks, scars climb up her left leg and arm all the way to her eye. She holds a cane in her right hand. She's looking back at you. When you make eye contact the corner of her lips twitches into a smile and she waves at you.]
~ see_E= see_E +1
-> looking_around1
== looking_around1 ==
The sun hangs low in the sky, not yet reaching its afternoon peak- 
*[She's just a random civilian. Keep walking.] ->to_work2
*[Wave back.]
->wave1

== wave1 ==
Hey- 
What are you-
Oh- 
Haha
I don't know what you think you see over there that's so-
Look there's just other dumb extras over there. 
This is your story!
They don't matter! 
We're going to work.
*[She nods her head towards an alley then walks there. You shouldn't follow her. Go to work.] -> to_work2
*{deal == 0}[There's something about her that feels dangerous, but somthing tells you to go talk to her. Against your better judgment you follow.] ->objection
*{deal == 1} [There's something about her that feels dangerous, but somthing tells you to go talk to her. Against your better judgment you follow.] -> break_deal


== objection ==
NO!
NO DON'T GO THAT WAY!!!
{e_deal= 1: WE HAD A VERBAL AGREEMENT! THIS ISN'T FOLLOWING THE RULES!|}
PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE
*[You ignore Bee and continue towards the woman. When your feet hit the concrete on the other side of the street you notice Bee is no longer trailing behind you. You walk to the alley, cautiously, very well aware this could be a set up for an ambush. As you turn in you see the woman standing beside a teen with very similar features. It seems they were talking before you arrived but now they look at you. Now that you're closer your attention is drawn to the unsettling lightness of their blue eyes.] 
"Glad you could make it. I was worried you wouldn't follow." 
-> Entropy
== Entropy ==
*["I had half a mind not to. It's pretty suspicious, don't you think? Luring someone down a dark alley?"] -> sus
*["Who are you?"] -> who
*["Why did you want me to follow you?"] -> why
*{sus}["You know what that thing was, then?"] -> know

== sus ==
"Hm. You're right. All things considered it's a terrible spot to kill someone though. And I'm sure there's something stranger on your mind." -> Entropy
== who ==
"You don't need my name. You can call me Entropy. That's Puppet."
*[The teen, Puppet, waves. Wave back.] 
"I would ask you to introduce yourself but we know who you are."
->puppet
*["What do you want with me?"] ->why


 == puppet ==
 *["Of course. Why wouldn't you, a stranger, know that. Tell me what's happening."] ->know
 *[That's not omonous.]
 
 "You aren't the one that needs to be scared of me." -> know
== why ==
"To save you of course." 
*[From Bee?] ->know
== know ==
"The creature was a fae. Tricky little things. Prone to mischief. Apparetly it had its sights set on you. But don't worry, I have it taken care of. Consider me pest control." 
*[Why me?] ->me
*["Oh yeah I can see that."] -> see
*["I want to help."] -> help

==me==
"Probably thought I wouldn't talk to you."
"She's a wanted criminal." 
"... Yes. Thank you, Puppet." 
"You shouldn't arrest her though. You need her help."
*["How wanted?"]
"Serial killer."
"Stop talking." -> me2

==me2==
*[Now that Puppet has mentioned this, you do remember a serial killer matching the description with the scars. Arrest her.] ->arrest
*[Something more is going on here. "We can talk about that later. For now I want to deal with Bee."] ->help

==arrest==
*[You reach for your gun. “Sorry but I have a job to do. You’re under arrest.”]
“Well that’s disappointing. I understand. Afterall, I have a job to do too.” ->arrest2
== arrest2==
*[They run in opposite directions. Follow Entropy.] -> arrest3
*[Follow Puppet.] -> arrest3
== arrest3 ==
*[You look follow but they are gone. You never see Bee again and after looking into it you come to learn the woman you met was Raiden Myrsky. A known serial killer. You should have recognized her.]
->END


== see ==
"It's not here, is it?"
*[She holds out a card to you. Take it.]
"I'm hunting it down. I'm guessing it's run off by now, but it it comes back give me a call."  -> see2
== see2==
*[Entropy and Puppet step around you and out into the street. You hurry after, several questions on the tip of your tongue but they are already gone. You never see Bee again and after looking into it you come to learn the woman you met was Raiden Myrsky. A known serial killer. You should have recognized her. The hair was different but those scars are striking. ]
->END
== help ==
"You want to help, hm? I'll warn you, once you encounter the supernatural it doesn't tend to leave you."
*["And if I walk away now?"] -> walk_away
*["That's fine. I'd rather be prepared."]
-> help2

== walk_away ==
"You'll never see me or Bee again."
*["I'm seeing this through."]-> help2
*["Then this is goodbye. I never want to encounter something like that again."]-> see3
== see3==
*[Entropy and Puppet step around you and out into the street. True to her word, you never see Bee again.]
-> END

== help2 ==
"Welcome aboard then." 
->END

== break_deal ==
*[You find you can't. Your legs keep you moving towards the precinct. What is happening-?? Why can't you-]
Hahahahah
HAHAHA
Oh were you trying to get side tracked??
No need to panic! 
But we had a heal remember?
HAHAHAHAHAHAHAHhhahahaHAAHAHAhahaHAAAHAa
Oh you didn't think you could just break it like that did you? ->break_deal1
== break_deal1==
*["How are you doing this?? Stop it! Let me go!!"]
We're going to work. 
You have to see Captain Davor, remember? 
Don't worry you'll feel better soon.
Haha
Don't look so sad!
You agreed to this! 
Come on now. -> break_deal2
==break_deal2==
*[You have no choice but to follow, listening to Bee's shitty narration and slowly spiraling into panic.]
-> to_work2


== to_work2==
You get to work, bitch. 
->END



