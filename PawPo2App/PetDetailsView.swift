import SwiftUI
import PhotosUI
struct PetDetailsView: View {
    @State private var petPhoto: UIImage? = nil
    @State private var species = ""
    @State private var breed = ""
    @State private var additionalInfo = ""
    @State private var showImagePicker = false
    @EnvironmentObject var petViewModel: PetViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                Image(uiImage: petPhoto ?? UIImage(named: "insert image")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        showImagePicker = true
                    }
                
                TextField("Species", text: $species)
                TextField("Breed", text: $breed)
                TextField("Additional Info (Optional)", text: $additionalInfo)
                
                NavigationLink(destination: HomeView()) {
                    Text("Complete Registration")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationBarTitle("Pet Details")
        }
        .sheet(isPresented: $showImagePicker) {
            PHPickerView(image: $petPhoto)
        }
    }
}

struct PetDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailsView()
    }
}
