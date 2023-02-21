//
//  IFControl+Render.swift
//  IFDoors
//
//  Created by Илья on 21.02.2023.
//

import Foundation
import UIKit

public extension UIControl {
    private func clearPropsTarget(){
            for target in self.allTargets {
                if target is IFControlProps || target is NSNull {
                    self.removeTarget(target, action: nil, for: .allEvents)
                }
            }
    }
    
    func renderProps(_ props: IFControlProps?) {
        self.clearPropsTarget()
        super.renderProps(props)
        if let props = props{
            self.addTarget(props, action: #selector(IFControlProps.didTriggerTouchUpInsideAction(_ :)), for: .touchUpInside)
        }
    }
}
