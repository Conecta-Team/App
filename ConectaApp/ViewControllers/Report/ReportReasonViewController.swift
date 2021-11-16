//
//  ReportReasonViewController.swift
//  ConectaApp
//
//  Created by Cecilia Soares on 10/11/21.
//

import UIKit

class ReportReasonViewController: UIViewController {

    let reportReasonView = ReportReasonView()
    let reportDetailView = ReportDetailsView()
    let reportFeedbackView = ReportAlertView()
    let viewModel = ReportViewModel()
    
    let myUser: UserDTO
    let userToReport: UserDTO

    init(myUser: UserDTO, userToReport: UserDTO) {
        self.myUser = myUser
        self.userToReport = userToReport
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = reportReasonView
        self.viewModel.initialization()

        self.navigationItem.setHidesBackButton(true, animated: false)
        self.isModalInPresentation = true
        self.modalTransitionStyle = .crossDissolve
        
        self.configureButtonsReportReasonView()
        self.configureButtonsReportDetailView()
        self.configureButtonsReportFeedbackView()
    }
    
    private func configureButtonsReportReasonView() {
        self.reportReasonView.continueButton.addTarget(self, action: #selector(goDetails), for: .touchUpInside)
        self.reportReasonView.cancelButton.addTarget(self, action: #selector(cancelButton), for: .touchUpInside)
    }
    
    private func configureButtonsReportDetailView() {
        self.reportDetailView.detailsTextField.delegate = self
    
        self.reportDetailView.backButton.addTarget(self, action: #selector(cancelButton), for: .touchUpInside)
        self.reportDetailView.reportButton.addTarget(self, action: #selector(doReport), for: .touchUpInside)
    }
    
    private func configureButtonsReportFeedbackView() {
        self.reportFeedbackView.confirmationButton.addTarget(self, action: #selector(cancelButton), for: .touchUpInside)
    }

    @objc func goDetails() {
        self.viewModel.reports = self.reportReasonView.getReports()
        self.view = reportDetailView
    }
    
    @objc func doReport() {
        if self.reportDetailView.detailsTextField.text == "" || self.reportDetailView.detailsTextField.text == "Caso não queira, você pode deixar esse espaço em branco." {
            self.viewModel.message = nil
        } else {
            self.viewModel.message = self.reportDetailView.detailsTextField.text
        }
        self.viewModel.createReports(myUser: self.myUser, userToReport: self.userToReport) {
            DispatchQueue.main.async {
                self.view = self.reportFeedbackView
            }
        }
    }
    
    @objc func cancelButton() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ReportReasonViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.textLightBlue
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Caso não queira, você pode deixar esse espaço em branco."
            textView.textColor = UIColor.lightGray
        }
    }
}
