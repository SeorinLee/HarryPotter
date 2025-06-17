//
//  BookCoverView.swift
//  HarryPotterSeries
//
//  Created by 이서린 on 6/17/25.
//

import UIKit
import SnapKit

class BookCoverView: UIView {

    private let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) { fatalError() }

    private func setupUI() {
        addSubview(imageView)

        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true

        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(150)
            $0.width.equalTo(100)
        }
    }

    func configure(imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}

