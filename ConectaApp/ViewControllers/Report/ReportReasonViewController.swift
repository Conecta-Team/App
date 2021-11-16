//
//  ReportReasonViewController.swift
//  ConectaApp
//
//  Created by Cecilia Soares on 10/11/21.
//

import UIKit

class ReportReasonViewController: UIViewController {

    let reportReason = ReportReasonView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = reportReason

        self.navigationItem.setHidesBackButton(true, animated: false)
        self.isModalInPresentation = true
        self.modalTransitionStyle = .crossDissolve
        reportReason.continueButton.addTarget(self, action: #selector(goDetails), for: .touchUpInside)
        reportReason.cancelButton.addTarget(self, action: #selector(cancelButton), for: .touchUpInside)
    }

    @objc func goDetails() {
//        let report = ReportDetailsViewController()
//        report.modalTransitionStyle = .crossDissolve
//        self.present(report, animated: true, completion: nil)
        let view = UIView()
        view.backgroundColor = .red
        self.view = view
    }
    
    @objc func cancelButton() {
//        self.dismiss(animated: true, completion: nil)
        let view = UIView()
        view.backgroundColor = .red
        self.view = view
    }
}
