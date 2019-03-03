//
//  CalculatorEngine.swift
//  iOS Calculator
//
//  Created by Manas Paranjape on 12/15/18.
//  Copyright © 2018 DesignX6. All rights reserved.
//

import Foundation

var currentValue:Double = 0;
var opJob:Double = 0;
var operation:String = "";

class CalculatorEngine {
    struct Opwrapper {
        var operand:Double
        var operation:String
    }
    func clear() {
        opJob = 0
        operation = "";
        currentValue = 0
    }
    struct OperandStack {
        var items = [Double]()
        mutating func push(_ item: Double) {
            items.append(item)
        }
        mutating func pop() -> Double {
            return items.removeLast()
        }
    }
    var doubleStack = OperandStack()
    func percenter (original: Double) -> Double {
        return (original/100)
    }
    func posNeg(original: Double) -> Double {
        let original2 = original * Double(-1)
        return original2
    }
    func loadParameters(operand: Double, operationPassed: String = "") {
        if currentValue == Double(0) {
            operation = operationPassed
            doubleStack.push(operand)
            currentValue = operand
            print(currentValue)
        } else {
            currentValue = doubleStack.pop()
            print(currentValue)
            if operation == "23" {
                currentValue = add(operand1: currentValue, operand2: operand)
            }
            if operation == "22" {
                currentValue = subtract(operand1: currentValue, operand2: operand)
            }
            if operation == "21" {
                currentValue = multiply(operand1: currentValue, operand2: operand)
            }
            if operation == "20" {
                currentValue = division(operand1: currentValue, operand2: operand)
            }
            doubleStack.push(currentValue)
            print(currentValue)
            operation = operationPassed
        }
    }
    func add(operand1: Double, operand2: Double) -> Double {
        return operand2 + operand1
    }
    func subtract(operand1: Double, operand2: Double) -> Double {
        return operand1 - operand2
    }
    func multiply(operand1: Double, operand2: Double) -> Double {
        return operand2 * operand1
    }
    func division(operand1: Double, operand2: Double) -> Double {
        if operand2 == Double(0) {
            print("You cannot divide by zero.")
        }
        return operand1 / operand2
    }
    func returnAnswer() -> Double {
        return currentValue
    }
}
