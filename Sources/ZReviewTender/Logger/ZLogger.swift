//
//  File.swift
//  
//
//  Created by JiaSin Liu on 2023/2/20.
//

import Foundation

final class ZLogger: AnalyticsBehavior {
    typealias FileManagable = FileModifiable
    
    private let fileManager: FileManagable
    
    init(name: String) {
        fileManager = ZFileManager()
    }
    
    func start() {
        fileManager.createFileIfNeeded()
    }
    
    func logInfo(_ message: String) {
        let log = "\(#function)📖: #\(message)\n"
        executeLog(log)
    }
    
    func logError(_ message: String) {
        let log = "\(#function)🚨: #\(message)\n"
        executeLog(log)
    }
    
    func logWarning(_ message: String) {
        let log = "\(#function)⚠️: #\(message)\n"
        executeLog(log)
    }
    
    private func executeLog(_ log: String) {
        print(log)
        fileManager.write(message: log)
    }
}
