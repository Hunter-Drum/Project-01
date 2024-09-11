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
->intro

== intro ==
{Hello!!! It is your lucky day! You have been selected to test run my real life dating simulator!| }
* ["AH-! What the hell are you?!"] -> what
* [Swat at the strange flying creature.] -> swat
* ["I did not agree to this."]
Haha! You're funny. Everyone wants romance! 
-> romance

== what ==
Don't be alarmed! I am your friend! My name is Bee and I will be your Narrator and Host! Now don't mind my adorably strange appearence. 
-> intro

== swat ==
OW!!! Hey! I'm here to help you! Your loveless life was just so sad to me! So I will help your pathetic existance! 
-> romance

== romance ==
* [You don't know what this is and you're going to ignore it. You have laundry to do anyway.] -> ignore
* ["I don't need your help with romance."] -> need
* ["Alright then, 'Bee.' What does this real life dating simulator look like?"]
-> explain

 == ignore ==
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
 -> ridiculous
 
 == ridiculous==
 Ridiculous. Now can we start? You don't actually have a choice by the way. 
 I'll make your life hell till you agree. Hahahahah. 
 Just kidding! 
 No but really have fun getting anything productive done! 
 heheehehe..
 Don't look at me like that. 
 *["Alright. Let's get this over with. Come on, what do I have to do?"]
 -> explain
 
 == explain ==
 I'm so happy you're on board! 
 *["I'm not, but please, do continue."] ->explain2
 
 ==explain2 ==
 I will!
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
* [It's Captain Davor, isn't it? You can't make me romance a commanding officer."]
Ha hahaha- 
Um well- 
Yes? 
Back on topic! 
You 
-> END





