//
//  IFDoorsViewController.swift
//  IFDoors
//
//  Created by Илья on 20.02.2023.
//

import UIKit
import SnapKit

class IFDoorsViewController : IFBaseViewController{
    
    lazy private var conteinerView: UIStackView = {
        let conteinerView = UIStackView()
        conteinerView.addArrangedSubview(self.titleConteinerView)
        conteinerView.addArrangedSubview(self.homeConteinerView)
        conteinerView.addArrangedSubview(self.tableViewTitle)
        conteinerView.addArrangedSubview(self.tableView)
        
        conteinerView.axis = .vertical
        conteinerView.distribution = .fill
        conteinerView.alignment = .top
        
        return conteinerView
    }()
    
    lazy private var titleConteinerView: UIStackView = {
        let titleConteinerView = UIStackView()
        titleConteinerView.addArrangedSubview(self.titleLogoView)
        titleConteinerView.addArrangedSubview(self.titleSettingsView)
        
        titleConteinerView.axis = .horizontal
        titleConteinerView.distribution = .equalSpacing
        titleConteinerView.alignment = .center
        
        return titleConteinerView
    }()
    private var titleLogoView: UIImageView = UIImageView()
    private var titleSettingsView: UIButton = UIButton()
    
    lazy private var homeConteinerView: UIStackView = {
        let homeConteinerView = UIStackView()
        homeConteinerView.addArrangedSubview(self.welcomeLabel)
        homeConteinerView.addArrangedSubview(self.homeImageView)
        
        homeConteinerView.axis = .horizontal
        homeConteinerView.distribution = .equalSpacing
        homeConteinerView.alignment = .center
        homeConteinerView.spacing = IFDoorsMetrics.spaceBetweenViews.rawValue
        
        return homeConteinerView
    }()
    private var welcomeLabel: UILabel = UILabel()
    private var homeImageView: UIImageView = UIImageView()
    
    private var tableViewTitle: UILabel = UILabel()
    private var tableView: IFAutoDimensionTableView = IFAutoDimensionTableView(frame: CGRectZero, style: .plain)
    
    let cellReuseIdentifier = "DC"
    
    private var doorsModel: IFDoorsModel = IFDoorsModel(doors: [])
    private var viewProps: IFDoorsViewProps = IFDoorsViewProps()
    
    override func loadSubviews() {
        super.loadSubviews()
        self.view.addSubview(self.conteinerView)
    }
    
