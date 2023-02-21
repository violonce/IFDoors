//
//  IFTableViewCell.swift
//  IFDoors
//
//  Created by Илья on 21.02.2023.
//

import Foundation
import UIKit

public class IFTableViewCellBase : UITableViewCell, IFViewLifeCycle {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
