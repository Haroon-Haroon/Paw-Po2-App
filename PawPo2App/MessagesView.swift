import SwiftUI

struct MessagesView: View {
    @State private var showAddContact = false
    @State private var newContactEmail = ""
    @State private var newContactName = ""
    @State private var contacts: [Contact] = []

    var body: some View {
        NavigationView {
            VStack {
                List(contacts, id: \.id) { contact in
                    NavigationLink(destination: Text("Chat with \(contact.name)")) {
                        Text(contact.name)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showAddContact.toggle()
                        }) {
                            Image(systemName: "plus")
                        }
                        .sheet(isPresented: $showAddContact) {
                            AddContactView(
                                newContactEmail: $newContactEmail,
                                newContactName: $newContactName,
                                contacts: $contacts
                            )
                        }
                    }
                }
            }
            .navigationBarTitle("Messages")
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
