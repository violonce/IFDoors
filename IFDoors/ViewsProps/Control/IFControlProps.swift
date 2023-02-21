//
//  IFControlProps.swift
//  IFDoors
//
//  Created by Илья on 21.02.2023.
//

import Foundation
import UIKit

public class IFControlProps: IFViewProps {
    var touchUpInsideCommand: Command?
    
    @objc public func didTriggerTouchUpInsideAction(_ sender: UIControl) {
        self.touchUpInsideCommand?.perform()
    }
}
