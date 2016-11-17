---
layout: post
title: "The Swift Project: Day 43"
description: ""
category:
tags: [swift, iOS]
---

I'm sorry for the lack of updates, but I've been busy with mocks the last few days and haven't had time for anything else.

##### Done

Watched the thirteenth lecture.

##### Reflections

This lecture is about using `NSTimer` to time actions and how one can animate views in iOS. I'm quite impressed how easy it is to animate a `UIView`. Simply call `UIView.animate(withDuration: TimeInterval, animations: () -> Void, completion: ((Bool) -> Void)?)` (or any of the other animate or transition class functions), and one can put changes to transform and other properties of the view and have it animate. The fact that this happens regardless of how the `UIView` is drawn in the `draw(_ rect: CGRect)` method makes animation such a trivial thing. 
