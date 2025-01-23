//
//  ComplexMigration.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/23.
//

import SwiftData
/*
 1. You need to define multiple versions of our data model.
 2. You wrap each of those versions inside an enum that conforms to the VersionedSchema protocol. (It’s an enum only because we won’t actually be instantiating these directly.)
 3. You create another enum that conforms to the SchemaMigrationPlan protocol, which is where you'll handle the migrations between each model version.
 4. You then create a custom ModelContainer configuration that knows to use the migration plan as needed.
 */

struct ComplexMigration {
    //1. 2.
    enum UsersSchemaV1: VersionedSchema {
        static var versionIdentifier = Schema.Version(1, 0, 0)

        static var models: [any PersistentModel.Type] {
            [User.self]
        }

        @Model
        class User {
            var name: String
            var age: Int

            init(name: String, age: Int) {
                self.name = name
                self.age = age
            }
        }
    }
    
    enum UsersSchemaV2: VersionedSchema {
        static var versionIdentifier = Schema.Version(2, 0, 0)

        static var models: [any PersistentModel.Type] {
            [User.self]
        }

        @Model
        class User {
            @Attribute(.unique) var name: String
            var age: Int

            init(name: String, age: Int) {
                self.name = name
                self.age = age
            }
        }
    }
    
    typealias User = UsersSchemaV2.User
    
    //3. migration plan
    /*
     1. An array of all the versioned schemas you want to use.
     2. One or more MigrationStage instances, defining how to move from one specific version to another.
     3. A stages array that lists all the migration stages you have defined.
     */
    enum UsersMigrationPlan: SchemaMigrationPlan {
        //1.
        static var schemas: [any VersionedSchema.Type] {
            [UsersSchemaV1.self, UsersSchemaV2.self]
        }
        
        //2.
        static let migrateV1toV2 = MigrationStage.custom(
            fromVersion: UsersSchemaV1.self,
            toVersion: UsersSchemaV2.self,
            willMigrate: { context in
                // remove duplicates then save
                let users = try context.fetch(FetchDescriptor<UsersSchemaV1.User>())

                var usedNames = Set<String>()

                for user in users {
                    if usedNames.contains(user.name) {
                        context.delete(user)
                    }

                    usedNames.insert(user.name)
                }

                try context.save()
            }, didMigrate: nil
        )
        
        static var stages: [MigrationStage] {
            [migrateV1toV2]
        }
    }
    
    //4.create a custom ModelContainer configuration
    /*
     This means going to your main App struct and giving it a new property to store a custom-configured model container:
     */
    
//    @main
//    struct swiftuiutilityApp: App {
//        let container: ModelContainer
//        
//        init() {
//            do {
//                container = try ModelContainer(
//                    for: User.self,
//                    migrationPlan: UsersMigrationPlan.self
//                )
//            } catch {
//                fatalError("Failed to initialize model container.")
//            }
//        }
//        
//        var body: some Scene {
//            WindowGroup {
//                ContentView()
//            }
//            //a model container is swiftdata's name for where it stores its data
//            .modelContainer(container)
//        }
//    }
    
}
