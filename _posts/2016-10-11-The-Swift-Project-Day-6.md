---
layout: post
title: "The Swift Project: Day 6"
description: ""
category:
tags: [swift, iOS]
---

{% include JB/setup %}


{: .center}
![Calculator]({{ site.url }}/resources/calc.gif)

##### Done

Programming assignment 1

##### Reflections

*Programming Assignment 1*

*1. Allow floating point numbers to be entered*

This problem is concerned with the controller, because it processes what the view is doing and how to respond to that so a valid number can be passed to the model. Firstly I attached the decimal point button to the touchDigit IBAction. In this function we can use a bool that gets set if the user presses the decimal point button. This bool prevents more decimal points in the same number:

```
    @IBAction private func touchDigit(_ sender: UIButton) {

        let digit = sender.currentTitle!

        if (digit == ".") {
            if (!decimalPointInNumber) {
                decimalPointInNumber = true
            }
            else {
                return;
            }
        }

        if (userIsInTheMiddleOfTyping) {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }
        else {
            display.text = digit
        }

        userIsInTheMiddleOfTyping = true
    }
```

The bool is set to false in the performOperation along with the `userIsInTheMiddleOfTyping` bool.

*2. Add more operations and use colour to make the UI look nice*

I added the following operations: sin, tan, log, ln and raise to the power of:

```
    private let operations = [
	// ...
        "sin" : Operation.UnaryOperation(sin),
        "tan" : Operation.UnaryOperation(tan),
        "log" : Operation.UnaryOperation(log10),
        "ln" : Operation.UnaryOperation(log),
        "^" : Operation.BinaryOperation({pow($0, $1)}),
	// ...
    ]
```

One problem that arises if you add two numbers together without pressing the equals button and then press a unary operation, the unary operation will operate on the last number, not the sum. To fix this, one can add `executePendingBinaryOperation()` to the case of unary operation:

```
            case .UnaryOperation(let unaryOperation):
                executePendingBinaryOperation()
                accumulator = unaryOperation(accumulator)
```

*3. Descriptive string of the operations and numbers pressed with associated labels*

This was quite a tricky task. I decided to use strings in a <a href="https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Generics.html" target="_blank"><i>stack</i></a> (scroll down to Generic Types) to keep track of the user input (my code is taken from Apple's example):

```
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    mutating func clear() {
        items.removeAll()
    }
    func isEmpty() -> Bool {
        return items.isEmpty
    }
}
```

Every time the user inputs a series of binary operations, such as `3 * 5 + 10` and then presses a unary operation I push the current operation, aka `3 * 5  + 10` on to the stack and then the unary operation. The unary operation, such as sqrt, is followed by an underscore as a reference to the operation in the stack under the current operation. An example is:

```
4. _ + 10
3. _^2
2. sqrt(_)
1. 3 * 5 + 10
```

This will end up being: (sqrt(3 * 5 + 10)^2) + 10 (see the gif to see it in demonstration)

This is done with a while loop going through the whole stack until it's empty (currentOperationChain is what the user is typing in during the current operation, such as in the examples above: '3 * 5 + 10', 'sqrt', '^2' and '+ 10'):

```
   private func resolveOperationStack() -> String {

        if (operationStack.isEmpty()) {return currentOperationChain}

        var stackCopy = operationStack;
        var completeOperation = stackCopy.pop()

        // If the first item of the stack is an unary operation we have to include a underscore so the rest
        // of the stack is filled in correctly
        if let operation = operations[completeOperation] {
            switch operation {
            case .UnaryOperation:
                completeOperation += "_"
            default:
                break;
            }
        }

        while (!stackCopy.isEmpty()) {
            let next = stackCopy.pop()
            // If the next operation in the stack is an operation which uses items in the next operation after that,
            // fill in with an underscore to make a reference to that.
            completeOperation = completeOperation.replacingOccurrences(of: "_", with: operations[next] != nil ? ("\(next)_") : ("(\(next))"))
        }

        return completeOperation
    }

```

Nothing too fancy going on here. I just replace the underscore for each operation with the next operation. And if the next operation is an operation which requires data from an operation after that, I just add an underscore.


This was quite good practice. I struggled some with the stack views to get them aligned properly so the app would appear nicely when oriented to landscape, and to get the stack operation system functional. The app has got some minor bugs, but it doesn't really matter as the main focus with this is practicing Swift and getting used to the iOS way of doing things.

The code is [here](https://github.com/simengangstad/The-Swift-Project)