    override func installLayoutConstraints() {
        super.installLayoutConstraints()
        self.conteinerView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(IFDoorsMetrics.topIndent.rawValue)
            make.trailing.leading.equalTo(self.view.safeAreaLayoutGuide)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        self.titleConteinerView.snp.makeConstraints { make in
            make.leading.equalTo(self.conteinerView).offset(IFDoorsMetrics.mediumIndent.rawValue)
            make.trailing.equalTo(self.conteinerView).offset(-IFDoorsMetrics.mediumIndent.rawValue)
        }
        self.titleSettingsView.snp.makeConstraints { make in
            make.height.equalTo(IFDoorsMetrics.buttonHieght.rawValue)
        }
        self.homeConteinerView.snp.makeConstraints { make in
            make.leading.equalTo(self.conteinerView).offset(IFDoorsMetrics.mediumIndent.rawValue)
            make.trailing.equalTo(self.conteinerView)
        }
        self.welcomeLabel.snp.makeConstraints { make in
            make.height.equalTo(IFDoorsMetrics.bigLabelHeight.rawValue)
        }
        self.tableViewTitle.snp.makeConstraints { make in
            make.height.equalTo(IFDoorsMetrics.bigLabelHeight.rawValue)
        }
        self.tableView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.conteinerView)
        }
    }
    
    override func subviewsDidLoad() {
        super.subviewsDidLoad()
        
        self.titleLogoView.contentMode = .scaleToFill
        
        self.titleLogoView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        self.titleLogoView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        self.titleSettingsView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        self.titleSettingsView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        self.welcomeLabel.textColor = IFDoorsColors.textColor.color
        self.welcomeLabel.font = IFDoorsFonts.font(name: .regular, size: .bigSize)
        self.welcomeLabel.lineBreakMode = .byWordWrapping
        
        self.welcomeLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        self.welcomeLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        self.homeImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        self.homeImageView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        self.tableViewTitle.textColor = IFDoorsColors.textColor.color
        self.tableViewTitle.font = IFDoorsFonts.font(name: .regular, size: .mediumSize)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = IFDoorsColors.mainBackgroundColor.color
        self.configurateTableView()
        self.renderProps(props: self.buildProps())
        self.loadData()
    }
    
    private func configurateTableView() {
        self.tableView.backgroundColor = IFDoorsColors.mainBackgroundColor.color
        self.tableView.register(IFDoorTableViewCell.self, forCellReuseIdentifier: self.cellReuseIdentifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
    }
    
    // MARK: - Build props methods
    
    func renderProps(props: IFDoorsViewProps) {
        self.viewProps = props
        self.titleLogoView.renderProps(props.titleLogoImageProps)
        self.titleSettingsView.renderProps(props.settignsImageProps)
        self.welcomeLabel.renderProps(props.welcomeLabelProps)
        self.homeImageView.renderProps(props.homeImageProps)
        self.tableViewTitle.renderProps(props.tableLabelProps)
        self.tableView.reloadData()
    }
    
    func buildProps() -> IFDoorsViewProps {
        var props = IFDoorsViewProps()
        props.titleLogoImageProps = IFImageViewProps()
        props.titleLogoImageProps.image = IFDoorsImages.logo.image
        props.settignsImageProps = IFButtonProps()
        props.settignsImageProps.titleImage = IFDoorsImages.settings.image
        props.settignsImageProps.touchUpInsideCommand = Command(action: { /*[weak self] in*/
            //Здась должен быть переход на экран настроек
        })
        props.welcomeLabelProps = IFLabelProps()
        props.welcomeLabelProps.text = IFDoorsStrings.welcome.rawValue
        props.homeImageProps = IFImageViewProps()
        props.homeImageProps.image = IFDoorsImages.homeLogo.image
        props.tableLabelProps = IFLabelProps()
        props.tableLabelProps.text = IFDoorsStrings.tableViewTitle.rawValue
        
        doorsModel.doors.enumerated().forEach { (i, doorModel) in
            let cellProps: IFDoorTableViewCellProps = IFDoorTableViewCellProps()
            cellProps.loading = doorModel.loading
            cellProps.actionViewProps = IFControlProps()
            cellProps.actionViewProps.touchUpInsideCommand = self.changeModelState(doorModel, props: cellProps, index: i)
            cellProps.stateImageViewProps = IFImageViewProps()
            cellProps.stateImageViewProps.image = self.getStateImage(doorModel.locked!, loading: cellProps.loading)
            cellProps.lockedStateImageViewProps = IFImageViewProps()
            cellProps.lockedStateImageViewProps.image = self.getLockedStateImage(doorModel.locked!, loading: cellProps.loading)
            cellProps.titleLabelProps = IFLabelProps()
            cellProps.titleLabelProps.text = doorModel.title
            cellProps.descriptionLabelProps = IFLabelProps()
            cellProps.descriptionLabelProps.text = doorModel.description
            cellProps.doorStateImageViewProps = IFImageViewProps()
            cellProps.doorStateImageViewProps.image = self.getDoorLockedStateImage(doorModel.locked!, loading: cellProps.loading)
            cellProps.lockedButtonProps = IFButtonProps()
            cellProps.lockedButtonProps.title = self.getButtonTitle(doorModel.locked!, loading: cellProps.loading)
            cellProps.lockedButtonProps.titleColor = self.getButtonTitleColor(doorModel.locked!, loading: cellProps.loading)
            cellProps.lockedButtonProps.touchUpInsideCommand = self.changeModelState(doorModel, props: cellProps, index: i)
            
            props.tableViewCellsProps.append(cellProps)
        }
        
        return props
    }
    
    // MARK: - load methods
    
    func loadData() {
        //имитируем загрузку с сети
        self.showHUD()
        DispatchQueue.main.asyncAfter(deadline: .now() + IFDoorsMetrics.loadingTime.rawValue) { [weak self] in
            guard let self = self else { return }
            if let url = Bundle.main.url(forResource: "doors_list", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    self.doorsModel = try JSONDecoder().decode(IFDoorsModel.self, from: data)
                    self.hideHUD()
                    self.renderProps(props: self.buildProps())
                } catch {
                    print("error:\(error)")
                }
            }
        }
    }
    
    private func changeModelState(_ model: IFDoorModel, props: IFDoorTableViewCellProps, index:Int) -> Command {
        var resultModel = model
        return Command { [weak self] in
            guard let self = self else { return }
            resultModel.loading = true
            props.userInteractionEnabled = false
            self.doorsModel.doors[index] = resultModel
            self.renderProps(props: self.buildProps())
            DispatchQueue.main.asyncAfter(deadline: .now() + IFDoorsMetrics.loadingTime.rawValue) { [weak self] in
                guard let self = self else { return }
                resultModel.loading = false
                props.userInteractionEnabled = true
                resultModel.locked = !model.locked!
                self.doorsModel.doors[index] = resultModel
                self.renderProps(props: self.buildProps())
            }
        }
    }
    
    private func getStateImage(_ locked: Bool, loading: Bool) -> UIImage {
        if loading {
            return IFDoorsImages.loadingEllipse.image
        }
        if locked {
            return IFDoorsImages.lockedEllipse.image
        }
        return IFDoorsImages.unlockedEllipse.image
    }
    
    private func getLockedStateImage(_ locked: Bool, loading: Bool) -> UIImage {
        if loading {
            return IFDoorsImages.loading.image
        }
        if locked {
            return IFDoorsImages.locked.image
        }
        return IFDoorsImages.unlocked.image
    }
    
    private func getDoorLockedStateImage(_ locked: Bool, loading: Bool) -> UIImage {
        if loading {
            return IFDoorsImages.empty.image
        }
        if locked {
            return IFDoorsImages.lockedDoor.image
        }
        return IFDoorsImages.unlockedDoor.image
    }
    
    private func getButtonTitle(_ locked: Bool, loading: Bool) -> String {
        if loading {
            guard locked else {return IFDoorsStrings.locking.rawValue}
            return IFDoorsStrings.unlocking.rawValue
        }
        if locked {
            return IFDoorsStrings.locked.rawValue
        }
        return IFDoorsStrings.unlocked.rawValue
    }
    
    private func getButtonTitleColor(_ locked: Bool, loading: Bool) -> UIColor {
        if loading {
            return IFDoorsColors.buttonTitleColorLoading.color
        }
        if locked {
            return IFDoorsColors.buttonTitleColorLocked.color
        }
        return IFDoorsColors.buttonTitleColorUnlocked.color
    }
    
    
}

extension IFDoorsViewController : UITableViewDelegate, UITableViewDataSource {
    // MARK: - TableView delegate methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.viewProps.tableViewCellsProps.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:IFDoorTableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? IFDoorTableViewCell)!
        let cellProps = self.viewProps.tableViewCellsProps[indexPath.row] as IFDoorTableViewCellProps
        cell.renderProps(cellProps)
        return cell
    }
}
