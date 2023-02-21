//
//  IFLabel+Render.swift
//  IFDoors
//
//  Created by Илья on 21.02.2023.
//

import Foundation
import UIKit

public extension UILabel {
    func renderProps(_ props: IFLabelProps?) {
        super.renderProps(props)
        if let props = props {
            self.text = props.text
            self.textAlignment = props.textAlignment
            self.numberOfLines = props.numberOfLines
            self.isHighlighted = props.highlighted
        }
    }
}
