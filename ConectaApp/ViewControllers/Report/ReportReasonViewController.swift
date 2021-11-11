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
        self.navigationItem.setHidesBackButton(true, animated: false)
        view = reportReason
        reportReason.continueButton.addTarget(self, action: #selector(goDetails), for: .touchUpInside)

    }
    @objc func goDetails(){
        let report = ReportDetailsViewController()
        navigationController?.pushViewController(report, animated: true)
    }

}
