//
//  QRCodeView.swift
//  swiftuiutility
//
//  Created by ke on 2024/11/7.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeView: View {
    @State private var name = "Anonymous"
    @State private var emailAddress = "yoursite@yoursite.com"
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
                .textContentType(.name)
            
            TextField("Email Address", text: $emailAddress)
                .textContentType(.emailAddress)
            
            Image(uiImage: generateQRCode(from: "\(name)\n\(emailAddress)"))
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
        }
    }
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}
