//
//  IsDelete.swift
//  swiftuiutility
//
//  Created by ke on 1/25/25.
//

/*
 All SwiftData model objects have an isDeleted property that determines whether it is deleted or not, but it needs to be used carefully.

 First, when you ask your model context to delete an object, it is only marked for deletion. The actual deletion won't take place until the next save is triggered; in the meantime the object will still be around, just stored in the deletedModelsArray of your context. Objects marked for deletion but not yet actually deleted will still appear in results from @Query.

 Second, if any part of your app retains a copy of a deleted model, isDeleted will appear true at first, but it may then flip back to false – even though the object itself has been deleted.

 Third, if you don't have autosave enabled and any part of your app retains a copy of the deleted model, attempting to change any properties is likely to result in a crash because the underlying data has been destroyed.

 Fourth, as a result of all these there's very little point trying to read the isDeleted in the disabled() SwiftUI view modifier – you might think it's helpful to disable a form if an object no longer exists, but in practice it's just a bit too quirky to rely upon.
 */
