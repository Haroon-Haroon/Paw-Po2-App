struct LostPet: Identifiable {
    let id = UUID()
    let timelost: String
    let location: String
    let petPhoto: UIImage?
    let additionalDetails: String
}

import SwiftUI

struct SearchView: View {
    let lostPets: [LostPet] = [
        LostPet(timelost: "Lost on 21/8/2023", location: "Muhaisnah 1st Park", petPhoto: UIImage(named: "sml brwn dog"), additionalDetails: "Small brown dog lost in the park in muhaisnah 1, answers to the name 'Marco'."),
        LostPet(timelost: "Lost on 20/8/2023", location: "Mizhar 1", petPhoto: UIImage(named: "gray and white cat"), additionalDetails: "Gray and white cat lost in the neighborhood of Mizhar 1st, has a red collar with a silver bell on."),
        LostPet(timelost: "Lost on 19/8/2023", location: "Khawaneej", petPhoto: UIImage(named:"rabbit"), additionalDetails: "Small rabbit lost in khawaneej near Last Exit, the rabbit is easily frightened so please be gentle with it."),
        LostPet(timelost: "Lost on 17/8/2023",location: "Uptown Mirdif", petPhoto: UIImage(named: "dog"), additionalDetails: "Golden retreiver lost in the park in Uptown Mirdif, answers to the name Cheddar, wearing a black collar with a silver dog tag attached to it.")
    ]
    
    var body: some View {
        NavigationStack {
            List(lostPets) { lostPet in
                NavigationLink(destination: LostPetDetailView(lostPet: lostPet)) {
                    HStack {
                        Image(uiImage: lostPet.petPhoto ?? UIImage(systemName: "photo")!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                        
                        Text(lostPet.location)
                            .font(.headline)
                    }
                }
            }
            .navigationBarTitle("Lost Pets submissions")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
