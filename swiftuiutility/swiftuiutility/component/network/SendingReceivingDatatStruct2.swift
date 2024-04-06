//
//  SendingReceivingDataStrcut2.swift
//  swiftuiutility
//
//  Created by ke on 3/27/24.
//

import SwiftUI

extension SendingReceivingDataStruct2 {
    @Observable
    class Order: Codable {
        enum CodingKeys: String, CodingKey {
            case _type = "type"
            case _name = "name"
        }
        
        var type: String = ""
        var name: String = ""
        
        init(type: String, name: String){
            self.type = type
            self.name = name
        }
    }
}

struct SendingReceivingDataStruct2: View {
    var order = Order(type: "ninedo", name: "switch")
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    var body: some View {
        Button("Place Order") {
            Task {
                await placeOrder()
            }
        }
        .font(.title)
        .alert("Tank you!", isPresented: $showingConfirmation) {
            Button("OK") {}
        } message: {
            Text(confirmationMessage)
        }
    }
    
    func placeOrder() async {
        guard let encode = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        //debug lldb: p String(decoding: encoded, as: UTF8.self)
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            //send data
            let(data, _) = try await URLSession.shared.upload(for: request, from: encode)
            
            //receive data
            let decodeOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decodeOrder.name)x \(decodeOrder.type.lowercased()) games is on the way!"
            showingConfirmation = true
        } catch {
            print("Check out failed: \(error.localizedDescription)")
        }
    }
}

#Preview {
    SendingReceivingDataStruct2()
}
