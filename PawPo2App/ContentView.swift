import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var rootView: RootViewManager
    
    
    var body: some View {
        rootView.root
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RootViewManager())
    }
}
