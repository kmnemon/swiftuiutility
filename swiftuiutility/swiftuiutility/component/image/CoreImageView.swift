//
//  CoreImageView.swift
//  swiftuiutility
//
//  Created by ke on 4/4/24.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

/*
UIImage(UI Kit), which comes from UIKit. This is an extremely powerful image type capable of working with a variety of image types, including bitmaps (like PNG), vectors (like SVG), and even sequences that form an animation. UIImage is the standard image type for UIKit, and of the three it’s closest to SwiftUI’s Image type.
CGImage(Core Grphics), which comes from Core Graphics. This is a simpler image type that is really just a two-dimensional array of pixels.
CIImage(Core Image), which comes from Core Image. This stores all the information required to produce an image but doesn’t actually turn that into pixels unless it’s asked to. Apple calls CIImage “an image recipe” rather than an actual image.
 
 *UIImage, CGImage, CIImage are pure data they hold image information, we cannot place into SwiftUI hierarchy, we can manipulate them freely, then present results in a SwiftUI View.
 
 inter-operate:
 we can make a UIImage from a CGImage, and vise visa UIImage<->CGImage
 CIImage<-UIImage,CIImage<-CGImage
 CGImage<-CIImage
 SwiftUI Image<-UIImage, SwiftUI Image<-CGImage
 
 
 */
struct CoreImageView: View {
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: {
            loadImage2()
        })
    }
    
    //Option 1: compare to Option 2 a litter newer way to use CIFilter
    func loadImage() {
        let inputImage = UIImage(resource: .zeldaBotwLogo2X)
        let beginImage = CIImage(image: inputImage)
        
        //filter do the actual work
        //context handle all the catch information to covert it into a processed CGImage
        let context = CIContext()
        
        let currentFilter = CIFilter.sepiaTone()
        currentFilter.inputImage = beginImage
        currentFilter.intensity = 1
        
        //get a CIImage from filter
        guard let outputImage = currentFilter.outputImage else { return }
        //using context covert the CIImage to the CGImage
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        //ui image
        let uiImage = UIImage(cgImage: cgImage)
        
        //swiftUI Image
        image = Image(uiImage: uiImage)
        
        //example 1
        //let currentFilter = CIFilter.pixellate()
        //currentFilter.scale = 10
        
        //example 2
        //let currentFilter = CIFilter.twirlDistortion()
        
        //currentFilter.inputImage = beginImage
        //currentFilter.redius = 400
        //currentFilter.center = CGPoint(x: inputImage.size.width / 2, y: inputImage.size.height / 2)

    }
    
    //Option 2: the old school Apple ways, check the filter ability in different CIFilter, you can quick change the CIFIlter
    func loadImage2() {
        let inputImage = UIImage(resource: .zeldaBotwLogo2X)
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        let currentFilter = CIFilter.twirlDistortion()
//        let currentFilter = CIFilter.pixellate() //you can quick change

        
        currentFilter.inputImage = beginImage
        let amount = 1.0
        let inputKeys = currentFilter.inputKeys
        
        //check if the CIFilter support ability below
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(amount, forKey: kCIInputIntensityKey)}
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)}
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)}
        
        
        //get a CI image from filter
        guard let outputImage = currentFilter.outputImage else { return }
        //get a CG image from CI image
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        //ui image
        let uiImage = UIImage(cgImage: cgImage)
        
        //swiftUI Image
        image = Image(uiImage: uiImage)
    }
}

#Preview {
    CoreImageView()
}
