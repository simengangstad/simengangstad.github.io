---
layout: post
title: "The Swift Project: Day 1"
description: ""
category:
tags: [swift, iOS]
---
{% include JB/setup %}

##### Done
 Watched the first lecture.


##### Reflections
Swift has got an interesting philosophy when it comes to function declarations. I wondered what the underscore for the first parameter was, and after some Googling I found out that it's just a hack to solve the problem where you in Swift 2.x could define the first parameter unspecified:

`foo("bar", amount: 6, time: 20)`

Whereas in Swift 3.x you cannot (without the underscore):

`foo(message: "bar", amount: 6, time: 20)`

So probably to prevent breaking a lot of code they introduced the option of declaring the first parameter with an underscore in order to have the option to do it as you would in Swift 2.x.

`foo(_ message: String, amount: Int, time: Int)`

Optionals are quite an interesting way of dealing with variables not being set (null in Java for example). Packaging variables that might be nil or in a 'not set' state into optionals makes sure that you handle these variables with care, which is a nice thought.

I do also like how you can avoid a whole block of code to run if the optional isn't set:

```
if let variable = optional {
    foo(bar)
}
```

Of course this is the same as checking if a certain variable is not set, as one can do in Java for example, but when you define the variable as an optional you *have* to make that check, and that's what essential.

##### Homework

* Due to 13.10.16: Reading assignment 1
