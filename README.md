# swiftui-utility
This repository contains code examples of small SwiftUI components. Its purpose is to assist SwiftUI developers in searching for specific components and understanding how to use them effectively.

For example:
###AlertView
```
struct AlertView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("show alert"){
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert){
            Button("OK"){}
            Button("Continue", action: { () ->Void in })
            Button("Delete", role: .destructive){ 
                //action
            }
            Button("Cancel", role: .cancel){}
        } message: {
            Text("Please read this")
        }        
    }
}
```
