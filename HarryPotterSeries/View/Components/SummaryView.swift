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
        label.numberOfLines = 0
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
    
    private var isExpanded = false
    private var fullText: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        updateText()
    }
    
    func configure(with summary: String, index: Int) {
        fullText = summary
        let isLongText = summary.count > maxCharacterCount
        toggleButton.isHidden = !isLongText
        isExpanded = false
        updateText()
    }
    
    private func updateText() {
        if isExpanded || fullText.count <= maxCharacterCount {
            summaryLabel.text = fullText
            toggleButton.setTitle("접기", for: .normal)
        } else {
            let index = fullText.index(fullText.startIndex, offsetBy: maxCharacterCount)
            let truncated = String(fullText[..<index]).trimmingCharacters(in: .whitespacesAndNewlines)
            summaryLabel.text = truncated + "..."
            toggleButton.setTitle("더보기", for: .normal)
        }
    }
}
