//
//  File.swift
//  
//
//  Created by JiaSin Liu on 2023/2/20.
//

import Foundation

protocol AnalyticsBehavior {
    func logInfo(_ message: String)
    func logWarning(_ message: String)
    func logError(_ message: String)
    func start()
}
