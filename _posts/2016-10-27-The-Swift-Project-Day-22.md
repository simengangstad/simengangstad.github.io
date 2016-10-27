---
layout: post
title: "The Swift Project: Day 22"
description: ""
category:
tags: [swift, iOS]
---

##### Done

* Watched the sixth lecture

##### Reflections & Notes

Segues in almost all cases creates the MVC it transits to; it's not already created

MVC life cycle:

1. Instantiated from StoryBoard (usually)
2. awakeFromNib. Rarely used though
3. Preparation if being segued to
4. Outlet setting
5. Appearing and disappearing
	* viewDidLoad is called here, but geometry is not set yet, so just the place for UI independent initialisation
	* viewWillAppear. Great point to start an expensive process etc.
	* viewDidAppear. Good point to start an animation etc.
	* viewWillDisappear. Undo animations etc.
	* viewDidDisappear. Free up  expensive processes etc.
5. Geometry changes
If one wants to get involved in geometry changes...
	* viewWillLayoutSubviews
	* viewDidLayoutSubviews
6. Low-memory situations
	* didReceiveMemoryWarning. If one uses big image files or sounds for example. The place to free up any resources if they're not needed.

This is quite important to remember, especially with outlets being set after preparation.
