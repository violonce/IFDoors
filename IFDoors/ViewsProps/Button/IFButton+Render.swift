//
//  IFButton+Render.swift
//  IFDoors
//
//  Created by Илья on 21.02.2023.
//

import Foundation
import UIKit

public extension UIButton  {
    func renderProps(_ props: IFButtonProps?) {
        super.renderProps(props)
        if let props = props{
            guard props.title != nil  else {
                self.setImage(props.titleImage, for: .normal)
                return
            }
            self.setTitle(props.title, for: .normal)
            self.setTitleColor(props.titleColor, for: .normal)
            self.setTitleColor(props.titleColor, for: .selected)
        }
    }
}
