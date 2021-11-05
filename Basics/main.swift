//
//  main.swift
//  Basics
//
//  Created by Yulia Yulenkova on 16.10.2021.
//

import Foundation

enum GemSlot {
    case full
    case empty
}

enum BindToChar {
    case bind
    case notBind
}

enum ArmourError: Error {
    case gemAlreadyAdded
    case armourBindToChar
}

final class Armour {
    private var gem: GemSlot
    private let binding: BindToChar

    init (gem: GemSlot, binding: BindToChar) {
        self.gem = gem
        self.binding = binding
    }

    func addGem() throws {
        guard gem == .empty else { throw ArmourError.gemAlreadyAdded }
        gem = .full
        return print("Gem has added")
    }

    func shareItem() throws {
        guard binding == .notBind else { throw ArmourError.armourBindToChar }
        return print("Armour has removed")
    }
}

let lightChestwear = Armour(gem: .full, binding: .bind)

do {
    try lightChestwear.addGem()
} catch ArmourError.gemAlreadyAdded {
    print("This armour has a gem already")
}

do {
    try lightChestwear.shareItem()
} catch ArmourError.armourBindToChar {
    print("This armour is bind to your character")
}
