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
                            NavigationLink("StepperView"){
                                StepperView()
                            }
                            NavigationLink("DatePickerView"){
                                DatePickerView()
                            }
                            
                        }
                        
                        Section("Color Animation"){
                            NavigationLink("ColorView"){
                                ColorView()
                            }
                            NavigationLink("GradientView"){
                                GradientView()
                            }
                            NavigationLink("ImplicitAnimationView"){
                                ImplicitAnimationView()
                            }
                            NavigationLink("ExplicitAnimationView"){
                                ExplicitAnimationView()
                            }
                            NavigationLink("GestureView"){
                                GestureView()
                            }
                            NavigationLink("ShowHideView"){
                                ShowHideView()
                            }
                        }
                        
                        Section("Datastruct"){
                            NavigationLink("RandomStruct"){
                                RandomStruct()
                            }
                            NavigationLink("PropertiesStruct"){
                                PropertiesStruct()
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
                            NavigationLink("DateComponentsStruct"){
                                DateComponentsStruct()
                            }
                            NavigationLink("BundleStruct"){
                                BundleStruct()
                            }
                            NavigationLink("StringStruct"){
                                StringStruct()
                            }
                            NavigationLink("ErrorStruct"){
                                ErrorStruct()
                            }
                        }
                        
                        Section("ML"){
                            NavigationLink("MLView"){
                                MLView()
                            }
                            //Image recognition
                            //Sentiment analysis
                            //Regression analysis
                            
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
