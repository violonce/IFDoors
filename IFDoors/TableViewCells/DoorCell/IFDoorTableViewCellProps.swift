//
//  IFDoorsTableViewCellProps.swift
//  IFDoors
//
//  Created by Илья on 21.02.2023.
//

import Foundation

public class IFDoorTableViewCellProps: IFTableViewCellProps {
    var actionViewProps: IFControlProps!
    var stateImageViewProps: IFImageViewProps!
    var lockedStateImageViewProps: IFImageViewProps!
    var titleLabelProps: IFLabelProps!
    var descriptionLabelProps: IFLabelProps!
    var doorStateImageViewProps: IFImageViewProps!
    var lockedButtonProps: IFButtonProps!
    
    var loading:Bool = false
}
