//
//  File.swift
//  
//
//  Created by JiaSin Liu on 2023/2/20.
//

import Foundation

final class ZFileManager {
    let fileName: String
    private let fileManager: FileManager
    private lazy var path: String = makePath()
    
    init(fileName: String = File.create(type: .log, name: "execute"),
         _ fileManager: FileManager = .default) {
        self.fileManager = fileManager
        self.fileName = fileName
    }
}

//MARK: Lazy variable maker
private extension ZFileManager {
    func makePath() -> String {
        let filePath = fileManager.currentDirectoryPath + "/\(fileName)"
        return filePath
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func createFile(at path: String) {
        if (fileManager.createFile(atPath: path, contents: nil, attributes: nil)) {
            print("\(fileName) created successfully.\n")
        } else {
            print("\(fileName) can not be created.\n")
        }
    }
}

//MARK: FileModifiable
extension ZFileManager: FileModifiable {
    func createFileIfNeeded() {
        if fileManager.fileExists(atPath: path) {
            try! fileManager.removeItem(atPath: path)
        }
        createFile(at: path)
    }
    
    func write(message: String) {
        do {
            try message.write(toFile: path, atomically: true, encoding: .utf8)
            print("written successfully")
        } catch {
            print("\(#function): #\(message)")
        }
    }
}
