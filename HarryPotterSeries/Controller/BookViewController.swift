//
//  ViewController.swift
//  HarryPotterSeries
//
//  Created by 이서린 on 6/16/25.
//


import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    private func configureUI(){
        view.backgroundColor = .white
        label.text = "안녕하세요"
        label.textColor = .black
        
        view.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }

}

