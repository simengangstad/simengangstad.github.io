---
layout: post
title: "The Swift Project: Day 4"
description: ""
category:
tags: [swift, iOS]
---

{% include JB/setup %}

##### Done

Read the following from The Swift Programming Guide, edition 3...

From Collection Types:

* Dictionaries


From Control Flow:

* For Loops
* While Loops
* Conditional Statements
* Control Transfer Statements


From Functions:

* Defining and Calling Functions
* Function Parameters and Return Values
* Function Types
* Nested Functions


##### Reflections


*Dictionaries*

Maybe I'm a bit conservative when it comes to dictionaries, but I don't like the idea that `dictionary[key] = nil` removes the value associated with *key* from the dictionary. It's short, I'll give it that, but I think one rather should have to use `removeValue(forKey:)`. As I understand it so far nil is *just* for setting optionals to not set, and that makes sense. This, not so much. It makes it a bit funky when one has got an dictionary with an optional key or value:

```
var dictionary = [String: String?]()
dictionary["key"] = "value"
dictionary["key"]! = nil // Sets the optional value of key "key" to nil
dictionary["key"] = nil // Removes the value asociated with "key"

```

*Switch*

I actually love that you can chain multiple cases with this syntax `case 1, 2, 3:`. It's far safer than chaining multiple cases like this:

```
case 1:
case 2:
case 3:

break;
```
... As one can have the case where one forgets the break and it falls through. In Swift one doesn't have to break and a case can't be empty, so that problem doesn't occur. If one needs a case to fall through, one can just use the fall through keyword. Elegant and concise.


*Functions*

Functions and tuples in Swift are definitely one of my favourite parts so far. Returning tuples – and the fact that you can do tuple.nameOfVariable – is super useful for complex functions that I don't want to split into multiple ones, because they might all require the same arguments:
```
func life() -> (number: Int, string: String) {

    return (42, "The meaning of life")
}

let lifeTuple = life()
print(lifeTuple.number)
print(lifeTuple.string)
```

The fact that functions also are types makes it easy to define callbacks without having the need to write an interface for example.



I didn't have the time to watch the second lecture today, but I'll read the rest from reading assignment 1 and watch the lecture tomorrow.
