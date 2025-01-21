//
//  FindData.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/21.
//

import SwiftData
import SwiftUI

@Model
class MovieToFind {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}



struct FindData {
    @Environment(\.modelContext) var modelContext
    
    func saveMove() -> PersistentIdentifier {
        let movie = MovieToFind(name: "zoo")
        modelContext.insert(movie)
        try? modelContext.save()
        let id = movie.persistentModelID
        return id
    }
    
    func fetchMovie(_ id: PersistentIdentifier) {
        //example 1: using PersistentIdentifier
        if let m = modelContext.model(for: id) as? MovieToFind {
            print(m.name)
        }
        
        //example 2: using registeredModel
        var m1: MovieToFind?
        m1 = modelContext.registeredModel(for: id)
        print(m1?.name ?? "anorld")
    }
}






