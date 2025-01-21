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
        return movie.id
    }
    
    func fetchMovie(_ id: PersistentIdentifier) {
        //example 1: using PersistentIdentifier
        /*
         this will cause a crash if your persistent identifier is invalid
         */
        if let m = modelContext.model(for: id) as? MovieToFind {
            print(m.name)
        }
        
        //example 2: using registeredModel
        /*
         registeredModel(for:) variant that only returns an object if it exists in the current model context. (Of course, that has its own problems because your model context likely only contains a subset of all the objects in your container!)
         */
        var m1: MovieToFind?
        m1 = modelContext.registeredModel(for: id)
        print(m1?.name ?? "anorld")
    }
}






