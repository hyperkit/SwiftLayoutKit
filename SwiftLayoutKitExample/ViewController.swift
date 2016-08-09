//
//  ViewController.swift
//  SwiftLayoutKitExample
//
//  Created by Yanko Dimitrov on 3/26/15.
//  Copyright (c) 2015 Yanko Dimitrov. All rights reserved.
//

import UIKit
import SwiftLayoutKit

class ViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        
        let label = UILabel()
            label.text = "LayoutKit"
            label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var boxView: UIView = {
        
        let view = UIView()
            view.backgroundColor = UIColor.blue
            view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    ///////////////////////////////////////////////////////
    // MARK: - View
    ///////////////////////////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(titleLabel)
        view.addSubview(boxView)
        
        setupLayout()
    }
    
    ///////////////////////////////////////////////////////
    // MARK: - Layout
    ///////////////////////////////////////////////////////
    
    private func setupLayout() {
        
        let views : [String : UIView] = ["title": titleLabel]
        
        view +| constraintsWith(format: "|-[title]-|", forViews: views)
        
        view +| titleLabel.attribute(.top) == view.attribute(.top) + 30
        view +| boxView.attribute(.width) == 100
        view +| boxView.attribute(.height) == 100
        
        view +| constraintsWith(align: .centerX, toView: view, forViews: boxView)
        view +| constraintsWith(align: .centerY, toView: view, forViews: boxView)
    }
}
