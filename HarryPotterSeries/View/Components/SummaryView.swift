//
//  SummaryView.swift
//  HarryPotterSeries
//
//  Created by 이서린 on 6/16/25.
//

import UIKit
import SnapKit

class SummaryView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Summary"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    private let summaryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 3
        return label
    }()
    
    private let toggleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("더보기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        return button
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8 // 타이틀과 내용 사이 간격
        return stack
    }()
    
    private var isExpanded = false
    private var fullText: String = ""
    
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
        toggleButton.addTarget(self, action: #selector(toggleSummary), for: .touchUpInside)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(summaryLabel)
        stackView.addArrangedSubview(toggleButton)
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24) // Dedication 영역과 24 간격
            $0.leading.trailing.equalToSuperview().inset(20) // 좌우 20
            $0.bottom.lessThanOrEqualToSuperview()
        }
    }
    
    // MARK: - Actions
    
    @objc private func toggleSummary() {
        isExpanded.toggle()
        summaryLabel.numberOfLines = isExpanded ? 0 : 3
        toggleButton.setTitle(isExpanded ? "접기" : "더보기", for: .normal)
    }
    
    // MARK: - Configure
    
    func configure(with summary: String) {
        fullText = summary
        summaryLabel.text = summary
    }
}
