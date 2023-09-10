import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State private var showNotificationsOptions = false
    @State private var selectedNotificationOption = "On"
    @State private var showLogoutConfirmation = false
    @EnvironmentObject private var rootView: RootViewManager

    var body: some View {
        Form {
            Section(header: Text("Appearance")) {
                Toggle(isOn: $isDarkMode) {
                    Text("Dark/Light Mode")
                }
            }

            Section(header: Text("Notifications")) {
                Button("Notifications") {
                    showNotificationsOptions.toggle()
                }
                if showNotificationsOptions {
                    Picker(selection: $selectedNotificationOption, label: Text("")) {
                        Text("On").tag("On")
                        Text("Off").tag("Off")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }

            Section {
                VStack {
                    Button(action: {
                        
                        showLogoutConfirmation = true
                    }) {
                        Text("Log Out")
                            .foregroundColor(.red)
                    }
                    .alert(isPresented: $showLogoutConfirmation) {
                        Alert(
                            title: Text("Log out"),
                            message: Text("Are you sure you want to log out?"),
                            primaryButton: .default(Text("Cancel")),
                            secondaryButton: .destructive(Text("Log Out"), action: {
                                rootView.switchToLoginSignupView()
                            })
                        )
                    }
                }
            }
        }
        .navigationBarTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
