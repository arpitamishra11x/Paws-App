import Foundation
import SwiftData
@Model
final class Pet {
    var name: String
    @Attribute(.externalStorage) var photo: Data?
    
    init(name: String, photo: Data? = nil) {
        self.name = name
        self.photo = photo
    }
}
extension Pet{
    @MainActor
     static var preview: ModelContainer {
         let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
         let container = try! ModelContainer(for: Pet.self, configurations: configuration)
         
         container.mainContext.insert(Pet(name: "Tommy"))
             container.mainContext.insert(Pet(name: "Honey"))
             container.mainContext.insert(Pet(name: "Rock"))
             container.mainContext.insert(Pet(name: "Dolly"))
             container.mainContext.insert(Pet(name: "Jolly"))
             container.mainContext.insert(Pet(name: "Rocky"))
             container.mainContext.insert(Pet(name: "Mimi"))
             container.mainContext.insert(Pet(name: "Luna"))
         return container
     }

}
