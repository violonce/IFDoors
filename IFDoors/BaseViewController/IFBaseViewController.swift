//
//  IFBaseViewController.swift
//  IFDoors
//
//  Created by Илья on 21.02.2023.
//

import UIKit
import SnapKit

class IFBaseViewController : UIViewController, IFViewLifeCycle {
    
    lazy private var HUDView: UIView = {
        let view = UIView()
        self.activityIndicator.isHidden = false
        self.activityIndicator.color = UIColor.darkGray
        view.addSubview(self.activityIndicator)
        return view
    }()
    private var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadSubviews()
        self.installLayoutConstraints()
        self.subviewsDidLoad()
    }
    
    func loadSubviews() {
        self.view.addSubview(self.HUDView)
    }
    
    func installLayoutConstraints() {
        self.HUDView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(self.view)
        }
        self.activityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(self.HUDView)
        }
    }
    
    func subviewsDidLoad() {
        
    }
}

extension IFBaseViewController: HUDProtocol {
    public func showHUD() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.view.bringSubviewToFront(self.HUDView)
            self.activityIndicator.alpha = 1
            self.activityIndicator.startAnimating()
            UIView.animate(withDuration: 0.5) { [weak self] in
                guard let self = self else { return }
                self.HUDView.alpha = 1
            }
        }
    }
    
    public func hideHUD() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.activityIndicator.stopAnimating()
            UIView.animate(withDuration: 0.5) { [weak self] in
                guard let self = self else { return }
                self.HUDView.alpha = 0
            }
        }
    }
}
