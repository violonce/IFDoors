//
//  IFView+Props.swift
//  IFDoors
//
//  Created by Илья on 21.02.2023.
//

import Foundation
import UIKit

private var associateKey: Void?

public extension UIView {
    private(set) var props: IFViewProps? {
        get {
            return objc_getAssociatedObject(self, &associateKey) as? IFViewProps
        }
        set {
            objc_setAssociatedObject(self, &associateKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }

    func renderProps(_ props: IFViewProps?) {
        self.props = props
        if let props = props {
            self.tag = props.tag
            self.isUserInteractionEnabled = props.userInteractionEnabled
        }
    }
}
