//
//  main.swift
//  Basics
//
//  Created by Yulia Yulenkova on 16.10.2021.
//

import Foundation

func evenNumber(number: Int) -> Bool {
    number % 2 == 0 ? true : false
}

func divisibleByThree(number: Int) -> Bool {
    number % 3 == 0 ? true : false
}

func createArray() -> [Int] {
    var newArray = [Int]()

    for element in 1...100 {
        newArray.append(element)
    }

    return newArray
}

var filteredArray = createArray()

var element = filteredArray.count - 1

while element >= 0 {
    if evenNumber(number: filteredArray[element]) || !divisibleByThree(number: filteredArray[element]) {
        filteredArray.remove(at: element)
    }
    element -= 1
}

print(filteredArray)

// Числа Фибоначчи

func fibonacci(count: Int) -> [Int] {
    var fibonacciNumbers = [1, 1]

    for element in 2...count - 1 {
        fibonacciNumbers.append(fibonacciNumbers[element - 1] + fibonacciNumbers[element - 2])
    }
    return fibonacciNumbers

}

print(fibonacci(count: 50))

// Решето Эратосфена

var seive = [Int]()
var primeNumbers = [Int]()
let numbers = 600

for prime in 2..<numbers {
    if !seive.contains(prime) && primeNumbers.count < 100 {
        primeNumbers.append(prime)
        for composite in stride(from: prime * prime, to: numbers, by: prime) {
            seive.append(composite)
        }
    }
}

print(primeNumbers)


