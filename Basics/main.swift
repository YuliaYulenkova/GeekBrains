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

enum Actions {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case openTrunk
    case closeTrunk
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

class Car {
    private let model: String
    private let year: Int
    private let horsePower: Int
    var engineState: Engine
    var windowsState: Windows
    var trunkState: Trunk

    init(model: String,
         year: Int,
         horsePower: Int,
         engineState: Engine,
         windowsState: Windows,
         trunkState: Trunk)
    {
        self.model = model
        self.year = year
        self.horsePower = horsePower
        self.engineState = engineState
        self.windowsState = windowsState
        self.trunkState = trunkState
    }

    func actionWithCar(action: Actions) {

        switch action {
        case .startEngine:
            self.engineState = .start
            print("Двигатель запущен")
        case .stopEngine:
            self.engineState = .stop
            print("Двигатель заглушен")
        case .openWindows:
            self.windowsState = .open
            print("Окна открыты")
        case .closeWindows:
            self.windowsState = .close
            print("Окна закрыты")
        case .openTrunk:
             self.trunkState = .open
             print("Багажник открыт")
         case .closeTrunk:
             self.trunkState = .close
             print("Багажник закрыт")
        }
    }

    func info() {
        print("\nМарка автомобиля: \(self.model)" + "\nГод выпуска: \(self.year)" + "\nМощность: \(self.horsePower)")
    }
}

final class SportCar: Car {

    private let color: Colors
    private let acceleration: Double
    var spoilerState: Spoiler

    init(model: String,
         year: Int,
         horsePower: Int,
         color: Colors,
         acceleration: Double,
         spoilerState: Spoiler)
    {
        self.color = color
        self.acceleration = acceleration
        self.spoilerState = spoilerState
        super.init(model: model, year: year, horsePower: horsePower, engineState: .stop, windowsState: .close, trunkState: .close)
    }

    override func info() {
        super.info()
        print("Цвет: \(color.rawValue)" + "\nСкорость разгона до 100 км/ч: \(acceleration)\n")
    }
}

final class TruckCar: Car {

    private let trunkVolume: Int
    var fullnessOfTrunk: Int

    init(model: String,
         year: Int,
         horsePower: Int,
         trunkVolume: Int,
         trunkState: Trunk,
         fullnessOfTrunk: Int)
    {
        self.trunkVolume = trunkVolume
        self.fullnessOfTrunk = fullnessOfTrunk
        super.init(model: model, year: year, horsePower: horsePower, engineState: .stop, windowsState: .close, trunkState: .close)
    }

    func addCargo(weight: Int) {
        if trunkState == .open && fullnessOfTrunk + weight < trunkVolume {
            self.fullnessOfTrunk += weight
            print("Осталось места в кузове: \(trunkVolume - fullnessOfTrunk)")
        } else if trunkState == .close {
            print("Сначала откройте кузов")
        } else {
            print("Данный груз превышает объем кузова")
        }
    }

    override func info() {
        super.info()
        print("Объем кузова: \(self.trunkVolume)\n")
    }
}

let man = TruckCar(model: "Man", year: 2019, horsePower: 700, trunkVolume: 2000, trunkState: .close, fullnessOfTrunk: 200)
man.info()

man.trunkState = .open
man.addCargo(weight: 400)
print(man.fullnessOfTrunk)
man.actionWithCar(action: .openWindows)
print(man.windowsState)

let bugatti = SportCar(model: "Bugatti", year: 2020, horsePower: 1000, color: .gold, acceleration: 2.5, spoilerState: .hide)
bugatti.info()
print(bugatti.spoilerState)
