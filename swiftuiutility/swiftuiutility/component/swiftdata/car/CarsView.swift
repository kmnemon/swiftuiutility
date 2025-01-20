//
//  BooksView.swift
//  swiftuiutility
//
//  Created by ke on 3/31/24.
//

import SwiftUI
import SwiftData

struct CarsView: View {
    @Environment(\.modelContext) var modelContent
    @Query var cars: [Car]
    
    var body: some View {
        List(cars) { car in
            HStack {
                Text(car.name)
                
                Spacer()
                
                Text(String(car.tires.count))
                    .fontWeight(.black)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
            }
        }
        .onAppear(perform: addSample)
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<Car>]) {
        _cars = Query(filter: #Predicate<Car> { car in
            car.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
    
    //add links between car and tire, swift data links two object automatically two way bind
    func addSample() {
        let car1 = Car(id: UUID(), name: "Ford", type: "Van", joinDate: .now)
        let tire1 = Tire(name: "Michelin", brand: 0)
        let tire2 = Tire(name: "Yokohama", brand: 1)
        
        modelContent.insert(car1)
        
        car1.tires.append(tire1)
        car1.tires.append(tire2)
        
    }
}

#Preview {
    CarsView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\Car.name)])
        .modelContainer(for: Car.self)
}
