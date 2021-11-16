//
//  ReportViewModel.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 12/11/21.
//

import Foundation

class ReportViewModel: ViewModelType {
    weak var delegate: ViewModelDelegate?
    var reports: [Reports] = [Reports]()
    
    var myUser: UserDTO?
    var userToReport: UserDTO?
    var completion: (() -> Void)?

    var report: Reports? {
        didSet {
            if let reportType = self.report {
                switch reportType {
                case .fakeProfile, .toxicPerson:
                    if let userToReport = self.userToReport {
                        self.reportService.reportUser(user: userToReport, typeReport: reportType, message: self.message ?? "") { result in
                            switch result {
                            case .success(_):
                                self.manageReport()
                            case.failure(_):
                                self.completion?()
                            }
                        }
                    } else {
                        self.completion?()
                    }
                case .blockProfile:
                    if let userToReport = self.userToReport, let myUser = self.myUser {
                        self.reportService.blockUser(userToBlock: userToReport, myUser: myUser) { result in
                            switch result {
                            case .success(_):
                                self.manageReport()
                            case.failure(_):
                                self.completion?()
                            }
                        }
                    } else {
                        self.completion?()
                    }
                }
            }
        }
    }

    var message: String?
    let reportService: ReportCKService = ReportCKService()

    func initialization() {
    }
    
    public func createReports(myUser: UserDTO, userToReport: UserDTO, completion: @escaping () -> Void) {
        self.myUser = myUser
        self.userToReport = userToReport
        self.completion = completion
    
        if reports.count == 0 {
            self.completion?()
        } else {
            self.manageReport()
        }
    }
    
    private func manageReport() {
        if reports.count == 0 {
            self.completion?()
        } else {
            self.report = self.reports.remove(at: 0)
        }
    }
}
