//
//  IFView.swift
//  IFDoors
//
//  Created by Илья on 21.02.2023.
//

import UIKit

public class IFView : UIView, IFViewLifeCycle {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.loadSubviews()
        self.installLayoutConstraints()
        self.subviewsDidLoad()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadSubviews() {
        
    }
    
    func installLayoutConstraints() {
        
    }
    
    func subviewsDidLoad() {
        
    }
}
