//
//  ContentView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/7.
//

import SwiftUI
import SwiftData

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
                        NavigationLink("MenuView"){
                            MenuView()
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
                        NavigationLink("TextEditorView"){
                            TextEditorView()
                        }
                        NavigationLink("ToggleView"){
                            ToggleView()
                        }
                    }
                    
                    Section("Color Animation Haptic"){
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
                        NavigationLink("BindingView"){
                            BindingView()
                        }
                        NavigationLink("BindableView"){
                            BindableView1()
                        }
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
                    
                    Section("Network"){
                        NavigationLink("AsyncImageView"){
                            AsyncImageView()
                        }
                        NavigationLink("JSON"){
                            JsonView()
                        }
                        NavigationLink("JSON Advanced"){
                            JsonAdvancedView()
                        }
                        NavigationLink("SendingReceivingDataStruct"){
                            SendingReceivingDataStruct()
                        }
                        NavigationLink("SendingReceivingDataStruct2"){
                            SendingReceivingDataStruct2()
                        }
                    }
                    Section("Modifier") {
                        NavigationLink("DisabledModifier"){
                            DisabledModifier()
                        }
                        NavigationLink("SheetModifier"){
                            SheetModifier()
                        }
                        NavigationLink("TagModifier"){
                            TagModifier()
                        }
                        NavigationLink("ToolbarModifier"){
                            ToolbarModifier()
                        }
                    }
                    Section("ML"){
                        NavigationLink("MLView") {
                            MLView()
                        }
                        //Image recognition
                        //Sentiment analysis
                        //Regression analysis
                        
                    }
                    Section("SwiftData") {
                        NavigationLink("SwiftDataView") {
                        }
                        NavigationLink("EditBookView") {
                        }
                        NavigationLink("CarsViewContentView") {
                        }
                    }
                    
                    Section("Custom") {
                        NavigationLink("UsingRating") {
                            UsingRating()
                        }
                        NavigationLink("EmojiRatingView") {
                            EmojiRatingView(rating: 5)
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
