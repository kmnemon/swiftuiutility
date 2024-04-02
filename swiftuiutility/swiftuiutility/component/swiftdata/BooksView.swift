//
//  BooksView.swift
//  swiftuiutility
//
//  Created by ke on 3/31/24.
//

import SwiftUI
import SwiftData

struct CarsView: View {
    @Query var cars: [Car]
    
    var body: some View {
        List(cars) { car in
            Text(car.name)
        }
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<Car>]) {
        _cars = Query(filter: #Predicate<Car> { car in
            car.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
}

#Preview {
    BooksView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\Car.name)])
        .modelContainer(for: Car.self)
}
