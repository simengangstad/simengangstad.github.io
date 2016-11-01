---
layout: post
title: "The Swift Project: Day 25"
description: ""
category:
tags: [swift, iOS]
---

##### Done

Read the following chapters from The Swift Programming Guide, edition 3...

* Optional Chaining:
* Error Handling:
* Nested Types:
* Extensions
* Protocols
* Generics
* Access Control
* Advanced Operators

With that I've finished reading assignment 3. A bit over the due date, but I can focus completely on the programming assignments now.


##### Reflections

I stumbled upon `defer` in the programming language John Blow is designing and I really liked the idea of it. Glad to see that one can do the same in Swift as well.

Making an argument have to conform to multiple protocols with the ampersand symbol is interesting:

```
protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Person: Named, Aged {
    var name: String
    var age: Int
}
func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}

```

Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3).” iBooks. https://itun.es/no/jEUH0.l

Type constraints for generics is also quite neat in my opinion. It makes it flexible for many types, but they have to conform to a certain protocol for example.
