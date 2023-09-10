import SwiftUI

struct PetListView: View {
    @EnvironmentObject var petViewModel: PetViewModel
    
    var body: some View {
        NavigationView {
            List(petViewModel.pets) { pet in
                Text(pet.name)
            }
            .navigationBarTitle("Pet List")
        }
    }
}

struct PetListView_Previews: PreviewProvider {
    static var previews: some View {
        PetListView()
            .environmentObject(PetViewModel())
    }
}
