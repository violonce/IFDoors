//
//  IFViewLiffeCycle.swift
//  IFDoors
//
//  Created by Илья on 21.02.2023.
//

import Foundation

protocol IFViewLifeCycle : NSObjectProtocol {
    func loadSubviews()
    func installLayoutConstraints()
    func subviewsDidLoad()
}
