//
//  DocumentsDirectoryView.swift
//  swiftuiutility
//
//  Created by ke on 4/5/24.
//

import SwiftUI
/*
 1. Atomic writing causes the system to write our full file to a temporary filename (not the one we asked for), and when that’s finished it does a simple rename to our target filename. This means either the whole file is there or nothing is.
 2. Asking for complete file protection means iOS automatically (and transparently) encrypts the file, and only allows our app to read it while the device is unlocked. iOS does a great job of keeping user data secure, but there's no harm being extra safe!
 */

struct FileReadWriteView: View {
    var body: some View {
        Button("Read and Write") {
            let data = Data("Test Message".utf8)
            let url = URL.documentsDirectory.appending(path: "message.txt")
            
            do {
                try data.write(to: url, options: [.atomic, .completeFileProtection])
                let input = try String(contentsOf: url)
                print(input)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    FileReadWriteView()
}
