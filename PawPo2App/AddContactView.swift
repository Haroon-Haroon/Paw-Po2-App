import SwiftUI

struct Contact: Identifiable {
    let id = UUID()
    var name: String
}

struct AddContactView: View {
    @Binding var newContactEmail: String
    @Binding var newContactName: String
    @Binding var contacts: [Contact]
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Add Contact")) {
                    TextField("Email", text: $newContactEmail)
                    TextField("Name", text: $newContactName)
                }

                Button("Add Contact") {
                    contacts.append(Contact(name: newContactName))
                    newContactEmail = ""
                    newContactName = ""
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationBarTitle("Add Contact")
        }
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView(
            newContactEmail: .constant(""),
            newContactName: .constant(""),
            contacts: .constant([])
        )
    }
}
