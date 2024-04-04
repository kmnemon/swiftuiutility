//
//  PhotosUIView.swift
//  swiftuiutility
//
//  Created by ke on 4/4/24.
//

import SwiftUI
import PhotosUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct PhotosPickerView: View {
    //URL to PhotoLibrary
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    @State private var pickerItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    
    @State private var filterIntensity = 0.5
    @State private var currentFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
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
            
            VStack{
                Spacer()
                
                PhotosPicker(selection: $pickerItem) {
                    if let selectedImage {
                        selectedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                    }
                }
                .buttonStyle(.plain)
                .onChange(of: pickerItem, loadImage)
                
                Spacer()
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                        .onChange(of: filterIntensity, applyPprocessing)
                } 
            }
        }
    }
    
    func loadImage() {
        Task {
            guard let imageData = try await pickerItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }
            
            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            applyPprocessing()
        }
    }
    
    func applyPprocessing() {
        currentFilter.intensity = Float(filterIntensity)
        
        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        let uiImage = UIImage(cgImage: cgImage)
        selectedImage = Image(uiImage: uiImage)
    }
}

#Preview {
    PhotosPickerView()
}
