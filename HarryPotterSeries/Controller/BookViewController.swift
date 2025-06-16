//
//  BookViewController.swift
//  HarryPotterSeries
//
//  Created by 이서린 on 6/16/25.
//

import Foundation
import UIKit
import SnapKit

class BookViewController: UIViewController {
    
    private var books: [BookAttributes] = []
    
    private let titleView = TitleView()
    private let bookInfoView = BookInfoView()
    private let dedicationView = DedicationView()
    private let summaryView = SummaryView()
    private let chapterListView = ChapterListView()
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        books = DataService.shared.fetchBooks()
        
        setupUI()
        configureUI()
    }
    
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [titleView, bookInfoView, dedicationView, summaryView, chapterListView].forEach {
            contentView.addSubview($0)
        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        titleView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(16)
        }
        
        bookInfoView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        dedicationView.snp.makeConstraints {
            $0.top.equalTo(bookInfoView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        summaryView.snp.makeConstraints {
            $0.top.equalTo(dedicationView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        chapterListView.snp.makeConstraints {
            $0.top.equalTo(summaryView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(16) // 스크롤뷰 컨텐츠 하단 패딩
        }
    }
    
    private func configureUI() {
        guard let firstBook = books.first else { return }
        
        titleView.configure(title: firstBook.title, order: 1)
        bookInfoView.configure(with: firstBook)
        dedicationView.configure(with: firstBook.dedication)
        summaryView.configure(with: firstBook.summary)
        chapterListView.configure(with: firstBook.chapters)
    }
}
