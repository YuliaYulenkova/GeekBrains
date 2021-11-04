//
//  main.swift
//  Basics
//
//  Created by Yulia Yulenkova on 16.10.2021.
//

import Foundation

enum Classes {
    case champion
    case guardian
    case hunter
    case loreMaster
    case minstrel
}

struct Char {
    let classChar: Classes
    let dpsChar: Int
}

extension Char: CustomStringConvertible {
    var description: String {
        return "Class - \(classChar) with DPS \(dpsChar)"
    }
}

struct Queue<T> {
    private var raid = [T]()

    mutating func addInRaid(character: T) {
        raid.append(character)
    }

    func printRaid() {
        print(raid)
    }

    subscript(index: Int) -> T? {
        guard index >= 0, index < raid.count else { return nil }
        return raid[index]
    }
}

extension Queue {
    func filterByDps(char: (T) -> Bool) -> [T] {
        var raidMembers = [T]()
        for dps in raid where char(dps) {
            raidMembers.append(dps)
        }
        return raidMembers
    }
}

var queueInRaid = Queue<Char>()
queueInRaid.addInRaid(character: .init(classChar: .hunter, dpsChar: 300))
queueInRaid.addInRaid(character: .init(classChar: .guardian, dpsChar: 250))
queueInRaid.addInRaid(character: .init(classChar: .champion, dpsChar: 195))
queueInRaid.addInRaid(character: .init(classChar: .loreMaster, dpsChar: 180))
queueInRaid.addInRaid(character: .init(classChar: .minstrel, dpsChar: 200))

queueInRaid.printRaid()

var finalRaid = queueInRaid.filterByDps(char: { $0.dpsChar >= 200 })
print("Итоговый состав рейда:\n\(finalRaid)")

