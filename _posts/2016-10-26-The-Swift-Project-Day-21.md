---
layout: post
title: "The Swift Project: Day 20"
description: ""
category:
tags: [swift, iOS]
---

{% include JB/setup %}
![Face]({{ site.url }}/resources/faceit-day21.gif)

##### Done

* Watched the fourth lecture
* Watched the fifth lecture


##### Reflections

The fifth lecture is all about gestures and different ways of using gestures to modify the properties of a face. I had some trouble assigning the action with `#selector(FaceView.changeScale(_:))` in the `FaceViewController` (it yielded that the FaceView didn't have a member named that). Changing it to `#selector(FaceView.changeScale)` fixed it. The gif is just basic demonstrations of pinch, tap and and pan gestures. 

@IBDesignable and @IBInspectable are so useful. With @IBInspectable is kind of like Unity where you can set variables in the inspector rather than in the code. Super neat for quick adjustments!
