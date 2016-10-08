---
layout: post
title: "The Swift Project: Day 3”
description: ""
category:
tags: [swift, iOS]
---
{% include JB/setup %}

##### Done

Read the following from The Swift Programming Guide, edition 3...

From Strings and Characters:

* String interpolation
* Counting Characters
* Comparing Strings

From Collection Types:

* Array
* Sets
* Performing Set Operations

##### Reflections

Having the ability to change a range of values in an array like this is super nice:

`shoppingList[4...6] = ["Bananas", "Apples"]`

This replaces the values at position 4, 5, *and* 6 with Bananas at index 4 and Apples at index 5.


Tuples in combination with iteration of an array is also quite neat:

```
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}
```

I've actually never used sets, because I haven't felt the need to.  They do appear extremely powerful and useful though, especially with operations such as `intersection`, `symmetricDifference` and `subtracting`.



I don't have time for any more reading today. The plan for tomorrow is to get through Dictionaries, Control Flow and Functions, as well as watching the next lecture. 

