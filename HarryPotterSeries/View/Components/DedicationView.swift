//
//  DedicationView.swift
//  HarryPotterSeries
//
//  Created by 이서린 on 6/16/25.
//

import UIKit
import SnapKit

class DedicationView: UIView {
    
    // MARK: - UI Elements
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Dedication"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8 // 타이틀과 내용 사이 간격
        return stack
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Layout
    
    private func setupLayout() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(contentLabel)
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24) // 책 정보 영역과 24 간격
            $0.leading.trailing.equalToSuperview().inset(20) // 좌우 20
            $0.bottom.lessThanOrEqualToSuperview()
        }
    }
    
    // MARK: - Configure
    
    func configure(with dedication: String) {
        contentLabel.text = dedication
    }
}
