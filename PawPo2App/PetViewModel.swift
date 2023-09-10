import SwiftUI

struct Pet: Identifiable {
    var id = UUID()
    var name: String
    var breed: String
}
class PetViewModel: ObservableObject {
    @Published var pets: [Pet] = []
    
    func addPet(_ pet: Pet) {
        pets.append(pet)
    }
}
