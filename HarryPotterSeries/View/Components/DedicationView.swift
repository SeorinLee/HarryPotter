//
//  DedicationView.swift
//  HarryPotterSeries
//
//  Created by 이서린 on 6/16/25.
//

import UIKit
import SnapKit

class DedicationView: UIView {
    
    private let dedicationLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) { fatalError() }
    
    private func setupUI() {
        addSubview(dedicationLabel)
        dedicationLabel.numberOfLines = 0
        dedicationLabel.font = .italicSystemFont(ofSize: 14)
        dedicationLabel.textColor = .gray
        
        dedicationLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(12)
        }
    }
    
    func configure(with dedication: String) {
        dedicationLabel.text = dedication
    }
}
