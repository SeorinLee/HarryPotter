//
//  TitleView.swift
//  HarryPotterSeries
//
//  Created by 이서린 on 6/16/25.
//

// TitleView.swift

import UIKit
import SnapKit

class TitleView: UIView {
    
    private let titleLabel = UILabel()
    private let seriesOrderLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError() }

    private func setupUI() {
        [titleLabel, seriesOrderLabel].forEach { addSubview($0) }

        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
        seriesOrderLabel.font = .systemFont(ofSize: 16)
        seriesOrderLabel.textAlignment = .center
        seriesOrderLabel.textColor = .white
        seriesOrderLabel.backgroundColor = .systemBlue
        seriesOrderLabel.layer.cornerRadius = 20
        seriesOrderLabel.clipsToBounds = true
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
        }

        seriesOrderLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(40)
            $0.bottom.equalToSuperview()
        }
    }

    func configure(title: String, order: Int) {
        titleLabel.text = title
        seriesOrderLabel.text = "\(order)"
    }
}
