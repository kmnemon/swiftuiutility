//
//  HasChange.swift
//  swiftuiutility
//
//  Created by ke on 1/25/25.
//

/*
 SwiftData can get confused if you accidentally attempt to insert the same object instance twice, which can sometimes happen when working with relationships. To avoid problems, you can check one of three properties in your model context to see exactly what data has been changed since the last save:

 * Read insertedModelsArray to see which model objects have been created.
 * Read changedModelsArray to see which model objects have been edited.
 * Read deletedModelsArray to see which model objects have been deleted, or read isDeleted directly on a model object.
 Each of these have equivalents in Core Data's NSManagedObject: isInserted, isUpdated, or isDeleted.

 Alternatively, you can read the hasChanges property of a model object, which will be true if the object has been inserted, deleted, or edited since the last save.
 */
