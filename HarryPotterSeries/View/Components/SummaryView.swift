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
        button.isHidden = true // 기본은 숨김
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
            updateUI()
            saveState()
        }
    }
    private var fullText: String = ""
    
    // 상태 저장 키
    private let summaryStateKey = "summary_isExpanded"
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        loadState()
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
            $0.top.equalToSuperview().offset(24)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.lessThanOrEqualToSuperview()
        }
    }
    
    // MARK: - Actions
    
    @objc private func toggleSummary() {
        isExpanded.toggle()
    }
    
    // MARK: - Configure
    
    func configure(with summary: String) {
        fullText = summary
        
        let isLong = summary.count >= 450
        toggleButton.isHidden = !isLong
        summaryLabel.text = summary

        if isLong {
            // 저장된 상태 반영
            loadState()
            updateUI()
        } else {
            // 글자가 짧을 경우 무조건 펼침
            summaryLabel.numberOfLines = 0
        }
    }

    
    // MARK: - UI 업데이트
    
    private func updateUI() {
        summaryLabel.numberOfLines = isExpanded ? 0 : 5
        toggleButton.setTitle(isExpanded ? "접기" : "더보기", for: .normal)
    }
    
    // MARK: - 상태 저장 / 복원
    
    private func saveState() {
        UserDefaults.standard.set(isExpanded, forKey: summaryStateKey)
    }
    
    private func loadState() {
        isExpanded = UserDefaults.standard.bool(forKey: summaryStateKey)
    }
}
