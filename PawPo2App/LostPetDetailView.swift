import SwiftUI
struct LostPetDetailView: View {
    let lostPet: LostPet
    
    var body: some View {
        VStack {
            Image(uiImage: lostPet.petPhoto ?? UIImage(systemName: "photo")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
            
            Text("Location: \(lostPet.location)")
                .font(.headline)
                .padding()
            
            Text("Additional Details:")
                .font(.headline)
                .padding(.bottom, 4)
            
            Text(lostPet.additionalDetails)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
        }
        .navigationBarTitle("Lost Pet Details")
    }
}
