import SwiftUI

struct  LoginSignupView: View {
    @State private var isLogin = true
    @State private var email = ""
    @State private var password = ""
    @State private var reEnteredPassword = ""
    @State private var hasPet: Bool? = false
    @State private var passwordsMatchError = false

    var body: some View {
        NavigationStack {
            VStack {
                    Text(isLogin ? "Log In" : "Sign Up")
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom, 20)

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                if !isLogin {
                    SecureField("Re-enter Password", text: $reEnteredPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    if passwordsMatchError {
                        Text("Sorry, the passwords you entered don't match, please check again.")
                            .foregroundColor(.red)
                            .padding(.bottom)
                    }
                }
                }
                Button(action: {
                    hasPet = true
                }) {
                    NavigationLink(destination: PetQuestionView()){
                        Text(isLogin ? "Log In" : "Sign Up")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }

                Spacer()

                Button(action: {
                    isLogin.toggle()
                }) {
                    Text(isLogin ? "Don't have an account? Sign Up" : "Already have an account? Log In")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
            }
            .padding()
            .navigationBarTitle(isLogin ? "Log In" : "Sign Up")

            NavigationLink(destination: PetQuestionView()) {
                Button(" "){
                    hasPet = true
                }
            }
                .opacity(0)
        }
    }


struct LoginSignupView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSignupView()
    }
}
