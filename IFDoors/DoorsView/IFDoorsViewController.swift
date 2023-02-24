//
//  IFDoorsViewController.swift
//  IFDoors
//
//  Created by Илья on 20.02.2023.
//

import UIKit
import SnapKit

class IFDoorsViewController : IFBaseViewController{
    
    private var conteinerView: UIStackView!
    
    private var titleConteinerView: UIStackView!
    private var titleLogoView: UIImageView!
    private var titleSettingsView: UIButton!
    
    private var homeConteinerView: UIStackView!
    private var welcomeLabel: UILabel!
    private var homeImageView: UIImageView!
    
    private var tableViewTitle: UILabel!
    private var tableView: IFAutoDimensionTableView!
    
    let cellReuseIdentifier = "DC"
    
    private var doorsModel: IFDoorsModel = IFDoorsModel(doors: [])
    private var viewProps: IFDoorsViewProps = IFDoorsViewProps()
    
    override func loadSubviews() {
        super.loadSubviews()
        self.conteinerView = UIStackView()
        self.titleConteinerView = UIStackView()
        self.titleLogoView = UIImageView()
        self.titleSettingsView = UIButton()
        self.homeConteinerView = UIStackView()
        self.welcomeLabel = UILabel()
        self.homeImageView = UIImageView()
        self.tableViewTitle = UILabel()
        self.tableView = IFAutoDimensionTableView(frame: CGRectZero, style: .plain)
        
        self.titleConteinerView.addArrangedSubview(self.titleLogoView)
        self.titleConteinerView.addArrangedSubview(self.titleSettingsView)
        
        self.homeConteinerView.addArrangedSubview(self.welcomeLabel)
        self.homeConteinerView.addArrangedSubview(self.homeImageView)
        
        self.conteinerView.addArrangedSubview(self.titleConteinerView)
        self.conteinerView.addArrangedSubview(self.homeConteinerView)
        self.conteinerView.addArrangedSubview(self.tableViewTitle)
        self.conteinerView.addArrangedSubview(self.tableView)
        
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

        
        self.titleConteinerView.axis = .horizontal
        self.titleConteinerView.distribution = .equalSpacing
        self.titleConteinerView.alignment = .center
        
        self.homeConteinerView.axis = .horizontal
        self.homeConteinerView.distribution = .equalSpacing
        self.homeConteinerView.alignment = .center
        self.homeConteinerView.spacing = IFDoorsMetrics.spaceBetweenViews.rawValue
        
        self.conteinerView.axis = .vertical
        self.conteinerView.distribution = .fill
        self.conteinerView.alignment = .top
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
        
        for i in 0 ..< doorsModel.doors.count {
            let doorModel: IFDoorModel = doorsModel.doors[i]
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
            if let url = Bundle.main.url(forResource: "doors_list", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    self!.doorsModel = try JSONDecoder().decode(IFDoorsModel.self, from: data)
                    self!.hideHUD()
                    self!.renderProps(props: self!.buildProps())
                } catch {
                    print("error:\(error)")
                }
            }
        }
    }
    
    private func changeModelState(_ model: IFDoorModel, props: IFDoorTableViewCellProps, index:Int) -> Command {
        var resultModel = model
        return Command { [weak self] in
            resultModel.loading = true
            props.userInteractionEnabled = false
            self!.doorsModel.doors[index] = resultModel
            self!.renderProps(props: self!.buildProps())
            DispatchQueue.main.asyncAfter(deadline: .now() + IFDoorsMetrics.loadingTime.rawValue) { [weak self] in
                resultModel.loading = false
                props.userInteractionEnabled = true
                resultModel.locked = !model.locked!
                self!.doorsModel.doors[index] = resultModel
                self!.renderProps(props: self!.buildProps())
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
