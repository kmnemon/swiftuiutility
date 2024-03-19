//
//  NavigationDestinationView.swift
//  swiftuiutility
//
//  Created by ke on 3/19/24.
//

import SwiftUI

struct Student: Hashable {
    var id = UUID()
    var name: String
    var age: Int
}

struct NavigationDestinationView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        Section("1"){
            NavigationStack(){
                List{
                    ForEach(0..<3){ i in
                        NavigationLink("Select Number: \(i)", value: i)
                    }
                    ForEach(0..<3){ i in
                        NavigationLink("Select String: \(i)", value: String(i))
                    }
                    .navigationDestination(for: Int.self){ selection in
                        Text("you selected \(selection)")
                    }
                    .navigationDestination(for: String.self){ selection in
                        Text("you selected string \(selection)")
                    }
                }
            }
        }
        
        Section("2"){
            NavigationStack(path: $path){
                List{
                    ForEach(0..<3){ i in
                        NavigationLink("Select Number: \(i)", value: i)
                    }
                    ForEach(0..<3){ i in
                        NavigationLink("Select String: \(i)", value: String(i))
                    }
                }
                .toolbar{
                    Button("Push 555"){
                        path.append(555)
                    }
                    Button("Push Hello"){
                        path.append("Hello")
                    }
                }
                .navigationDestination(for: Int.self){ selection in
                    Text("you selected \(selection)")
                }
                .navigationDestination(for: String.self){ selection in
                    Text("you selected string \(selection)")
                }
                .navigationDestination(for: Student.self){ student in
                    Text("you selected \(student.name)")
                }
            }
        }
    }
}

#Preview {
    NavigationDestinationView()
}
