//
//  BookViewController.swift
//  HarryPotterSeries
//
//  Created by 이서린 on 6/16/25.
//

// BookViewController.swift

import UIKit
import SnapKit

class BookViewController: UIViewController {

    private var books: [BookAttributes] = []
    private var selectedIndex: Int = 0

    private let titleView = TitleView()

    private let seriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        layout.itemSize = CGSize(width: 40, height: 40)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()

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

        seriesCollectionView.dataSource = self
        seriesCollectionView.delegate = self
        seriesCollectionView.register(SeriesButtonCell.self, forCellWithReuseIdentifier: SeriesButtonCell.identifier)

        setupUI()
        configureUI(for: 0)
    }

    private func setupUI() {
        view.addSubview(titleView)
        view.addSubview(seriesCollectionView)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        titleView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
        }

        seriesCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }

        scrollView.snp.makeConstraints {
            $0.top.equalTo(seriesCollectionView.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }

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
            $0.bottom.equalToSuperview().inset(16)
        }
    }

    private func configureUI(for index: Int) {
        guard books.indices.contains(index) else { return }

        let previousIndex = selectedIndex      
        selectedIndex = index

        let book = books[index]

        // 콘텐츠 뷰 업데이트
        titleView.configure(title: book.title, order: index + 1)
        bookInfoView.configure(with: book)
        dedicationView.configure(with: book.dedication)
        summaryView.configure(with: book.summary, index: index)
        chapterListView.configure(with: book.chapters)

        //  이전 선택 셀과 현재 선택 셀만 리로드
        let prevIndexPath = IndexPath(item: previousIndex, section: 0)
        let currentIndexPath = IndexPath(item: selectedIndex, section: 0)
        seriesCollectionView.reloadItems(at: [prevIndexPath, currentIndexPath])

        //  선택된 셀이 보이도록 스크롤
        seriesCollectionView.scrollToItem(at: currentIndexPath, at: .centeredHorizontally, animated: true)
    }

}

extension BookViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SeriesButtonCell.identifier,
            for: indexPath) as? SeriesButtonCell else {
                return UICollectionViewCell()
        }

        let isSelected = (indexPath.item == selectedIndex)
        cell.configure(with: indexPath.item, delegate: self, isSelected: isSelected)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        configureUI(for: indexPath.item)
    }
}

extension BookViewController: SeriesButtonDelegate {
    func didTapSeriesButton(at index: Int) {
        configureUI(for: index)
    }
}
