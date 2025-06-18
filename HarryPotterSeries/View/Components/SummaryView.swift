//
//  SummaryView.swift
//  HarryPotterSeries
//
//  Created by 이서린 on 6/16/25.
//

import UIKit
import SnapKit

class SummaryView: UIView {
    
    private let maxCharacterCount = 450
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
        label.numberOfLines = 0 // 줄 수 제약 없음
        return label
    }()
    
    private let toggleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("더보기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.isHidden = true
        return button
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    private var isExpanded: Bool = false {
        didSet {
            updateText()
            saveState()
        }
    }
    
    private var fullText: String = ""
    
    private let summaryStateKey = "summary_isExpanded"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        loadState()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupLayout() {
        toggleButton.addTarget(self, action: #selector(toggleSummary), for: .touchUpInside)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(summaryLabel)
        stackView.addArrangedSubview(toggleButton)
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.lessThanOrEqualToSuperview()
        }
    }
    
    @objc private func toggleSummary() {
        isExpanded.toggle()
    }
    
    func configure(with summary: String) {
        fullText = summary
        let isLong = summary.count > maxCharacterCount
        toggleButton.isHidden = !isLong
        
        if isLong {
            loadState()
            updateText()
        } else {
            summaryLabel.text = summary
            isExpanded = false
        }
    }

    private func updateText() {
        if isExpanded {
            summaryLabel.text = fullText
            toggleButton.setTitle("접기", for: .normal)
        } else {
            let index = fullText.index(fullText.startIndex, offsetBy: min(maxCharacterCount, fullText.count))
            let truncated = fullText[..<index] + "..."
            summaryLabel.text = String(truncated)
            toggleButton.setTitle("더보기", for: .normal)
        }
    }
    
    private func saveState() {
        UserDefaults.standard.set(isExpanded, forKey: summaryStateKey)
    }
    
    private func loadState() {
        isExpanded = UserDefaults.standard.bool(forKey: summaryStateKey)
    }
}
