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

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(titleLabel)
        
        // 책 제목 속성
        titleLabel.font = .boldSystemFont(ofSize: 24)  // 시스템 볼드체, 24
        titleLabel.textAlignment = .center               // 텍스트 가운데 정렬
        titleLabel.numberOfLines = 0

        // AutoLayout
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(10)  // safeArea에서 10 떨어짐
            $0.leading.trailing.equalToSuperview().inset(20)             // superView에서 20씩 떨어짐
            $0.bottom.equalToSuperview()                                 // 내용에 따라 유동적
        }
    }

    func configure(title: String, order: Int) {
        titleLabel.text = title
    }
}
