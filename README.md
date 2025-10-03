# Week3TestingWork5Mins

Seeing as I still have 20 seconds and I'm typing out the reflection now. I'd say I'm doing good.

Just now are you asking if someone hasn't completed it.

I would say that I'm doing okay. I could probably do it in about 3 minutes. The only reason I wouldn't be able to do this in under a minute is due to the Unity Project loading up and creating. Other than that
I'm doing good.

as for the project. It was a bit difficult to fix the syntax as I had to compare the text letter by letter with the slideshow text. Unfortunately the errors pointed at what was causign the issue and not specifically the origin
of what was causing the issue.

Overall, I did consult chatGPT for some syntax errors which helped me figure out that I had a ; instead of a : in one place, and a variable that wasn't equated to something.

Things work, and The Github is working fine, so we're good.


Update on Lab 4

Here are the 3 shaders that we were meant to create within ShaderGraph.
![alt text](<Screenshot 2025-10-03 130050.png>) 
first being the Lambert, and although I believe I had some issues with getting nodes to work at first, I eventually got it to work after some debugging.

![alt text](<Screenshot 2025-10-03 130132.png>)
Secondly, the Lambert + Ambient shader. After the Lambert shader was done, all I had to do was duplicate it, create a new material from it and then add in the ambient lighting. After the node was explained to me, it sparked some curiosity in my mind about how I can use these nodes to make some simple yet effective shaders

![alt text](<Screenshot 2025-10-03 130123.png>) 
This ungodly shader was the most unresponsive simply due to me going from 0 - 1 within the slider. Only later to realize that the values of the slider were meant to be set at a minimum of 0.1, and a maximum of 100 (But the tutorial slideshow didn't show that so I was rightfully stumped for a while.)

Eventually I got it working in what I believe is the correct way for the Lambert + Ambient + Specular shader to work. (I keep accidentally recording my screen by pressing Shift + lol).
