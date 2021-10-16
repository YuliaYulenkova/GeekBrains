//
//  main.swift
//  Basics
//
//  Created by Yulia Yulenkova on 16.10.2021.
//

import Foundation

// Задание 1
// a = 4, b = 5, c = 6 - уравнение не имеет решений
// a = 4, b = -12, c = 9 - уравнение имеет одно решение
// a = 2, b = 3, c = -27 - уравнение имеет два решения

let a = 2.0
let b = 3.0
let c = -27.0

let d = pow(b, 2) - 4 * a * c // Вычисление дискриминанта

if d < 0 {
    print("Данное квадратное уравнение не имеет решений, так как дискриминант меньше 0")
} else if d == 0 {
    let x = (-b + sqrt(d)) / (2 * a)
    print("x = \(x)")
} else {
    let x1 = (-b + sqrt(d)) / (2 * a)
    let x2 = (-b - sqrt(d)) / (2 * a)
    print("x1 = \(x1), x2 = \(x2)")
}

// Задание 2

let katet1 = 3.0
let katet2 = 4.0

let s = (katet1 * katet2) / 2
print("Площадь прямоугольного треугольника равна \(s)")

let p = sqrt(pow(katet1, 2) + pow(katet2, 2)) + (katet1 + katet2)
print("Периметр прямоугольного треугольника равен \(p)")

let g = sqrt(pow(katet1, 2) + pow(katet2, 2))
print("Гипотенуза прямоугольного треугольника равна \(g)")

// Задание 3

let deposit = 10000.0 // сумма вклада
let percent = 5.0
var finalSumm = deposit

let year = 1...5
for _ in year {
    finalSumm *= (percent / 100) + 1
}

print("Сумма Вашего вклада через 5 лет составит \(round(finalSumm))")
