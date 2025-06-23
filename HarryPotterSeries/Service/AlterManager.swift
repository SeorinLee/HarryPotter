//
//  AlterManager.swift
//  HarryPotterSeries
//
//  Created by 이서린 on 6/23/25.
//

import UIKit

class AlertManager {
    static func showErrorAlert(on viewController: UIViewController, message: String) {
        let alert = UIAlertController(title: "⚠️ 에러 발생", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        viewController.present(alert, animated: true)
    }
}
