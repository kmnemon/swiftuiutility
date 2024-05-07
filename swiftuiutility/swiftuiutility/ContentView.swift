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
                        NavigationLink("KeyboardView"){
                            KeyBoardView()
                        }
                        NavigationLink("ListView"){
                            ListView()
                        }
                        NavigationLink("ListView2"){
                            ListView2()
                        }
                        NavigationLink("MenuView"){
                            MenuView()
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
                        NavigationLink("RequestReviewView"){
                            RequestReviewView()
                        }
                        NavigationLink("ScenePhaseView"){
                            ScenePhaseView()
                        }
                        NavigationLink("ScrollListView"){
                            ScrollListView()
                        }
                        NavigationLink("ScrollingGridView"){
                            ScrollingGridView()
                        }
                        NavigationLink("ShareLinkView"){
                            ShareLinkView()
                        }
                        NavigationLink("SliderView"){
                            SliderView()
                        }
                        NavigationLink("StepperView"){
                            StepperView()
                        }
                        NavigationLink("TabsView"){
                            TabsView()
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
                        NavigationLink("ToolbarItemView"){
                            ToolbarItemView()
                        }
                        NavigationLink("UnavailableView"){
                            UnavailableView()
                        }
                    }
                    
                    Section("Layout") {
                        NavigationLink("AlignmentView"){
                            AlignmentView()
                        }
                        NavigationLink("CustomAlignmentView"){
                            CustomAlignmentView()
                        }
                        NavigationLink("GeometryReaderView"){
                            GeometryReaderView()
                        }
                        NavigationLink("GeometryReaderView2"){
                            GeometryReaderView2()
                        }
                        NavigationLink("GeometryReaderView3"){
                            GeometryReaderView3()
                        }
                        NavigationLink("GeometryReaderView4"){
                            GeometryReaderView4()
                        }
                        NavigationLink("GeometryReaderView5"){
                            GeometryReaderView5()
                        }
                        NavigationLink("GroupView"){
                            GroupView()
                        }
                        NavigationLink("PositionView"){
                            PositionView()
                        }
                        NavigationLink("StackView"){
                            StackView()
                        }
                        NavigationLink("VisualEffectView"){
                            VisualEffectView()
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
                        NavigationLink("ShowHideView"){
                            ShowHideView()
                        }
                    }
                    
                    Section("Network"){
                        NavigationLink("AsyncImageView"){
                            AsyncImageView()
                        }
                        NavigationLink("BundleStruct"){
                            BundleStruct()
                        }
                        NavigationLink("JSON"){
                            JsonView()
                        }
                        NavigationLink("JSON Advanced"){
                            JsonAdvancedView()
                        }
                        NavigationLink("GenericJsonView"){
                            GenericJsonView()
                        }
                        NavigationLink("SendingReceivingDataStruct"){
                            SendingReceivingDataStruct()
                        }
                        NavigationLink("SendingReceivingDataStruct2"){
                            SendingReceivingDataStruct2()
                        }
                    }
                    
                    Section("Image") {
                        NavigationLink("ImageView"){
                            ImageView()
                        }
                        NavigationLink("ImageInterpolationView"){
                            ImageInterpolationView()
                        }
                        NavigationLink("CoreImageView"){
                            CoreImageView()
                        }
                        NavigationLink("PhotosPickerView"){
                            PhotosPickerView()
                        }
                    }
                    
                    Section("Map") {
                        NavigationLink("MapKitView"){
                            MapKitView()
                        }
                        NavigationLink("MapKitPositionView"){
                            MapKitPositionView()
                        }
                        NavigationLink("MapKitAnnotationView"){
                            MapKitAnnotationView()
                        }
                        NavigationLink("MapKitTapView"){
                            MapKitTapView()
                        }
                    }
                    
                    Section("Biometric") {
                        NavigationLink("FaceIDTouchIDView"){
                            FaceIDTouchIDView()
                        }
                    }
                    
                    Section("Gesture") {
                        NavigationLink("DragGestureView"){
                            DragGestureView()
                        }
                        NavigationLink("GesturesView"){
                            GesturesView()
                        }
                        NavigationLink("HitTestingView"){
                            HitTestingView()
                        }
                    }
                    
                    Section("Modifier") {
                        NavigationLink("AlertModifier"){
                            AlertModifier()
                        }
                        NavigationLink("AlertOptionalModifier"){
                            AlertOptionalModifier()
                        }
                        NavigationLink("ConfirmationModifier"){
                            ConfirmationModifier()
                        }
                        NavigationLink("ContextMenuModifier"){
                            ContextMenuModifier()
                        }
                        NavigationLink("CustomModifierView"){
                            CustomModifierView()
                        }
                        NavigationLink("DisabledModifier"){
                            DisabledModifier()
                        }
                        NavigationLink("FileImporterModifier"){
                            FileImporterModifier()
                        }
                        NavigationLink("ModifierView"){
                            ModifierView()
                        }
                        NavigationLink("OnChangeModifier"){
                            OnChangeModifier()
                        }
                        NavigationLink("SearchableModifier"){
                            SearchableModifier()
                        }
                        NavigationLink("SheetModifier"){
                            SheetModifier()
                        }
                        NavigationLink("SheetOptionalModifier"){
                            SheetOptionalModifier()
                        }
                        NavigationLink("SwipeActionsModifier"){
                            SwipeActionsModifier()
                        }
                        NavigationLink("TagModifier"){
                            TagModifier()
                        }
                        NavigationLink("ToolbarModifier"){
                            ToolbarModifier()
                        }
                    }
                    
                    Section("Notification") {
                        NavigationLink("UserNotificationsView") {
                            UserNotificationsView()
                        }
                    }
                    
                    Section("Accessibility") {
                        NavigationLink("AccessibilityDataView") {
                            AccessibilityDataView()
                        }
                        NavigationLink("AccessibilityControlView") {
                            AccessibilityControlView()
                        }
                        NavigationLink("SpecificAccessibilityView") {
                            SpecificAccessibilityView()
                        }
                        NavigationLink("VoiceOverView") {
                            VoiceOverView()
                        }
                        NavigationLink("VoiceInputView") {
                            VoiceInputView()
                        }
                    }
                    
                    Section("SwiftData") {
                        NavigationLink("SwiftDataView") {
                        }
                        NavigationLink("EditBookView") {
                        }
                        NavigationLink("CarsViewContentView") {
                        }
                    }
                    
                    Section("Datastruct"){
                        NavigationLink("BindingView"){
                            BindingView()
                        }
                        NavigationLink("BindableView"){
                            BindableView1()
                        }
                        NavigationLink("ClassView"){
                            ClassView()
                        }
                        NavigationLink("ComparableStruct"){
                            ComparableStruct()
                        }
                        NavigationLink("CustomView"){
                            CustomView()
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
                        NavigationLink("EnumsView"){
                            EnumsView()
                        }
                        NavigationLink("ForEachView"){
                            ForEachView()
                        }
                        NavigationLink("ObservableObject"){
                            ObservableObject()
                        }
                        NavigationLink("OperatorOverloadStruct"){
                            OperatorOverloadStruct()
                        }
                        NavigationLink("PropertiesStruct"){
                            PropertiesStruct()
                        }
                        NavigationLink("PropertyWrapperStruct"){
                            PropertyWrapperStruct()
                        }
                        NavigationLink("RandomStruct"){
                            RandomStruct()
                        }
                        NavigationLink("ResultTypeStruct"){
                            ResultTypeStruct()
                        }
                        NavigationLink("StringStruct"){
                            StringStruct()
                        }
                        NavigationLink("TimerView"){
                            TimerView()
                        }
                        NavigationLink("UserDefaultsStruct"){
                            UserDefaultsStruct()
                        }
                        NavigationLink("URLReadWriteView"){
                            URLReadWriteView()
                        }
                    }
                    
                    Section("Custom Component") {
                        NavigationLink("UsingRating") {
                            UsingRating()
                        }
                        NavigationLink("EmojiRatingView") {
                            EmojiRatingView(rating: 5)
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
