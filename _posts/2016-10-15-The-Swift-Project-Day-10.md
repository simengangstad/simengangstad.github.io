---
layout: post
title: "The Swift Project: Day 10"
description: ""
category:
tags: [swift, iOS]
---

{% include JB/setup %}

I've been on a holiday the last few days, so I'm sorry for the lack of updates.

Due homework to the 13.10.16 and 15.10.16, respectively, was:
* [ x ] Reading Assignment 1
* [ x ] Programming Assignment 1

Both of these got finished for the due date.

Due for 20.10.16:

* [   ] Reading Assignment 2

Due for 22.10.16:

* [   ] Programming Assignment 2

##### done

Watched the third lecture.

Read the following from The Swift Programming Guide, edition 3...

The Basics:

* Numeric Type Literals
* Type aliases
* Tuples


Basic operators:

* Nil Coalescing Operator

Strings and Characters:

* Unicode
* Accessing and Modifying a String
* Unicode Representations of Strings

Control flow:

* Early Exit
* Checking API Availability

Functions:

* Functions with Multiple Return Values
* Optional Tuple Return Types
* Function Parameter Names

##### Reflections

The lecture goes through some basics in Swift and the foundation framework. Such as optionals, tuples, ranges, data structures

*Optionals*
Optionals do come with a lot of syntaxical sugar, for example:

```
let string = label.text ?? " "
```


If the optional .text is nil string will be set to the default value, which is after the double question mark, " ".


*Value types (structs and enums)*
Must includes *mutating* for enums and structs before functions which mutate the contents.


*Which data structure to use?*
Structs tends to be used for fundamental types (vectors, rectangles, ints). Use enum every time you've got some discrete data.


*Methods*
Functions can have internal names and external names, which is quite neat:

```
func foo(externalFirst first: Int, externalSecond second: Int) {

  var count = 0

  for _ first..<second { count += 1}
}


foo(externalFirst: 1, externalSecond: 10)
```

Underscore can also be used to make it possible to ignore the first external name of the function.

**final** is used for preventing subclasses to override functions, properties or the whole class. **static** for type methods or properties, which is similar to Java syntax (for example Double.abs(var)).


*Properties*
Observing changes to the property with **willSet** and **didSet** is so cool, awesome feature.

*Lazy initialisation*
A property that doesn't get initialised until someone accesses it (one has to declare using the **lazy** keyword). This can be useful for loading big files which aren't needed at start up, but later has to be loaded into memory. With declaring the property as lazy one avoids the compiler complaining.

*Initialsation*
I do like that within an **init** you can set let properties.



*The continuation of the calculator*

One of the things covered in the lecture was the ability to store calculator 'programs' which can be retrieved and passed to the calculator brain. For example one can store 3 x 4 / 3, which will output 4. Paul Hegarty solved this by storing an array of AnyObject which he appended for each operand set and operation performed, so [3, x, 4, /, 3]. This makes it highly flexible as one can just iterate through this array and get the same output.  This is the code he used to get and set the program (internal program is the array of AnyObjects):

```
    typealias PropertyList = AnyObject
    var program: PropertyList {
        get {
            return internalProgram as CalculatorBrain.PropertyList // It's a value type, so only a copy is returned
        }
        set {
            clear()
            if let arrayOfOps = newValue as? [AnyObject] {
                for op in arrayOFOps {
                    if let operand = op as? Double { setOperand(operand: operand) }
                    else if let operation = op as? String { performOperation(symbol: operation) }
                }
            }
        }
    }

    func clear() {
        accumulator = 0.0
        pending = nil
        internalProgram.removeAll()
    }
```

Notice the typealias, that forces you to set the program as a `PropertyList`, which is quite nice. When the program is set we do a simple check for Doubles and Strings and feed those into the `setOperand(operand: Double)` and `performOperation(symbol: String)`.

I needed to adapt this to my operation stack as well, so the code became:

```
    public struct PropertyList {
        var program: [AnyObject]
        var operations: [AnyObject]
    }

     //typealias PropertyList = (program: [AnyObject], operations: [AnyObject])

    var program: PropertyList {
        get {

            var ops = [AnyObject]()

            for item in operationStack.items {
                ops.append(item as AnyObject)
            }

            return PropertyList(program: internalProgram, operations: ops)
        }
        set {
            clear()
            clearOperations()

            for op in newValue.program {
                if let operand = op as? Double { setOperand(operand: operand) }
                else if let operation = op as? String { performOperation(symbol: operation) }
            }

            for item in newValue.operations {
                operationStack.push(item as! String)
            }
        }
    }
```

Where my `PropertyList` is a struct instead and also stores the operation stack in the form of an array of `AnyObject`. I don't use a tuple in this instance because Swift guidelines advises you to use structs if the data persists longer than temporarily.

“Tuples are useful for temporary groups of related values. They are not suited to the creation of complex data structures. If your data structure is likely to persist beyond a temporary scope, model it as a class or structure, rather than as a tuple”

Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3).” iBooks.  
