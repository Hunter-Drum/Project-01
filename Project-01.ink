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


->intro

== intro ==
{Hello!!! It is your lucky day! You have been selected to test run my real life dating simulator!| }
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
Don't be alarmed! I am your friend! My name is Bee and I will be your Narrator and Host! Now don't mind my adorably strange appearence. 
-> intro

== swat ==
~ Bee = Bee - 1
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
-> laundry
 == laundry ==
 *["I need my laundry back for that."]
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
 -> END

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
*["Listen, this isn't helping me. I'm not playing your game. I have actully important things to be doing."]
No. 
->END

== search2 ==
+ [Bedroom.] -> bedroom
+ [Kitchen.] -> kitchen
+ [Laundry room.]-> laundryroom
+ [Living room.] ->livingroom
+ [Bathroom] ->bathroom
== bedroom
+ [Bedside table.]
{This room looks unlived in-|Nice guess except it's not there.|Stop looking there.|}
-> advance_late
+ [Under bed.]
{Gotta check everywhere, huh?|Hahahahahahahahahahahahah.|}
-> advance_late
+ [All the pockets.]
{You clothes are so bad.|This is taking foreveeer!|IF YOU CHECK THE POCKETS ONE MORE GODDAMN TIME-|}
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
 + {late >= 5}[The table by the door.]
 -> end_loop
 + {late < 5} [The table by the door.]
  Not there.
 HAHAHAHAHAHAHAHhhahahaHAAHAHAhahaHAAAHAa
 -> advance_late
 +[Under couch.]
 {Reasonable spot to look.|I don't think it will magically appear the second time hahahahaha.|There is just dust and cobwebs down there!}
 
-> advance_late
 

== advance_late ==
~ late = late + 1
{Oooo do you have time for this?|Hahaha, look at the clock.|It's funny to watch you scramble.|You're getting later.|Tick Tock.|Okay this feels excessive.|This was fun for a bit but I'm bored now.|Oh my god!! They're by the door okay??|I told you where they were!!! Go get them!|You know where they are. Fuck you.}
-> search2

== end_loop==
Oh look at that! 
Your wallet! 
THANK GOD! 
That was so boring! 
To the fun stuff!
*[Pick up wallet]
~ wallet= wallet +1
-> END

== to_work== 

-> END


