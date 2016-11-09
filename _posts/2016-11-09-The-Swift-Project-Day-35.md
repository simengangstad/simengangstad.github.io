---
layout: post
title: "The Swift Project: Day 35"
description: ""
category:
tags: [swift, iOS]
---

##### Done

Watched the eleventh lecture.

##### Reflections

I ran into some problems despite my optimistic assumptions yesterday. The Core Data API is a bit different in iOS 10. The `NSManagedObjectContext` is accessed through the AppDelegate’s `persistentContainer.viewContext` instead of the property `managedObjectContext` for example. I also had some problems casting my subclasses of `NSManagedObject`. It got fixed when I deleted the app from the simulator, which is quite peculiar. It does however correspond to my previous experiences with Core Data :P

The updated code is <a href="https://github.com/simengangstad/The-Swift-Project" target="_blank">here</a>
