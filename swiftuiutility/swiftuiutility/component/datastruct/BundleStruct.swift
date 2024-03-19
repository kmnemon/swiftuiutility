//
//  BundleView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/15.
//

import SwiftUI

//decode example
extension Bundle{
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError("failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("failed to decode \(file) from bundle")
        }
        
        return loaded
    }
}

struct BundleStruct: View {
//    let astronauts: [String: String] = Bundle.main.decode("abc.json")
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func testBundles(){
        if let fileURL = Bundle.main.url(forResource: "somefile", withExtension: "txt"){
            if let fileContents = try? String(contentsOf: fileURL){
            }
        }
    }
}

#Preview {
    BundleStruct()
}
