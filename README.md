# QT {QML + CPP} Tesla IVI Clone

## Motivation

I have always wanted to start a side project to learn how to setup a QT app that does something (not too complex) as I am learning a new thing, (actually not really new, I have already used QT with python) but it was once and I did it really long ago.

So I was motivated when I was doing something, well I can't say the exact reason because my manager won't like it :D "let the reader imagine". Anyway, I will let you with the real content here.

### Idea of The Program

The idea of the program is to find a good idea that's the 🚗 automotive flavor (since I am working in this industry 😅), after a couple of searches I found a good tutorial that is doing exactly what I want, and I was really inspired by [Monty](https://www.youtube.com/watch?v=Tq-E6lqO6tM).

Tesla IVI (In-Vehicle-Infotainment) UI was what I was searching for, so I did watch the beginning of his tutorial and at later stages -once I got the hang of it- I was doing the step and then I watch Monty describing it and fixing my code if I had some bad design or implementation or sometimes I push thing further if I was caught into it 😀.

Things that I learnt from the tutorial:

* QML anchors and how to easily place the UI elements.
* How to bind the C++ code with the QML engine to be able to handle C++ getters , setters, and invocables (fancy word for functions 😅).
* How to add resources like images using (.qrc) files.
* How to use the awesome features of refactoring of QT Creator IDE, like: Creating definitions quickly from Q_PROPERTY and also creating setters and getters blazingly fast.
* How to divide the backend code and the UI, applying one of the common paradigms for designing UI applications (view/controller). Which absolutely creates a good separation of concerns.

## Screenshots

Lads and gentlemen, I present to you Johhhhhhhhhnnnnn Cenaaaaaaa. Um, sorry... I mean my application (I am very sorry 😂).

### Main Screen

![1690831436090](image/README/1690831436090.png)

As you can see the main screen consists of 3 main parts:

* Right screen
* Left screen
* Bottom bar

#### Left Screen

Left screen is just a place holder for the 3D car animation, I found some freebies on Google images that will just do the job.

#### Right Screen

Right screen should be the main context screen, and its purpose is to change depending on the current app. For me now I have just integrated an interactive (zoom enabled, pinch enabled) Open Street Map. Also, at the top you will find:

| Feature              | Interactive? | Interaction                                                          | Binded to C++ backend |
| -------------------- | ------------ | -------------------------------------------------------------------- | --------------------- |
| Lock status          | Yes          | Toggle (changes the icon)                                            | Yes                   |
| Outdoor temperature  | No           | n/a                                                                  | Yes                   |
| Driver name          | No           | n/a                                                                  | Yes                   |
| Text and text input | Yes          | If the text input == "" the text will be a placeholder "Navigate..." | No (QML only)         |

![lock-text-screenshot.gif](image/README/lock-text-screenshot.gif)
![map-screenshot.gif](image/README/map-screenshot.gif)


#### Bottom Bar

Bottom bar in the clone has some controls and a static icon of a car, here's the breakdown:

![bottombar-screenshot.gif](image/README/bottombar-screenshot.gif)

| Feature                                  | Interactive? | Interaction                                                                                                                                   | Binded to C++ backend |
| ---------------------------------------- | ------------ | --------------------------------------------------------------------------------------------------------------------------------------------- | --------------------- |
| Driver and passenger temperature control | Yes          | Buttons to increment and decrement (change the text)                                                                                          | Yes                   |
| Sound level control                      | Yes          | - Increase volume, decrease it (change the displayed icon)<br />- Toggle (mute and unmute to the latest sound level)<br />- No audible sound. | Yes                   |
| Driver name                              | No           | n/a                                                                                                                                           | Yes                   |
| Text and text input                     | Yes          | If the text input == "" the text will be a placeholder "Navigate..."                                                                          | No (QML only)         |

## Future Improvements

This is my improvements checklist that I love to add on any side-project, sometimes I use it as a start point for me to quickly to get into the mode:

* [ ] **Sound level control:** Add some audible sound tracks and control them (play, pause, rewind, loop, next, previous, shuffle) using QMediaPlayer, QAudioOutput
* [ ] **UI:** Add a slider when hovering or long press the sound icon to appear and precisely set the voltage instead of using buttons, via QSlider.
* [ ] **Map:** Add searchable map using text and virtual keyboard, to be able to search places and set route destinations using QMap.
* [ ] **Compilation**: Cross compile the QT application for ARM and run it on Linux image for Beagle Bone Black.
