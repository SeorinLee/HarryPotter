//
//  BookInfoView.swift
//  HarryPotterSeries
//
//  Created by 이서린 on 6/16/25.
//
import UIKit
import SnapKit

class BookInfoView: UIView {
    
    private let authorLabel = UILabel()
    private let pagesLabel = UILabel()
    private let releaseDateLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) { fatalError() }
    
    private func setupUI() {
        [authorLabel, pagesLabel, releaseDateLabel].forEach {
            addSubview($0)
            $0.font = .systemFont(ofSize: 16)
            $0.textColor = .darkGray
        }
        
        authorLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        pagesLabel.snp.makeConstraints {
            $0.top.equalTo(authorLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview()
        }
        releaseDateLabel.snp.makeConstraints {
            $0.top.equalTo(pagesLabel.snp.bottom).offset(6)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func configure(with book: BookAttributes) {
        authorLabel.text = "Author: \(book.author)"
        pagesLabel.text = "Pages: \(book.pages)"
        releaseDateLabel.text = "Released: \(book.release_date)"
    }
}
