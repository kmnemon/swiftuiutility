//
//  GenericJsonView.swift
//  swiftuiutility
//
//  Created by ke on 2024/5/4.
//

import SwiftUI

extension GenericJsonView {
    enum DataError: Error {
        case urlWrong
        case jsonDecodeError
    }
    
    func decode<T: Codable>(urlString: String) async -> Result<T, Error> {
        guard let url = URL(string: urlString) else {
            return Result.failure(DataError.urlWrong)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let datas = try JSONDecoder().decode(T.self, from: data)
            return Result.success(datas)
        } catch {
            return Result.failure(error)
        }
    }
}


struct GenericJsonView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    GenericJsonView()
}
