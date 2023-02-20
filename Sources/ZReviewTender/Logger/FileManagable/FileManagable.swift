//
//  File.swift
//  
//
//  Created by JiaSin Liu on 2023/2/20.
//

import Foundation

protocol FileModifiable {
    func createFileIfNeeded()
    func write(message: String)
}
