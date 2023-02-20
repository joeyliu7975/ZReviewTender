//
//  File.swift
//  
//
//  Created by JiaSin Liu on 2023/2/20.
//

import Foundation

enum File {
    case log
    
    static func create(type: File, name: String) -> String {
        let postfix: String
        switch type {
        case .log:
            postfix = ".log"
        }
        return name + postfix
    }
}
