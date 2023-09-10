import SwiftUI

@main
struct PawPo2App: App {
    
    @StateObject private var petViewModel = PetViewModel()
    @StateObject private var rootView = RootViewManager()
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .environmentObject(petViewModel)
                .environmentObject(rootView)
        }
    }
}
