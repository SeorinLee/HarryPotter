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

    // 고정 영역
    private let titleView = TitleView()
    
    // 스크롤 가능한 콘텐츠 영역
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
        // 상단 고정 titleView
        view.addSubview(titleView)
        titleView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(16)
        }

        // ScrollView와 ContentView
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.showsVerticalScrollIndicator = false // ✅ 스크롤바 숨김

        scrollView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview() // 가로 스크롤 방지
        }

        // ContentView 안에 구성 뷰 추가
        [bookInfoView, dedicationView, summaryView, chapterListView].forEach {
            contentView.addSubview($0)
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
            $0.bottom.equalToSuperview().inset(16) // scrollView content 높이 끝 지정
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
