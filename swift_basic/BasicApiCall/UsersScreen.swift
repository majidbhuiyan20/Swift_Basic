
import SwiftUI

struct UsersScreen: View {
    @State private var users: [User] = []
    
    var body: some View {
        NavigationView {
            List(users) { user in
                VStack(alignment: .leading) {
                    Text(user.name).font(.headline)
                    Text(user.email).font(.subheadline).foregroundColor(.gray)
                    
                    HStack{
                        Text(user.phone)
                        Spacer()
                        Text(user.website)
                    }
                }
            }
            .navigationTitle("Users")
            .onAppear {
                APIService.shared.fetchUsers { fetchedUsers in
                    if let fetchedUsers = fetchedUsers {
                        DispatchQueue.main.async {
                            self.users = fetchedUsers
                        }
                    }
                }
            }
        }
    }
}
