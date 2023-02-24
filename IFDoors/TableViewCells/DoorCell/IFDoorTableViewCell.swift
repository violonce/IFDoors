//
//  IFDoorsTableViewCell.swift
//  IFDoors
//
//  Created by Илья on 21.02.2023.
//

import Foundation
import UIKit
import SnapKit

public class IFDoorTableViewCell : IFTableViewCellBase {
    var actionView: UIControl!
    
    private var borderView: UIView!
    
    private var conteinerView: UIStackView!
    private var titleConteinerView: UIStackView!
    
    var stateImageView: UIImageView!
    var lockedStateImageView: UIImageView!
    
    private var titleTextConteinerView: UIStackView!
    var titleLabel: UILabel!
    var descriptionLabel: UILabel!
    
    var doorStateImageView: UIImageView!
    
    var lockedButton: UIButton!
    
    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
    
    override func loadSubviews() {
        super.loadSubviews()
        self.actionView = UIControl()
        self.borderView = UIView()
        self.conteinerView = UIStackView()
        self.titleConteinerView = UIStackView()
        self.stateImageView = UIImageView()
        self.lockedStateImageView = UIImageView()
        self.titleTextConteinerView = UIStackView()
        self.titleLabel = UILabel()
        self.descriptionLabel = UILabel()
        self.doorStateImageView = UIImageView()
        self.lockedButton = UIButton()
        
        self.contentView.addSubview(self.actionView)
        self.actionView.addSubview(self.borderView)
        self.borderView.addSubview(self.conteinerView)
        self.conteinerView.addArrangedSubview(self.titleConteinerView)
        self.conteinerView.addArrangedSubview(self.lockedButton)
        self.stateImageView.addSubview(self.lockedStateImageView)
        self.titleConteinerView.addArrangedSubview(self.stateImageView)
        self.titleConteinerView.addArrangedSubview(self.titleTextConteinerView)
        self.titleConteinerView.addArrangedSubview(self.doorStateImageView)
        self.titleTextConteinerView.addArrangedSubview(self.titleLabel)
        self.titleTextConteinerView.addArrangedSubview(self.descriptionLabel)
    }
    
    override func installLayoutConstraints() {
        super.installLayoutConstraints()
        self.actionView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(self.contentView)
        }
        self.borderView.snp.makeConstraints { make in
            make.leading.top.equalTo(self.actionView).offset(IFDoorsMetrics.littleIndent.rawValue)
            make.trailing.bottom.equalTo(self.actionView).offset(-IFDoorsMetrics.littleIndent.rawValue)
        }
        
        self.conteinerView.snp.makeConstraints { make in
            make.leading.equalTo(self.borderView).offset(IFDoorsMetrics.topIndent.rawValue)
            make.top.equalTo(self.borderView).offset(IFDoorsMetrics.topIndent.rawValue)
            make.trailing.equalTo(self.borderView).offset(-IFDoorsMetrics.topIndent.rawValue)
            make.bottom.equalTo(self.borderView)
        }
        
        self.lockedStateImageView.snp.makeConstraints { make in
            make.top.leading.equalTo(self.stateImageView).offset(IFDoorsMetrics.imageIntoImageIndent.rawValue).priority(.required)
            make.trailing.bottom.equalTo(self.stateImageView).offset(-IFDoorsMetrics.imageIntoImageIndent.rawValue).priority(.required)
        }
        
        self.lockedButton.snp.makeConstraints { make in
            make.height.equalTo(IFDoorsMetrics.buttonHieght.rawValue)
        }
        
    }
    
    override func subviewsDidLoad() {
        super.subviewsDidLoad()
        self.backgroundColor = IFDoorsColors.mainBackgroundColor.color
        self.titleLabel.textColor = IFDoorsColors.textColor.color
        self.titleLabel.font = IFDoorsFonts.font(name: .regular, size: .preMediumSize)
        self.descriptionLabel.textColor = IFDoorsColors.descriptionTextColor.color
        self.descriptionLabel.font = IFDoorsFonts.font(name: .regular, size: .smallSize)
        self.borderView.layer.borderColor = IFDoorsColors.borderColor.color.cgColor
        self.borderView.layer.borderWidth = IFDoorsMetrics.tableCellBorderWidth.rawValue
        self.borderView.layer.cornerRadius = IFDoorsMetrics.tableCellCorenerRadius.rawValue
        
        self.titleConteinerView.axis = .horizontal
        self.titleConteinerView.distribution = .fill
        self.titleConteinerView.alignment = .leading
        self.titleConteinerView.spacing = IFDoorsMetrics.tableCellContentIndent.rawValue
        
        self.titleLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        self.titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        self.descriptionLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        self.descriptionLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        self.stateImageView.setContentHuggingPriority(.required, for: .horizontal)
        self.stateImageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        self.stateImageView.setContentHuggingPriority(.required, for: .vertical)
        self.stateImageView.setContentCompressionResistancePriority(.required, for: .vertical)
        self.lockedStateImageView.setContentHuggingPriority(.required, for: .horizontal)
        self.lockedStateImageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        self.lockedStateImageView.setContentHuggingPriority(.required, for: .vertical)
        self.lockedStateImageView.setContentCompressionResistancePriority(.required, for: .vertical)
        self.doorStateImageView.setContentHuggingPriority(.required, for: .horizontal)
        self.doorStateImageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        self.titleConteinerView.setContentHuggingPriority(.required, for: .horizontal)
        self.titleConteinerView.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        self.titleTextConteinerView.axis = .vertical
        self.titleTextConteinerView.distribution = .fill
        self.titleTextConteinerView.alignment = .leading
        
        self.conteinerView.axis = .vertical
        self.conteinerView.distribution = .fill
        self.conteinerView.alignment = .fill
    }
}

public extension IFDoorTableViewCell {
    func renderProps(_ props: IFDoorTableViewCellProps?) {
        super.renderProps(props)
        if let props = props{
            self.actionView?.renderProps(props.actionViewProps)
            self.stateImageView?.renderProps(props.stateImageViewProps)
            self.lockedStateImageView?.renderProps(props.lockedStateImageViewProps)
            self.titleLabel?.renderProps(props.titleLabelProps)
            self.descriptionLabel?.renderProps(props.descriptionLabelProps)
            self.doorStateImageView?.renderProps(props.doorStateImageViewProps)
            self.lockedButton?.renderProps(props.lockedButtonProps)
        }
    }
}
