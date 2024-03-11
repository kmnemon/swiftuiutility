//
//  ContentView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/7.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationStack{
                    List{
                        Section("Basic"){
                            NavigationLink("Text"){
                                TextView()
                            }
                            NavigationLink("Form"){
                                FormView()
                            }
                            NavigationLink("Button"){
                                ButtonView()
                            }
                            NavigationLink("TextField"){
                                TextFieldView()
                            }
                            NavigationLink("PickerView"){
                                PickerView()
                            }
                            NavigationLink("List"){
                                ListView()
                            }
                            NavigationLink("Image"){
                                ImageView()
                            }
                            NavigationLink("ScrollView"){
                                ScrollViewC()
                            }
                            NavigationLink("NavagationStack"){
                                NavigationStackView()
                            }
                            NavigationLink("NavagationLink"){
                                NavigationLinkView()
                            }
                            NavigationLink("JSON"){
                                JsonView()
                            }
                            NavigationLink("ScrollingGridView"){
                                ScrollingGridView()
                            }
                            NavigationLink("KeyboardView"){
                                KeyBoardView()
                            }
                            NavigationLink("StackView"){
                                StackView()
                            }
                            NavigationLink("AlertView"){
                                AlertView()
                            }
                            NavigationLink("ModifierView"){
                                ModifierView()
                            }
                            NavigationLink("ToggleView"){
                                ToggleView()
                            }
                        }
                        
                        Section("Color"){
                            NavigationLink("ColorView"){
                                ColorView()
                            }
                            NavigationLink("GradientView"){
                                GradientView()
                            }
                        }
                        
                        Section("Other"){
                            NavigationLink("RandomView"){
                                RandomView()
                            }
                            NavigationLink("PropertiesView"){
                                PropertiesView()
                            }
                            NavigationLink("CustomView"){
                                CustomView()
                            }
                            NavigationLink("CustomModifierView"){
                                CustomModifierView()
                            }
                            NavigationLink("CustomContainersView"){
                                CustomContainersView()
                            }
                            NavigationLink("ForEachView"){
                                ForEachView()
                            }
                            NavigationLink("CustomBindingView"){
                                CustomBindingView()
                            }
                        }
                    }
                    .navigationTitle("Choose Component")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
