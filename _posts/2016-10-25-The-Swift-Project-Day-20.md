---
layout: post
title: "The Swift Project: Day 20"
description: ""
category:
tags: [swift, iOS]
---

{% include JB/setup %}

I'm extremely sorry for the lack of updates.

The problem I was struggling with for so long was the case where the user had pressed a number of operations with a variable in, and then changed the variable. The result for that expression should then reflect the new value of the variable. This was problematic with the solution I had implemented which updated the description of the mathematical operations on the fly as operations were performed. The code got quite messy so I decided to go for a new solution where the description is built from the program when requested:

```

var description: String {
    get {

        var operationStack = Stack<String>()
        var currentOperation = ""

        for op in internalProgram {

            if let operand = op as? Double {
                currentOperation.append(String(operand))
            }
            else if let operationOrVariableName = op as? String {

                if (operations.keys.contains(where: { $0 == operationOrVariableName })) {
                    switch operations[operationOrVariableName]! {

                    case .Constant:
                        currentOperation.append(operationOrVariableName)
                    case .UnaryOperation:
                        operationStack.push(currentOperation)
                        currentOperation = "\(operationOrVariableName)_"
                    case .BinaryOperation:
                        if (operationOrVariableName == "^" || operationOrVariableName == "/" || operationOrVariableName == "⨯") {
                            currentOperation.insert("(", at: currentOperation.startIndex)
                            currentOperation.insert(")", at: currentOperation.endIndex)
                        }
                        currentOperation.append(operationOrVariableName)

                    case .Equals:
                        break
                    }

                }
                else {
                    currentOperation.append(operationOrVariableName)
                }
            }
        }

        operationStack.push(currentOperation)

        var completeOperation = operationStack.pop()

        while (!operationStack.isEmpty()) {
            let next = operationStack.pop()
            // If the next operation in the stack is an operation which uses items in the next operation after that,
            // fill in with an underscore make a reference to that.
            completeOperation = completeOperation.replacingOccurrences(of: "_", with: operations[next] != nil ? ("\(next)_") : ("(\(next))"))
        }

        return completeOperation
    }
}

```

This makes it possible to run through the `program` multiple times and thus update the `accumulator` with the new variable without dealing with the implications of the changed description. To refresh the mathematical operations/run through the program with the new value of the variable I defined a refresh function which gets called every time the `variableValues` dictionary is changed:

```

private func refresh(program: PropertyList) {

    accumulator = 0.0
    pending = nil
    internalProgram.removeAll()

    if let arrayOfOps = program as? [AnyObject] {
        for op in arrayOfOps {
            if let operand = op as? Double {
                setOperand(operand: operand)
            }
            else if let operationOrVariableName = op as? String {
                // check if the string is an operation or variable
                if (operations.keys.contains(where: { $0 == operationOrVariableName })) {
                    performOperation(symbol: operationOrVariableName)
                }
                else {
                    setOperand(variableName: operationOrVariableName)
                }
            }
        }
    }        
}

```

Phew, so good to finally get that problem solved.
