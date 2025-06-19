//
//  SeriesButtonCell.swift
//  HarryPotterSeries
//
//  Created by 이서린 on 6/16/25.
//

// SeriesButtonCell.swift

import UIKit
import SnapKit

protocol SeriesButtonDelegate: AnyObject {
    func didTapSeriesButton(at index: Int)
}

class SeriesButtonCell: UICollectionViewCell {
    
    static let identifier = "SeriesButtonCell"
    weak var delegate: SeriesButtonDelegate?
    private var index: Int = 0

    private let button: UIButton = {
        let btn = UIButton(type: .system)
        btn.titleLabel?.font = .systemFont(ofSize: 16)
        btn.titleLabel?.textAlignment = .center
        btn.clipsToBounds = true
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(button)
        button.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        button.layer.cornerRadius = button.bounds.height / 2
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with index: Int, delegate: SeriesButtonDelegate, isSelected: Bool) {
        self.index = index
        self.delegate = delegate
        button.setTitle("\(index + 1)", for: .normal)

        // UI 상태 초기화
        button.layer.borderColor = UIColor.clear.cgColor
        button.layer.borderWidth = 0
        button.backgroundColor = .clear
        button.setTitleColor(.systemBlue, for: .normal)

        if isSelected {
            button.backgroundColor = .systemBlue
            button.setTitleColor(.white, for: .normal)
            button.layer.borderWidth = 0
        } else {
            button.backgroundColor = .systemGroupedBackground
            button.setTitleColor(.systemBlue, for: .normal)
            button.layer.borderWidth = 1
        }

        // 원형 강제 적용 (첫 화면 사각형 문제 해결)
        button.layoutIfNeeded()
        button.layer.cornerRadius = button.bounds.height / 2
    }

    @objc private func buttonTapped() {
        delegate?.didTapSeriesButton(at: index)
    }
}
