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
                        NavigationLink("NavigationStack"){
                            NavigationStackView()
                        }
                        NavigationLink("NavigationLink"){
                            NavigationLinkView()
                        }
                        NavigationLink("NavigationDestinationView"){
                            NavigationDestinationView()
                        }
                        NavigationLink("ProgrammaticNavigationView"){
                            ProgrammaticNavigationView()
                        }
                        NavigationLink("NavigationStackReturnSaveView"){
                            NavigationStackReturnSaveView()
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
                        NavigationLink("SheetView"){
                            SheetView()
                        }
                        NavigationLink("DeleteView"){
                            DeleteView()
                        }
                        NavigationLink("RectangleView"){
                            RectangleView()
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
                        NavigationLink("CustomTransitionView"){
                            CustomTransitionView()
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
                        NavigationLink("JSON"){
                            JsonView()
                        }
                        NavigationLink("UserDefaultsStruct"){
                            UserDefaultsStruct()
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
