//
//  AnchorPreference.swift
//  swiftuiutility
//
//  Created by ke Liu on 4/10/25.
//

import SwiftUI

struct Category: Identifiable, Equatable {
    let id: String
    let symbol: String
}

struct CategoryPreference: Equatable {
    let category: Category
    let anchor: Anchor<CGRect>
}

struct CategoryPreferenceKey: PreferenceKey {
    static let defaultValue = [CategoryPreference]()
    static func reduce(value: inout [CategoryPreference], nextValue: () -> [CategoryPreference]) {
        value.append(contentsOf: nextValue())
    }
}

struct CategoryButton: View {
    var category: Category
    @Binding var selection: Category?
    
    var body: some View {
        Button {
            withAnimation {
                selection = category
            }
        } label: {
            VStack {
                Image(systemName: category.symbol)
                Text(category.id)
            }
        }
        .buttonStyle(.plain)
        .accessibilityElement()
        .accessibilityLabel(category.id)
        .anchorPreference(key: CategoryPreferenceKey.self,
                          value: .bounds,
                          transform: { [CategoryPreference(category: category, anchor: $0)] })
    }
}
/*
 Anchors are built on top of geometry readers, preferences, and coordinate spaces. In
 essence, an anchor is a wrapper around a geometry value (a CGRect, CGSize, or
 CGPoint) measured in the global coordinate space. A geometry proxy has special
 support for anchors and lets us automatically transform the geometry value into the
 local coordinate space.
 */
/*
 1. We use overlayPreferenceValue() to specify we want to read in a
 particular preference key and convert it into an overlay. As a reminder,
 that means we want SwiftUI to place some kind of view over our
 VStack, and we’ll use the preference keys to figure out what that view
 should be.
 2. Inside our overlay we use a GeometryReader so we can evaluate our
 geometry somehow. This will automatically expand to fill all the
 available space, which is fine as an overlay because it will naturally fit
 the same space as the view it overlays.
 3. We look through all the category preferences for whichever one
 matches the selected category.
 4. If we find a match, we pass the selected preference’s anchor into our
 geometry proxy, which performs the conversion into a finished frame
 representing where that anchor is in the coordinates of our current
 GeometryReader.
 5. Now we have a real frame, we draw a black rectangle using the width
 of the frame so it matches the width of the thing we want to underline,
 giving it a 2-point height so it looks like a thick line.
 6. We want to position that rectangle so that its center lies at the middle
 bottom of our frame. If you prefer offset() rather than position() you
 should use frame.minX because we’re providing a relative movement
 rather than trying to center the view in some exact location.
 */
struct AnchorPreference: View {
    @State private var selectedCategory: Category?
    let categories = [
        Category(id: "Arctic", symbol: "snowflake"),
        Category(id: "Beach", symbol: "beach.umbrella"),
        Category(id: "Shared Homes", symbol: "house")
    ]
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                ForEach(categories) { category in
                    CategoryButton(category: category, selection: $selectedCategory)
                }
            }
            List(categories, id: \.id) { category in
                HStack {
                    Button(category.id) {
                        withAnimation {
                            selectedCategory = category
                        }
                    }
                    if selectedCategory == category {
                        Spacer()
                        Image(systemName: "checkmark")
                    }
                    if let selectedCategory {
                        Text("Selected: \(selectedCategory.id)")
                    }
                }
            }
        }
        .overlayPreferenceValue(CategoryPreferenceKey.self) { preferences in
            GeometryReader { proxy in
                if let selected = preferences.first(where: { $0.category == selectedCategory }) {
                    let frame = proxy[selected.anchor]
                    Rectangle()
                        .fill(.black)
                        .frame(width: frame.width, height: 2)
                        .position(x: frame.midX, y: frame.maxY)
                }
            }
        }
    }
}
