SmartDraw
================================
SmartDraw is a "two views" drawing application that will give the user a theme to draw in just a few second. The limited amount of time makes the drawing way funnier, but also uglier. After the countdown, your drawing is saved into your photo library.

The target of this app is iOS 9.0 and above, and it is made for iPhones only.
This project has been cloned from my other bitbucket account: https://bitbucket.org/7Zup/smartdraw, where you will be able to see the real branches/commit

* [ScreenShots](#markdown-header-block-screenshots)
* [Architecture](#markdown-header-architecture)
* [Librairies](#markdown-header-librairies)
* [In the future](#markdown-header-in-the-future)

# ScreenShots

Here you will find screenshots of the application:

![Alt text](https://i.ibb.co/X5FkJqJ/Screenshot-2020-09-08-at-22-34-50.png)

	Home View - This is where you arrived after launching the app

![Alt text](https://i.ibb.co/g6LYHCj/Screenshot-2020-09-08-at-22-35-24.png)

	Draw View - On this view, you have to draw something chosen by the app in a limited amount of time ! (Around 30s)

![Alt text](https://i.ibb.co/SXRJKWB/Screenshot-2020-09-08-at-22-36-38.png)

	Draw View - Once the timer is over, you get to save your masterpiece into your photo library

![Alt text](https://i.ibb.co/4THSTQw/Screenshot-2020-09-08-at-22-37-58.png)

	Photo Library - This is the library where all my drawings have been saved

# Architecture

This project follows the VIPER architecture where all the components (View, Presenter, Interactor, Model, Router) are separated to give them precise roles. This does not only clarify the codes making it less compact, but it also makes it more understandable & easier to make unit tests for since the business logic is only supposed to be in the interactor.

SmartDraw has been developped in Obj-C & I have been using git flow to push each feature.

For the UI, I've been using the auto-layout system, making it adaptable for all iPhone sizes.

The application is fully translated in French & in English with the localizable Xcode system.

# Librairies

I used few librairies to help me with colors (lib: Colours) & with alertviews (lib: FCAlertView).

I also used one to fill up the models after an API calls that works like Codable in swift (lib: Mantle), even there are no API calls within the app.

# In the future

Since this is a demo project, it can sure be improved in many ways.

We can improve the application by:

- implementing a gallery system using coredata
- allowing the user to directly share his drawings
- enabling access to tablets
- adding theme categories or even different modes to play with pre-defined unfinished drawings
- finding better colors for the app or just changing the design in general

But we can also improve the code by:

- adding swiftGen to securise the use of localizables, colors & fonts
- adding conventions for the code like swiftlint for swift
- etc..
