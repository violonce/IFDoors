//
//  IFDoorsTableViewCellProps.swift
//  IFDoors
//
//  Created by Илья on 21.02.2023.
//

import Foundation

class IFDoorTableViewCellProps: IFTableViewCellProps {
    var actionViewProps: IFControlProps!
    var stateImageViewProps: IFImageViewProps!
    var lockedStateImageViewProps: IFImageViewProps!
    var titleLabelProps: IFLabelProps!
    var descriptionLabelProps: IFLabelProps!
    var doorStateImageViewProps: IFImageViewProps!
    var lockedButtonProps: IFButtonProps!
    
    var loadingState:Bool = false
    
    public func configurateCell(cell: IFDoorTableViewCell) {
        cell.actionView?.renderProps(self.actionViewProps)
        cell.stateImageView?.renderProps(self.stateImageViewProps)
        cell.lockedStateImageView?.renderProps(self.lockedStateImageViewProps)
        cell.titleLabel?.renderProps(self.titleLabelProps)
        cell.descriptionLabel?.renderProps(self.descriptionLabelProps)
        cell.doorStateImageView?.renderProps(self.doorStateImageViewProps)
        cell.lockedButton?.renderProps(self.lockedButtonProps)
    }
}
