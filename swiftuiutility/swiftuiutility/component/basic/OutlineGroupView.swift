//
//  OutlineGroup.swift
//  swiftuiutility
//
//  Created by ke Liu on 3/16/26.
//

import SwiftUI

class FamilyModel: Identifiable {
    var name: String
    
    var children: [FamilyModel]?
    
    init(name: String) {
        self.name = name
    }
}


struct OutlineGroupView: View {
    var familyMembers: [FamilyModel]
    
    var body: some View {
        OutlineGroup(familyMembers, children: \FamilyModel.children) { familyMember in
            VStack(alignment: .leading) {
                Text(familyMember.name)
            }
            .padding(4)
        }
        .padding()
    }
}

#Preview {
    // Grandchildren
    let grandchild1 = FamilyModel(name: "Billy Haverson Jr.")
    
    // Children
    let child1 = FamilyModel(name: "Billy Haverson")
    let child2 = FamilyModel(name: "Sarah Haverson")
    let child3 = FamilyModel(name: "Camille Devreau")
    let child4 = FamilyModel(name: "Gabriel Devreau")
    let child5 = FamilyModel(name: "Léo Devreau")

    child1.children = [grandchild1]
    
    // Parents
    let parent1 = FamilyModel(name: "Fred Haverson")
    parent1.children = [child1, child2]
    let parent2 = FamilyModel(name: "Juliette Devreau")
    parent2.children = [child3, child4, child5]
    
    let familyMembers = [parent1, parent2]
    
    return OutlineGroupView(familyMembers: familyMembers)
}
