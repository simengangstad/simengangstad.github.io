---
layout: post
title: "The Swift Project: Day 13"
description: ""
category:
tags: [swift, iOS]
---

{% include JB/setup %}

##### Done

Read the following from The Swift Programming Guide, edition 3...

From Initialisation:

* Default Initializers
* Initializer Delegation for Value Types
* Setting a Default Property Value with a Closure or Function

From Type Casting:

* Defining a Class Hierarchy for Type Casting
* Type Casting for Any and AnyObject

From Nested Types:

* Nested Types In Action
* Referring To Nested Types

From Advanced Operators:

* Overflow Operators


##### Reflections

Initialising properties and assigning them with default values within the declaration of the property is such a brilliant idea. This is of course the same as doing it in the initialiser, but the fact that you define it in the declaration cleans up the initialiser code and structures the initialisation declarations in a much better way.

```
class Map {

    var tiles: [[Int]]

    init(width: Int, height: Int) {
        tiles = Array(repeating: Array(repeating: 0, count: height), count: width)
    }
}

let defaultMap: Map = {

    let map = Map(width: 16, height: 16)
    map.tiles[0][3] = 1
    map.tiles[3][15] = 3
    map.tiles[15][9] = 2

    return map
}()
```

With that I've finished reading assignment 2.
