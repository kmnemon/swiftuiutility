//
//  PhotosUIView.swift
//  swiftuiutility
//
//  Created by ke on 4/4/24.
//

import SwiftUI
import PhotosUI

struct PhotosPickerView: View {
    //URL to PhotoLibrary
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    @State private var pickerItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    
    var body: some View {
        VStack{
            VStack {
                PhotosPicker(selection: $pickerItem, matching: .images) {
                    Label("Select a picture", systemImage: "photo")
                }
                
                selectedImage?
                    .resizable()
                    .scaledToFit()
            }
            .onChange(of: pickerItem) {
                Task {
                    selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
                }
            }
            
            VStack {
                PhotosPicker(selection: $pickerItem, matching: .any(of: [.images, .not(.screenshots)])) {
                    Label("Select a picture", systemImage: "photo")
                }
                
                selectedImage?
                    .resizable()
                    .scaledToFit()
            }
            .onChange(of: pickerItem) {
                Task {
                    selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
                }
            }
            
            VStack {
                PhotosPicker("Select pictures", selection: $pickerItems, maxSelectionCount: 3, matching: .images)
                
                ScrollView {
                    ForEach(0..<selectedImages.count, id: \.self) { i in
                        selectedImages[i]
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
            .onChange(of: pickerItems) {
                Task {
                    selectedImages.removeAll()
                    for item in pickerItems {
                        if let loadedImage = try await item.loadTransferable(type: Image.self) {
                            selectedImages.append(loadedImage)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PhotosPickerView()
}
