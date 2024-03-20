//
//  AsyncImageView.swift
//  swiftuiutility
//
//  Created by ke on 3/20/24.
//

import SwiftUI

struct AsyncImageView: View {
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)
            
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")){ image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
//                Color.red
            }
            .frame(width: 200, height: 200)
            
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")){ phase in
                if let image = phase.image{
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Text("There was an error loading the image.")
                } else {
                    ProgressView()
                }
            }
            .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    AsyncImageView()
}
