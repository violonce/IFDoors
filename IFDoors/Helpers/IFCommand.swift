//
//  IFCommand.swift
//  IFDoors
//
//  Created by Илья on 21.02.2023.
//

import Foundation

final class Command {
    
    private let action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    func perform() {
        action()
    }
}

final class CommandWith<T> {
    
    private let action: (T) -> Void
    
    init(action: @escaping (T) -> Void) {
        self.action = action
    }
    
    func perform(with value: T) {
        action(value)
    }
}
