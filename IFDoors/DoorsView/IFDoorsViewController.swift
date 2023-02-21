//
//  IFDoorsViewController.swift
//  IFDoors
//
//  Created by Илья on 20.02.2023.
//

import UIKit
import SnapKit

class IFDoorsViewController : IFBaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var conteinerView: UIStackView!
    
    private var titleConteinerView: UIStackView!
    private var titleLogoView: UIImageView!
    private var titleSettingsView: UIButton!
    
    private var homeConteinerView: UIStackView!
    private var welcomeLabel: UILabel!
    private var homeImageView: UIImageView!
    
    private var tableViewTitle: UILabel!
    private var tableView: UITableView!
    
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
        self.tableView = UITableView(frame: CGRectZero, style: .plain)
        
        self.titleConteinerView.addArrangedSubview(self.titleLogoView)
        self.titleConteinerView.addArrangedSubview(self.titleSettingsView)
        
        self.homeConteinerView.addArrangedSubview(self.welcomeLabel)
        self.homeConteinerView.addArrangedSubview(self.homeImageView)
        
        self.conteinerView.addArrangedSubview(self.titleConteinerView)
        self.conteinerView.addArrangedSubview(self.homeConteinerView)
        self.conteinerView.addArrangedSubview(self.tableViewTitle)
        self.conteinerView.addArrangedSubview(self.tableView)
        
        self.view.addSubview(self.conteinerView)
