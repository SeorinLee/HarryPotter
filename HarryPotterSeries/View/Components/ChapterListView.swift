//
//  ChapterListView.swift
//  HarryPotterSeries
//
//  Created by 이서린 on 6/16/25.
//

import UIKit
import SnapKit

class ChapterListView: UIView {
    
    private let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupUI() {
        addSubview(stackView)

        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading

        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24) 
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.lessThanOrEqualToSuperview()
        }
    }
    
    
    func configure(with chapters: [Chapter]) {
        // 기존 라벨 제거
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        // 챕터 타이틀 추가
        let titleLabel = UILabel()
        titleLabel.text = "Chapters"
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.textColor = .black
        stackView.addArrangedSubview(titleLabel)

        // 챕터 리스트 추가
        for chapter in chapters {
            let label = UILabel()
            label.text = chapter.title
            label.font = .systemFont(ofSize: 14)
            label.textColor = .darkGray
            label.numberOfLines = 1
            stackView.addArrangedSubview(label)
        }
    }
}
