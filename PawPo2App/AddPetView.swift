
import SwiftUI
import PhotosUI
struct AddPetView: View {
    @State private var petPhoto: UIImage? = nil
    @State private var species = ""
    @State private var breed = ""
    @State private var additionalInfo = ""
    @State private var showImagePicker = false
    @Binding var showHome: Bool
    @EnvironmentObject var petViewModel: PetViewModel
    
    
    var body: some View {
        NavigationStack{
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
               
                
            }
            .padding()
            .navigationBarTitle("Add Pet")
            NavigationLink("Add Pet", destination: HomeView())
        }
        .sheet(isPresented: $showImagePicker) {
            PHPickerView(image: $petPhoto)
        }
    }
}

struct AddPetView_Previews: PreviewProvider {
    static var previews: some View {
        AddPetView(showHome: .constant(false))
    }
}
