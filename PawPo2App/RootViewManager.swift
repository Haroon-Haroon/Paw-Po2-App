import SwiftUI

class RootViewManager: ObservableObject {
    @Published var root: AnyView = AnyView(LoginSignupView())
    
    func switchToLoginSignupView() {
        root = AnyView(LoginSignupView())
    }
    
    func switchToHomeView() {
        root = AnyView(HomeView())
    }
    
    func switchToMessagesView() {
        root = AnyView(MessagesView())
    }
}

struct RootViewManager_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RootViewManager())
    }
}
