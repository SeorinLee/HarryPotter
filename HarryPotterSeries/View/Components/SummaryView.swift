//
//  SummaryView.swift
//  HarryPotterSeries
//
//  Created by 이서린 on 6/16/25.
//

import UIKit
import SnapKit

class SummaryView: UIView {
    
    private let summaryLabel = UILabel()
    private let toggleButton = UIButton(type: .system)
    
    private var isExpanded = false
    private var fullText: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) { fatalError() }
    
    private func setupUI() {
        addSubview(summaryLabel)
        addSubview(toggleButton)
        
        summaryLabel.numberOfLines = 3
        summaryLabel.font = .systemFont(ofSize: 15)
        summaryLabel.textColor = .black
        
        toggleButton.setTitle("더보기", for: .normal)
        toggleButton.titleLabel?.font = .systemFont(ofSize: 14)
        toggleButton.addTarget(self, action: #selector(toggleSummary), for: .touchUpInside)
        
        summaryLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        toggleButton.snp.makeConstraints {
            $0.top.equalTo(summaryLabel.snp.bottom).offset(4)
            $0.leading.bottom.equalToSuperview()
        }
    }
    
    @objc private func toggleSummary() {
        isExpanded.toggle()
        summaryLabel.numberOfLines = isExpanded ? 0 : 3
        toggleButton.setTitle(isExpanded ? "접기" : "더보기", for: .normal)
    }
    
    func configure(with summary: String) {
        fullText = summary
        summaryLabel.text = summary
    }
}
