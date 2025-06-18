//
//  BookInfoView.swift
//  HarryPotterSeries
//
//  Created by 이서린 on 6/16/25.
//

import UIKit
import SnapKit

class BookInfoView: UIView {
    
    // MARK: - Views
    
    private let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill // 또는 .scaleAspectFit 가능
        imageView.clipsToBounds = true
        imageView.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(150) // 1:1.5 비율
        }
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Author

    private let authorTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Author"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()
    
    // MARK: - Release

    private let releaseTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Released"
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    private let releaseLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    // MARK: - Pages

    private let pagesTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Pages"
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    private let pagesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        return label
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
        let authorStack = UIStackView(arrangedSubviews: [authorTitleLabel, authorLabel])
        authorStack.axis = .horizontal
        authorStack.spacing = 8
        
        let releaseStack = UIStackView(arrangedSubviews: [releaseTitleLabel, releaseLabel])
        releaseStack.axis = .horizontal
        releaseStack.spacing = 8

        let pagesStack = UIStackView(arrangedSubviews: [pagesTitleLabel, pagesLabel])
        pagesStack.axis = .horizontal
        pagesStack.spacing = 8

        let textStack = UIStackView(arrangedSubviews: [titleLabel, authorStack, releaseStack, pagesStack])
        textStack.axis = .vertical
        textStack.spacing = 12
        textStack.alignment = .leading
        
        let mainStack = UIStackView(arrangedSubviews: [coverImageView, textStack])
        mainStack.axis = .horizontal
        mainStack.spacing = 18
        mainStack.alignment = .top
        mainStack.distribution = .fill
        
        addSubview(mainStack)
        mainStack.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Configure
    
    func configure(with book: BookAttributes) {
        coverImageView.image = UIImage(named: book.coverImage)
        titleLabel.text = book.title
        authorLabel.text = book.author
        pagesLabel.text = "\(book.pages)"
        releaseLabel.text = convertDateFormat(book.release_date)
    }
    
    private func convertDateFormat(_ dateString: String) -> String {
        // "1997-06-26" -> "June 26, 1997"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: dateString) else {
            return dateString
        }
        formatter.dateFormat = "MMMM dd, yyyy"
        return formatter.string(from: date)
    }
}
