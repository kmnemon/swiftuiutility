//
//  ShareLinkView.swift
//  swiftuiutility
//
//  Created by ke on 4/4/24.
//

import SwiftUI

struct ShareLinkView: View {
    var body: some View {
        VStack {
            ShareLink(item: URL(string: "https://kmnemon.github.com")!)
            ShareLink(item: URL(string: "https://kmnemon.github.com")!, subject: Text("Learn swiftui here"), message: Text("check out kmnemon.github.com"))
            ShareLink(item: URL(string: "https://kmnemon.github.com")!) {
                Label("spread the word", systemImage: "swift")
            }
            
            let example = Image(.zeldaBotwLogo2X)
            ShareLink(item: example, preview: SharePreview("game zelda", image: example)) {
                Label("click to share", systemImage: "airplane")
            }



        }
    }
}

#Preview {
    ShareLinkView()
}
