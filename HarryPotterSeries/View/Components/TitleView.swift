//
//  TitleView.swift
//  HarryPotterSeries
//
//  Created by 이서린 on 6/16/25.
//

import UIKit
import SnapKit

class TitleView: UIView {
    
    private let titleLabel = UILabel()
    private let seriesOrderLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(seriesOrderLabel)
        
        // 제목 스타일 설정
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
        // 시리즈 순서 스타일 설정
        seriesOrderLabel.font = .systemFont(ofSize: 16)
        seriesOrderLabel.textAlignment = .center
        seriesOrderLabel.textColor = .white
        seriesOrderLabel.backgroundColor = .systemBlue
        seriesOrderLabel.clipsToBounds = true
        
        // AutoLayout 설정
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        seriesOrderLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(40) // 원형 라벨
            $0.bottom.equalToSuperview() // 마지막 뷰와 하단 연결
        }
        
        // 원형 cornerRadius 적용 (width/2)
        seriesOrderLabel.layer.cornerRadius = 20
    }
    
    func configure(title: String, order: Int) {
        titleLabel.text = title
        seriesOrderLabel.text = "\(order)"
    }
}
