//
//  UndoRedo.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/23.
//

import SwiftData
import SwiftUI

/*
 1.enable undo
 2.calling undo
 */

struct UndoRedo {
    //1. enable undo
    //.modelContainer(for: [Store.self, Book.self], isUndoEnabled: true)

    //2. call undo/redo
    @Environment(\.undoManager) var undoManager
    
    func undo() {
        undoManager?.undo()
        undoManager?.redo()
    }
    
    //If you’re creating your model container manually, you need to create the undo manager manually too, then you should use modelContext.undoManager?.undo() to perform an undo.
    /*
     container = try ModelContainer(for: Store.self, Book.self)
     container.mainContext.undoManager = UndoManager()
     
     modelContext.undoManager?.undo()
     */

    
    //3. canUndo canRedo
    /*
     As well as calling undo() and redo(), you can also check your undo manager's canUndo and canRedo property, to determine whether the actions are possible in the first place.
     */
    func canUndo() {
        undoManager?.canUndo
        undoManager?.canRedo
    }
    
    
}

