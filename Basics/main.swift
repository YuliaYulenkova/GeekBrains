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

struct SportCar {

    let model: String
    let year: Int
    let horsePower: Int
    let color: Colors
    var engineState: Engine
    var windowsState: Windows
    var trunkState: Trunk

    mutating func actionWithCar(action: Actions) {

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
        print("Марка спортивного автомобиля: \(self.model)" +
              "\nГод выпуска: \(self.year)" +
              "\nМощность: \(self.horsePower)" +
              "\nЦвет: \(color.rawValue)\n")
    }
}

struct TrunkCar {

    let model: String
    let year: Int
    let trunkVolume: Int
    var fullnessOfTrunk: Int
    var engineState: Engine
    var windowsState: Windows
    var trunkState: Trunk

    mutating func actionWithCar(action: Actions) {

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
            print("Кузов открыт")
        case .closeTrunk:
            self.trunkState = .close
            print("Кузов закрыт")
        }

    }

    mutating func addCargo(weight: Int) {
        if trunkState == .open && fullnessOfTrunk + weight < trunkVolume {
            self.fullnessOfTrunk += weight
            print("Осталось места в кузове: \(trunkVolume - fullnessOfTrunk)")
        } else if trunkState == .close {
            print("Сначала откройте кузов")
        } else {
            print("Данный груз превышает объем кузова")
        }
    }

    func info() {
        print("Марка грузового автомобиля: \(self.model)" +
              "\nГод выпуска: \(self.year)" +
              "\nОбъем кузова: \(self.trunkVolume)\n")
    }
}

var car = SportCar(model: "Ferrari", year: 2018, horsePower: 900, color: .gold, engineState: .start, windowsState: .close, trunkState: .close)

car.info()

var trunk = TrunkCar(model: "Man", year: 2019, trunkVolume: 1000, fullnessOfTrunk: 100, engineState: .start, windowsState: .close, trunkState: .close)

trunk.info()
trunk.actionWithCar(action: .openTrunk)
trunk.addCargo(weight: 700)

