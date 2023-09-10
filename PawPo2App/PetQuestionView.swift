import SwiftUI

struct PetQuestionView: View {
    @State private var hasPet = false
    @State private var showRegistrationComplete = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Do you have a pet?")
                    .font(.title)
                    .padding(.bottom, 20)
                
                NavigationLink(destination: PetDetailsView()) {
                    Button("Yes") {
                        hasPet = true
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                NavigationLink(destination: HomeView()) {
                    Button("No") {
                        showRegistrationComplete = true
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            .padding()
            
            
        }
    }
}

struct PetQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        PetQuestionView()
    }
}
