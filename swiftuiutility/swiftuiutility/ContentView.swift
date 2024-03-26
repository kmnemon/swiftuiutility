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
                        NavigationLink("AlertView"){
                            AlertView()
                        }
                        NavigationLink("Button"){
                            ButtonView()
                        }
                        NavigationLink("DatePickerView"){
                            DatePickerView()
                        }
                        NavigationLink("DeleteView"){
                            DeleteView()
                        }
                        NavigationLink("Form"){
                            FormView()
                        }
                        NavigationLink("ImageView"){
                            ImageView()
                        }
                        NavigationLink("KeyboardView"){
                            KeyBoardView()
                        }
                        NavigationLink("ListView"){
                            ListView()
                        }
                        NavigationLink("ModifierView"){
                            ModifierView()
                        }
                        NavigationLink("NavigationStack"){
                            NavigationStackView()
                        }
                        NavigationLink("NavigationStackCustomizeView"){
                            NavigationStackCustomizeView()
                        }
                        NavigationLink("NavigationLink"){
                            NavigationLinkView()
                        }
                        NavigationLink("NavigationDestinationView"){
                            NavigationDestinationView()
                        }
                        NavigationLink("NavigationStackReturnView"){
                            NavigationStackReturnView()
                        }
                        NavigationLink("NavigationStackSaveView"){
                            NavigationStackSaveView()
                        }
                        NavigationLink("PickerView"){
                            PickerView()
                        }
                        NavigationLink("ProgrammaticNavigationView"){
                            ProgrammaticNavigationView()
                        }
                        NavigationLink("RectangleView"){
                            RectangleView()
                        }
                        NavigationLink("ScrollView"){
                            ScrollViewC()
                        }
                        NavigationLink("ScrollingGridView"){
                            ScrollingGridView()
                        }
                        NavigationLink("SheetView"){
                            SheetView()
                        }
                        NavigationLink("StackView"){
                            StackView()
                        }
                        NavigationLink("StepperView"){
                            StepperView()
                        }
                        NavigationLink("Text"){
                            TextView()
                        }
                        NavigationLink("TextField"){
                            TextFieldView()
                        }
                        NavigationLink("ToggleView"){
                            ToggleView()
                        }
                    }
                    
                    Section("Color Animation"){
                        NavigationLink("AnimationBindingView"){
                            AnimationBindingView()
                        }
                        NavigationLink("ColorView"){
                            ColorView()
                        }
                        NavigationLink("CustomTransitionView"){
                            CustomTransitionView()
                        }
                        NavigationLink("ExplicitAnimationView"){
                            ExplicitAnimationView()
                        }
                        NavigationLink("HapticEffects"){
                            HapticEffects()
                        }
                        NavigationLink("GradientView"){
                            GradientView()
                        }
                        NavigationLink("ImplicitAnimationView"){
                            ImplicitAnimationView()
                        }
                        NavigationLink("ImplicitAnimationView2"){
                            ImplicitAnimationView2()
                        }
                        NavigationLink("GestureView"){
                            GestureView()
                        }
                        NavigationLink("ShowHideView"){
                            ShowHideView()
                        }
                    }
                    
                    Section("Datastruct"){
                        NavigationLink("BundleStruct"){
                            BundleStruct()
                        }
                        NavigationLink("ClassView"){
                            ClassView()
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
                        NavigationLink("CustomBindingView"){
                            CustomBindingView()
                        }
                        NavigationLink("DateComponentsStruct"){
                            DateComponentsStruct()
                        }
                        NavigationLink("ErrorStruct"){
                            ErrorStruct()
                        }
                        NavigationLink("ForEachView"){
                            ForEachView()
                        }
                        NavigationLink("PropertiesStruct"){
                            PropertiesStruct()
                        }
                        NavigationLink("RandomStruct"){
                            RandomStruct()
                        }
                        NavigationLink("StringStruct"){
                            StringStruct()
                        }
                        NavigationLink("UserDefaultsStruct"){
                            UserDefaultsStruct()
                        }
                    }
                    
                    Section("data"){
                        NavigationLink("AsyncImageView"){
                            AsyncImageView()
                        }
                        NavigationLink("JSON"){
                            JsonView()
                        }
                        NavigationLink("SendingReceivingDataStruct"){
                            SendingReceivingDataStruct()
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
