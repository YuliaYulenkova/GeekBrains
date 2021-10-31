//
//  main.swift
//  Basics
//
//  Created by Yulia Yulenkova on 16.10.2021.
//

import Foundation

enum Engine {
    case start
    case stop
}

enum Windows {
    case open
    case close
}

enum Trunk {
    case open
    case close
}

enum Colors: String {
    case orange = "оранжевый"
    case red = "красный"
    case green = "зеленый"
    case blue = "синий"
    case gold = "золотой"
    case silver = "серебряный"
}

enum Spoiler {
    case show
    case hide
}

protocol Car {
    var engineState: Engine { get set }
    var windowsState: Windows { get set }
    var trunkState: Trunk { get set }
}

extension Car {
    mutating func actionWithEngine(action: Engine) {
        switch action {
        case .start:
            engineState = .start
            print("Двигатель запущен")
        case .stop:
            engineState = .stop
            print("Двигатель заглушен")
        }
    }

    mutating func actionWithWindows(action: Windows) {
        switch action {
        case .open:
            windowsState = .open
            print("Окна открыты")
        case .close:
            windowsState = .close
            print("Окна закрыты")
        }
    }

    mutating func actionWithTrunk(action: Trunk) {
        switch action {
        case .open:
             trunkState = .open
             print("Багажник открыт")
         case .close:
             trunkState = .close
             print("Багажник закрыт")
        }
    }
}

final class SportCar: Car {
    private let model: String
    private let year: Int
    private let horsePower: Int
    private let color: Colors
    private let acceleration: Double
    var engineState: Engine
    var windowsState: Windows
    var trunkState: Trunk
    var spoilerState: Spoiler

    init(model: String,
         year: Int,
         horsePower: Int,
         color: Colors,
         acceleration: Double,
         engineState: Engine,
         windowsState: Windows,
         trunkState: Trunk,
         spoilerState: Spoiler)
    {
        self.model = model
        self.year = year
        self.horsePower = horsePower
        self.color = color
        self.acceleration = acceleration
        self.engineState = engineState
        self.windowsState = windowsState
        self.trunkState = trunkState
        self.spoilerState = spoilerState
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "\nМарка автомобиля: \(model)" + "\nГод выпуска: \(year)" + "\nМощность: \(horsePower)" + "\nЦвет: \(color.rawValue)" + "\nСкорость разгона до 100 км/ч: \(acceleration)\n"
    }
}

final class TruckCar: Car {
    private let model: String
    private let year: Int
    private let horsePower: Int
    private let trunkVolume: Int
    var engineState: Engine
    var windowsState: Windows
    var trunkState: Trunk
    var fullnessOfTrunk: Int

    init(model: String,
         year: Int,
         horsePower: Int,
         trunkVolume: Int,
         engineState: Engine,
         windowsState: Windows,
         trunkState: Trunk,
         fullnessOfTrunk: Int)
    {
        self.model = model
        self.year = year
        self.horsePower = horsePower
        self.trunkVolume = trunkVolume
        self.engineState = engineState
        self.windowsState = windowsState
        self.trunkState = trunkState
        self.fullnessOfTrunk = fullnessOfTrunk
    }

    func addCargo(weight: Int) {
        if trunkState == .open, fullnessOfTrunk + weight < trunkVolume {
            fullnessOfTrunk += weight
            print("Осталось места в кузове: \(trunkVolume - fullnessOfTrunk)")
        } else if trunkState == .close {
            print("Сначала откройте кузов")
        } else {
            print("Данный груз превышает объем кузова")
        }
    }
}

extension TruckCar: CustomStringConvertible {
    var description: String {
        return "\nМарка автомобиля: \(model)" + "\nГод выпуска: \(year)" + "\nМощность: \(horsePower)" + "\nОбъем кузова: \(trunkVolume)\n"
    }
}

var man = TruckCar(model: "Man", year: 2019, horsePower: 700, trunkVolume: 2000, engineState: .stop, windowsState: .close, trunkState: .close, fullnessOfTrunk: 500)

print(man.description)

man.trunkState = .open
man.addCargo(weight: 400)
print(man.fullnessOfTrunk)
man.actionWithWindows(action: .open)

let bugatti = SportCar(model: "Buggati", year: 2018, horsePower: 1100, color: .gold, acceleration: 2.5, engineState: .stop, windowsState: .open, trunkState: .close, spoilerState: .hide)

print(bugatti.description)
print(bugatti.spoilerState)
