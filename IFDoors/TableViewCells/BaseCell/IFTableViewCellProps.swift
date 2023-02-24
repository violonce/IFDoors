//
//  IFTableViewCellProps.swift
//  IFDoors
//
//  Created by Илья on 21.02.2023.
//

import Foundation

public class IFTableViewCellProps: IFViewProps {
    public var indexPath: IndexPath = IndexPath.init(row: 0, section: 0)
    public var reuseId: String = ""
}
