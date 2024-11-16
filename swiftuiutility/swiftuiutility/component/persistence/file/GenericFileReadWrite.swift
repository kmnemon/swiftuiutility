//
//  GenericFileReadWrite.swift
//  swiftuiutility
//
//  Created by ke on 2024/11/4.
//

import Foundation

extension FileManager {
    func writeTo(message: String, fileDir: String) {
        let data = Data(message.utf8)
        let url = URL.documentsDirectory.appending(path: fileDir)
        
        do {
            try data.write(to: url, options: [.atomic, .completeFileProtection])
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func ReadFrom(fileDir: String) -> String {
        let url = URL.documentsDirectory.appending(path: fileDir)
        
        do {
            let output = try String(contentsOf: url)
            return output
        } catch {
            print(error.localizedDescription)
            return ""
        }
    }
}
