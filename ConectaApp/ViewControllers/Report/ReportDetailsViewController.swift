//
//  ReportDetailsViewController.swift
//  ConectaApp
//
//  Created by Cecilia Soares on 10/11/21.
//

import UIKit

class ReportDetailsViewController: UIViewController {
    
    let reportView = ReportDetailsView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = reportView
        reportView.detailsTextField.delegate = self
       
    }
    
}
extension ReportDetailsViewController: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.white
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Placeholder"
            textView.textColor = UIColor.white
        }
    }
}
