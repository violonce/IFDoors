//
//  IFAutoDimentionTableView.swift
//  IFDoors
//
//  Created by Илья on 24.02.2023.
//

import UIKit

class IFAutoDimensionTableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.estimatedRowHeight = UITableView.automaticDimension
        self.estimatedSectionHeaderHeight = UITableView.automaticDimension
        self.estimatedSectionFooterHeight = UITableView.automaticDimension
        
        self.rowHeight = UITableView.automaticDimension
        self.sectionHeaderHeight = UITableView.automaticDimension
        self.sectionFooterHeight = UITableView.automaticDimension
    }
}
