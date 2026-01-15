import Foundation

class APIService{
    static let shared = APIService()
    
    func fetchUsers(completion: @escaping ([User]?)-> Void){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users")else{
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url){
            data, response, error in if let error = error{
                print("Error fetching users: \(error)")
                completion(nil)
                return
            }
            guard let data = data else{
                print("No data Received")
                completion(nil)
                return
            }
            do {
                let users = try JSONDecoder().decode([User].self, from:data)
                completion(users)
            }
            catch{
                print("Error decoding JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
