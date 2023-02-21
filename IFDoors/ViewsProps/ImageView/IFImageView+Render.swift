//
//  IFImageView+Render.swift
//  IFDoors
//
//  Created by Илья on 21.02.2023.
//

import Foundation
import UIKit

public extension UIImageView {
    func renderProps(_ props: IFImageViewProps?) {
        super.renderProps(props)
        if let props = props{
            self.image = props.image
        }
    }
}
