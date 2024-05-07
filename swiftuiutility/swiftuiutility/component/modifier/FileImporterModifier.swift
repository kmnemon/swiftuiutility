//
//  FileImporterModifier.swift
//  swiftuiutility
//
//  Created by ke on 2024/5/7.
//

import SwiftUI

struct FileImporterModifier: View {
    @State private var importFile = false
    var body: some View {
        Button("Upload") {
            
        }
        .fileImporter(
            isPresented: $importFile,
            allowedContentTypes: [.text]) { result in
            switch result {
            case .success(let file):
                print(file.absoluteString)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    FileImporterModifier()
}