//        self.view.addSubview(self.tableView)
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
        
        self.welcomeLabel.textColor = UIColor.colorWithHex(hexString: IFDoorsColors.blackColor.rawValue)
        self.welcomeLabel.font = IFDoorFonts.regularFontOfSize(size: 35.0)
        self.welcomeLabel.lineBreakMode = .byWordWrapping
        
        self.welcomeLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        self.welcomeLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        self.homeImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        self.homeImageView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        self.tableViewTitle.textColor = UIColor.colorWithHex(hexString: IFDoorsColors.textColor.rawValue)
        self.tableViewTitle.font = IFDoorFonts.regularFontOfSize(size: 20.0)

        
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
        self.view.backgroundColor = UIColor.colorWithHex(hexString: IFDoorsColors.mainBackgroundColor.rawValue)
        self.configurateTableView()
        self.renderProps(props: self.buildProps())
        self.loadData()
    }
    
    private func configurateTableView() {
        self.tableView.backgroundColor = UIColor.colorWithHex(hexString: IFDoorsColors.mainBackgroundColor.rawValue)
        self.tableView.register(IFDoorTableViewCell.self, forCellReuseIdentifier: self.cellReuseIdentifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        self.tableView.estimatedSectionHeaderHeight = UITableView.automaticDimension
        self.tableView.estimatedSectionFooterHeight = UITableView.automaticDimension
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.sectionHeaderHeight = UITableView.automaticDimension
        self.tableView.sectionFooterHeight = UITableView.automaticDimension
    }
    
    // MARK: - load methods
    
    func loadData() {
        //имитируем загрузку с сети
        self.showHUD()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
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
    
    // MARK: - TableView delegate methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.viewProps.tableViewCellsProps.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:IFDoorTableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! IFDoorTableViewCell?)!
        let cellProps = self.viewProps.tableViewCellsProps[indexPath.row] as IFDoorTableViewCellProps
        cellProps.configurateCell(cell: cell)
        return cell
    }
    
    // MARK: - private methods
    
    private func renderProps(props: IFDoorsViewProps) {
        self.viewProps = props
        self.titleLogoView.renderProps(props.titleLogoImageProps)
        self.titleSettingsView.renderProps(props.settignsImageProps)
        self.welcomeLabel.renderProps(props.welcomeLabelProps)
        self.homeImageView.renderProps(props.homeImageProps)
        self.tableViewTitle.renderProps(props.tableLabelProps)
        self.tableView.reloadData()
    }
    
    private func buildProps() -> IFDoorsViewProps {
        var props = IFDoorsViewProps()
        props.titleLogoImageProps = IFImageViewProps()
        props.titleLogoImageProps.image = UIImage.init(named: "logo")
        props.settignsImageProps = IFButtonProps()
        props.settignsImageProps.titleImage = UIImage.init(named: "settings")
        props.settignsImageProps.touchUpInsideCommand = Command(action: { /*[weak self] in*/
            //Здась должен быть переход на экран настроек
        })
        props.welcomeLabelProps = IFLabelProps()
        props.welcomeLabelProps.text = "Welcome\n"
        props.homeImageProps = IFImageViewProps()
        props.homeImageProps.image = UIImage.init(named: "homeLogo")
        props.tableLabelProps = IFLabelProps()
        props.tableLabelProps.text = "My doors"
        props.tableLabelProps.numberOfLines = 0
        
        for i in 0 ..< doorsModel.doors.count {
            let doorModel: IFDoorModel = doorsModel.doors[i]
            let cellProps: IFDoorTableViewCellProps = IFDoorTableViewCellProps()
            cellProps.actionViewProps = IFControlProps()
            cellProps.actionViewProps.touchUpInsideCommand = self.changeModelState(doorModel, props: cellProps, index: i)
            cellProps.stateImageViewProps = IFImageViewProps()
            cellProps.stateImageViewProps.image = self.getStateImage(doorModel.locked!, loading: cellProps.loadingState)
            cellProps.lockedStateImageViewProps = IFImageViewProps()
            cellProps.lockedStateImageViewProps.image = self.getLockedStateImage(doorModel.locked!, loading: cellProps.loadingState)
            cellProps.titleLabelProps = IFLabelProps()
            cellProps.titleLabelProps.text = doorModel.title
            cellProps.descriptionLabelProps = IFLabelProps()
            cellProps.descriptionLabelProps.text = doorModel.description
            cellProps.doorStateImageViewProps = IFImageViewProps()
            cellProps.doorStateImageViewProps.image = self.getDoorLockedStateImage(doorModel.locked!, loading: cellProps.loadingState)
            cellProps.lockedButtonProps = IFButtonProps()
            cellProps.lockedButtonProps.title = self.getButtonTitle(doorModel.locked!, loading: cellProps.loadingState)
            cellProps.lockedButtonProps.titleColor = self.getButtonTitleColor(doorModel.locked!, loading: cellProps.loadingState)
            
            props.tableViewCellsProps.append(cellProps)
        }
        
        return props
    }
    
    private func changeModelState(_ model: IFDoorModel, props: IFDoorTableViewCellProps, index:Int) -> Command {
        var resultModel = model
        return Command { [weak self] in
            self!.showHUD()
            props.loadingState = true
            props.actionViewProps.userInteractionEnabled = false
            self!.renderProps(props: self!.buildProps())
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
                self!.hideHUD()
                props.loadingState = false
                props.actionViewProps.userInteractionEnabled = true
                resultModel.locked = !model.locked!
                self!.doorsModel.doors[index] = resultModel
                self!.renderProps(props: self!.buildProps())
            }
        }
    }
    
    private func getStateImage(_ locked: Bool, loading: Bool) -> UIImage {
        if loading {
            return UIImage(named: "loadingEllipse")!
        }
        if locked {
            return UIImage(named: "lockedEllipse")!
        }
        return UIImage(named: "unlockedEllipse")!
    }
    
    private func getLockedStateImage(_ locked: Bool, loading: Bool) -> UIImage {
        if loading {
            return UIImage(named: "loading")!
        }
        if locked {
            return UIImage(named: "locked")!
        }
        return UIImage(named: "unlocked")!
    }
    
    private func getDoorLockedStateImage(_ locked: Bool, loading: Bool) -> UIImage {
        if loading {
            return UIImage()
        }
        if locked {
            return UIImage(named: "lockedDoor")!
        }
        return UIImage(named: "unlockedDoor")!
    }
    
    private func getButtonTitle(_ locked: Bool, loading: Bool) -> String {
        if loading {
            guard locked else {return "Unlocking"}
            return "Locking"
        }
        if locked {
            return "Locked"
        }
        return "Unlocked"
    }
    
    private func getButtonTitleColor(_ locked: Bool, loading: Bool) -> UIColor {
        if loading {
            return UIColor.colorWithHex(hexString: "")
        }
        if locked {
            return UIColor.colorWithHex(hexString: "")
        }
        return UIColor.colorWithHex(hexString: "")
    }
    
    
}
