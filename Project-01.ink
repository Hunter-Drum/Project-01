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
~ late = late +1
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
{late < 3: Man I was hoping you'd be later than that... At least I slowed you down a bit!|} 
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
*{deal == 0} [Stop to look around.] 
~late = late +1
-> look_around
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
{e_deal== 1: WE HAD A VERBAL AGREEMENT! THIS ISN'T FOLLOWING THE RULES!|}
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
 *["That's not omonous."]
 
 "You aren't the one that needs to be scared of me." -> know
== why ==
"To save you of course." 
*[From Bee?] ->know
== know ==
"The creature was a fae. Tricky little things. Prone to mischief. Apparetly it had its sights set on you. But don't worry, I have it taken care of. Consider me pest control." 
*["Why me?"] ->me
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
*[Now that Puppet has mentioned this, you do remember a serial killer matching the description with the scars. You reach for your gun. “Sorry but I have a job to do. You’re under arrest.”] ->arrest
*[Something more is going on here. "We can talk about that later. For now I want to deal with Bee."] ->help
==arrest==
“Well that’s disappointing. But I understand. Afterall, I also have a job to do too.”
*[They run in opposite directions. Follow Entropy.] -> arrest2
*[Follow Puppet.] -> arrest2
== arrest2 ==
*[You follow but they are gone. You never see Bee again and after looking into it you come to learn the woman you met was Raiden Myrsky. A known serial killer. You should have recognized her.]
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
*[Entropy and Puppet step around you and out into the street. True to her word, you never see Bee or Entropy again.]
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
But we had a deal remember?
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
You arrive to work. 
Oh this is gonna be good.
You walk in to see Captain Davor checking his watch. There's a crease on his forhead and a lock of his aburn brown hair falls slightly over one eye when his head is tilted down like this. Despite his built figure you always thought he had a gentleness to him not often see in your fellow police coworkers. 
*["Don't talk about my boss like that."]
No.
-> to_work3
== to_work3 ==
Captain Davor looks up and sees you. He smiles {late >30: though he seems concerned. “Detective Thatcher! There you are. What happened?”|teasingly. “{late} minutes and 27 seconds late.} This is very unlike you. I thought you must have been caught up in a horrible accident. Are you alright?” 
*[“Apologies for being late. It won’t happen again, Captain.”] -> dont_worry
*[“Sorry to worry you, but I’m in one piece and here ready to work.”]
~Davor =Davor+1 
-> dont_worry
*[“I’ve been better.”]
-> better
== better==
 Captain Davor’s eyebrows furrow. “Do you need to take the day off? You have plenty of PTO.”
 *[“No, I can work.”] -> work_case
*[“I appreciate the concern, really, but I think I just need to work a case.”]
~ Davor = Davor +1
-> work_case
== work_case==
“If you’re sure. I actually have a case involving a celebrity for you to look into.”
hehehe
*[That doesn't bode well. "I don’t mean to be unappreciative, but is there any chance I could have a different case?”] ->different
*["I'll look into it, sir."] -> celebrity
 ==dont_worry==
Captain Davor nods. “Don’t worry about it. You’re a good detective, I’m sure there was a reason. You did pick an unfortunate day to be late though. There’s a case involving a celebrity I need you to look into. He’s currently in my office.” Captain Davor speaks quieter joking, “And between you and me I really want him out of here so I’d appreciate it if you could move this case along.” 
*[“I’ll solve the case as fast as I can.”]-> celebrity
*[“I’ve got this. It’ll be like he was never here.”]
~ Davor = Davor +1
-> celebrity
*[This is definitely part of the game. “Could I have a different case?"] ->different
 == different==
 Captain Davor pauses for a moment. He talks carefully and gently to try and not sound accusatory. “Are you sure you’re alright? You never ask for case reassignment.”
 *[“Please. I really cannot take that case today.”] -> please
*[“Never mind. I’ll take the celebrity case.”]
Davor hesitates but nods. "Tell me if you change your mind, alright?"
 -> celebrity
 
 ==please==
 Captain Davor pauses again. “Alright. I could trade you with Detective Page. I know he was interested in the celebrity case. They found a body down by the docks. I was thinking of riding along with someone today. Would you mind if I joined you?” 
*[“I’m sure there’s someone else that could use your help more. I can do this on my own.”] ->differentS
*[“I would appreciate it.”]
~Davor = Davor + 3
 ->differentD
 
 
 
== differentD==
Ahhh this is so exciting! You’re on the Captain Davor path now! You already have {Davor} romance points with him! 
Okay okay.
You head out to the police car. He sits in the passenger's seat because he respects you, I think? 
Actually that’s annoying. 
Can he drive? 
Never mind, it doesn't matter. 
Don’t worry I’ll narrate him so you can look at the road and still know what’s happening. 
Captain Davor has a soft expression on his face, his warm chocolate eyes focused ahead-
*[You do not want to listen to Bee continue to sexualize your boss so you focus on the task ahead. When you get to the docks you investigate the scene with Captain Davor and discuss potential theories, all the while drowning out Bee’s commentary. It gets later.]
-> cd1
==cd1 ==
“Why don’t we stop to get something to eat?” Captain Davor suggests. 
* {wallet==0}[“Unfortunately I left my wallet at home. I’ll be fine till my shift ends.”]
“Lunch is on me today.”
EEeeeeiiiii
He’s such a gentleman!!! 
To lunch! 
-> lunch
*{wallet==1}[Now that he mentions it you are hungry. “I could get something to eat.”]-> lunch
*{deal == 0}[“I’d rather keep working.”]
-> keep_working
==lunch==
*[You get to lunch and finish up your shift with one too many awkward moments between you and your captain orchestrated by Bee. You get home exhausted and fall asleep. When you wake up the next day Bee is gone. And the next. And the next. You often wonder if you had some kind of psychotic break. Maybe you should take some PTO…]
->END

== keep_working ==
*[You get back to the precinct. You sit down to go over evidence, ignoring Bee’s ramblings when they suddenly go quiet. You look up to see a teen in a face mask standing patiently in front of your desk. “Can I help you?”]
This isn’t part of the story. 
Ignore him. 
“... Yes. You can. I need your help… Very bad.” -> keep2
== keep2==
*[He seemed rather neutral about this. {see_E==1: And he looks very similar to the strange woman you had seen earlier.| } “What kind of trouble are you in?”]
He’s not in trouble. 
He’s fine!
Get back to your case haha.
“Actually I’m not fine. I’ve been… kidnapped.”->keep3
==keep3 ==
*[“You hear it too?”]-> keep4
*[“You’ve been… kidnapped?”] ->keep4
==keep4 
Clearly he has not been kidnapped! 
He’s right there and being way too casual about this! 
“Could we talk in a different room? Somewhere with less people around.”
Oh oh he just looked around askance! 
He’s suspicious! 
Up to something!
Arrest him! 
*[“We can talk here.”]
"..." 
Oh wow.
Jesus he's bad at this. 
"Raiden couldn't come in herself..." 
So she sends her kid brother?? 
Embarrassing.  
Hey Detective Thatcher. 
This kid's sister is a serial killer. 
You should arrest him.  ->keep5
*[“Alright.”]
->keep6
 ==keep5==
 *["I'm not arresting him. We are going to the interigation room though."] 
 Noooooo!
 That's what he wants!
 ->keep6
 
 ==keep6 ==
 This is a mistake!
 Stop walking! 
 You both suck! 
 Stop iiiiit! 
 *[When you enter the room in a very quick movement the teen throws a dart with strange carvings at Bee pinning it to the wall. He walks over and starts to tie it up with what looks like wire.]
OOOOOWWWWW!!!
NOOOO!!!
No, let me go! 
Please, I don't want to die!
I don’t wanna die! 
I’ll be good! 
I swear I’ll be good! 
“It’s not my call.” ->keep7
==keep7==
*[“Who are you?”]
"I'm Ermir." -> elaborate
*[“What is that thing?”]
"It's a fae." ->elaborate
 ==elaborate ==
 *["Care to elaborate?"]
 "My sister calls us pest control, and these are pests. It uses magic to trick and mess with people for its own gain, usually entertainment. I should get this to my sister now."
 ->elaborate2
==elaborate2==
*["Can I come?"]
"... Raiden wouldn't like that... but she's better at explaining things... alright." ->elaborate4
*[Let the teen leave.] -
-> elaborate3
==elaborate3
NO!
NONONONONONONO!
PLEASE PLEASE PLEASE
I DONT WANT TO DIE!
I'M SO SORRY 
PLEASE
*[The teen leaves with Bee screaming for help the whole time. You never encounter anything quite like it again.]
->END
== elaborate4 ==
*[You follow them out of the precinct to a car. {see_E==1: The woman you had seen before sits in the driver's seat. Though now she wears sunglasses and a mask.|A woman with long black hair streaked with yellow and orange sits in the driver's seat. She wears sunglasses and a face mask.} The teen sits in the passenger's seat.]->elaborate5
==elaborate5==
“Here.” 
Please please please.
Don’t kill me. 
“Seems you brought a friend?”
“She wanted an explanation.” 
“I’ll get to you in a minute. For now…”
OW
FUCK! 
You stupid goddamn huma-
AAAAHHHHHHH
Stop stop please stop
I’m sorry 
I’m so sorry. 
“Where’s the fae circle?”
Hahaha
You think I’d tell you that?
AAHHHHHHH
*[Bee may be awful but this isn’t right. “Hey. That’s enough.”] -> stop
*[She seems to be handling this. You’re way out of your depth. Let her continue.]
“I’m going to find it anyway. Make this easier on both of us, yeah?”
AGH!
Hhmmmhm
OW!
Okay! Okay! 
Just- please don’t kill me. 
We can make a deal!
I’ll tell you where it is and you don’t kill me! 
“I’m not making a fae deal. Tell me. Now.”
AAAAAGGGHHHH
Okay! Oaky! 
There’s a hotel- 
It’s Cupid Corner hotel. 
“That wasn’t too hard, was it?”
I told you- I told you so don-
->kills
==kills==
*[She kills them. You can’t see her mouth but from the way her eyes crinkle you suspect she’s smiling. She hands the corpse to her brother then turns her attention to you.]
“I believe you wanted information from me?” 
-> END
==stop==
*[She stops and looks at you, handing Bee back to her brother.]
"Tch. Sorry but there are human lives at stake."
-> stop2
==stop2==
*[She puts her foot on the gas and drives away with a short wave.]
->END


 ==differentS==
 You are on the Stallion path.
-> END

== celebrity ==
You are on the celebrity path.
-> END





