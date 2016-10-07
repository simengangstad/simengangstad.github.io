---
layout: post
title: "The Swift Project: Day 2"
description: ""
category:
tags: [swift, iOS]
---
{% include JB/setup %}

##### Done

Read the following from The Swift Programming Guide, edition 3...

From The Basics:

* Constants and variables
* Comments
* Semicolons
* Integers
* Floating-point numbers
* Numeric Literals
* Booleans
* Optionals
* Assertions

Basic Operators:

* Terminology
* Assignment Operator
* Arithmetic Operators
* Compound Assignment Operators
* Comparison Operators
* Tenary Conditional Operator
* Range Operators
* Logical Operators


Strings and Characters:

* String literals
* Initialising  an Empty String
* String Mutability
* Strings Are Value Types
* Working with characters
* Concatenating Strings and Characters


##### Reflections

“If you need to give a constant or variable the same name as a reserved Swift keyword, surround the keyword with backticks (`) when using it as a name. However, avoid using keywords as names unless you have absolutely no choice.”

Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3).” iBooks. https://itun.es/no/jEUH0.l

It's so weird that you can do this.

I do like that they've included nested multiline comments. I find it annoying when you have the case where you want to comment a whole block of code that already has got some code commented in it. You end up having to remove that comment that was already there.

Unsigned integers, that's nice.

The closed range operators are also really nice. a...b for from a to b inclusive, and a..<b for from a to b exclusive.

It's interesting how Swift tends to Double rather than Float. In Java and my game programming, the libraries I use and the code I write does tend the other way. Float is – in most cases – good enough and it also saves up space when you're dealing with a lot of positional vectors for example. Nevertheless, one can assume that with general app development and the amount of memory on an iPhone, one can have the luxury of Doubles.
