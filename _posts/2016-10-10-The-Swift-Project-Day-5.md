---
layout: post
title: "The Swift Project: Day 5"
description: ""
category:
tags: [swift, iOS]
---

{% include JB/setup %}


##### Done

Read the following from The Swift Programming Guide, edition 3...


From Closures:

* Closure Expressions
* Trailing Closures


From Enumerations:

* Enumeration Syntax
* Matching Enumeration Values with a Switch Statement
* Associated Values


From Classes and Structures:

* Comparing Classes and Structures


Watched the second lecture.

##### Reflections


*Dictionaries*

After some though I have to disagree with myself about what I wrote yesterday in terms of dictionaries. If one assumes that *nil* means "not set" for *everything*, then this syntax does make sense: `dictionary[key] = nil`. Because you're setting *key* to not set, aka it doesn't exist in the dictionary, aka it is removed. Though do I have to admit that it still makes it a bit funky when you've got optional values in the dictionary. It might be easy to forget that exclamation mark and remove the value instead of setting it to nil.


*Closures*

```
names.sorted(by: {(s1: String, s2: String) -> Bool in return s1 < s2})
names.sorted(by: {s1, s2 in s1 < s2}) // can also be written like this
names.sorted(by: {$0 < $1}) // can also be written using shorthand argument names
names.sorted(by: <) // and to make it ridiculous
names.sorted() { // Can also be written as a trailing closure, where the closure is a kind of function body

    $0 < $1
}
```

This will take some time getting used to, but it’s super handy for reducing boilerplate code.  

*Enums*

Enums seem so powerful. Consider the following case:

```
enum Colour {

    case rgba(Int, Int, Int, Int)
    case hex(Int)
    case hsb(Int, Int, Int)
}

var colour = Colour.hex(0xff00ffff)

switch colour {

    case .rgba(let red, let green, let blue, let alpha):

        // Do something if rgba

    case .hex(let value):

        let alpha = value & 0x000000ff
        let blue = (value & 0x0000ff00) >> 8
        let green = (value & 0x00ff0000) >> 16
        let red = (value & 0xff000000) >> 32

        colour = .rgba(red, green, blue, alpha)

    case .hsb(let hue, let saturation, let brightness):

        // Do something if hsb
}
```

Here one can specify the colour in a simple enum without encapsulating that functionality in a class.  

*Structures*

This is an unknown area to me, but as I understand it structures are not passed by reference, they cannot inherit, not be checked for a specific type and do not include deinitialisers. I guess they’re valuable for instances like ints, doubles, vectors.

“When an instance of a value type is marked as a constant, so are all of its properties.”

Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3).” iBooks. https://itun.es/no/jEUH0.l

This is quite interesting. Even though the structure includes properties which are mutable, defining the structure as immutable makes it impossible to change the mutable properties.


*The second lecture*

This lecture is about building the model for a calculator app. It’s done beautifully with the use of enums, switch and closures:

```
        private enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
```
Here we got an enum, which defines if the ‘operation’ associated with the button the user is pressing is a constant (π, e, etc.), a unary operation (cos, sqrt, etc.), a binary operation (+, -, /, x, etc.) or an equals operation (which is just pressing the equals button).

```
    private let operations = [
        "π" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E),
        "√" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos),
        "⨯" : Operation.BinaryOperation({$0 * $1}),
        "/" : Operation.BinaryOperation({$0 / $1}),
        "+" : Operation.BinaryOperation({$0 + $1}),
        "-" : Operation.BinaryOperation({$0 - $1}),
        "=" : Operation.Equals
    ]
```
A dictionary holds the different symbols and their associated operations. With the help of closures one can achieve less boilerplate code as seen with the binary operations.

```
    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant(let associatedConstantValue):
                accumulator = associatedConstantValue
            case .UnaryOperation(let unaryOperation):
                accumulator = unaryOperation(accumulator)
            case .BinaryOperation(let binaryOperation):
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryOperation: binaryOperation, firstOperand: accumulator)
            case .Equals:
                executePendingBinaryOperation()
            }
        }
    }
```
Perform operation is called with a mathematical symbol. This symbol is looked up in the operations dictionary for the associated operation. The operation – or just the assignment to a constant – is then carried through, storing the value in the accumulator. For binary operations a pending binary operation is stored so that one can retrieve the first value of that binary operation later. The structure of that is as follows:

```
    private var pending: PendingBinaryOperationInfo?

    private struct PendingBinaryOperationInfo {
        var binaryOperation: (Double, Double) -> Double
        var firstOperand: Double
    }

    private func executePendingBinaryOperation() {
        if (pending != nil) {
            accumulator = pending!.binaryOperation(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
```

All this makes the model of the app highly flexible, as one can easily add new operations to the operations dictionary.

The plan for tomorrow is to finish programming assignment 1.
