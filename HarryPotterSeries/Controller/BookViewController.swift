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
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let bookInfoView = BookInfoView()
    private let dedicationView = DedicationView()
    private let summaryView = SummaryView()
    private let chapterListView = ChapterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        books = DataService.shared.fetchBooks()
        
        setupUI()
        configureUI()
    }
    
    private func setupUI() {
        // TitleView는 view에 직접 추가 (고정 위치)
        view.addSubview(titleView)
        
        // ScrollView 안에 나머지 뷰들 추가
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [bookInfoView, dedicationView, summaryView, chapterListView].forEach {
            contentView.addSubview($0)
        }

        // 스크롤바 제거
        scrollView.showsVerticalScrollIndicator = false
        
        // TitleView 고정
        titleView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(60)
        }
        
        // ScrollView는 TitleView 아래부터 시작
        scrollView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }

        bookInfoView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
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
            $0.bottom.equalToSuperview().inset(32) // 하단 여백
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
