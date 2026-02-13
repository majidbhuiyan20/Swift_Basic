//
//  StudentView.swift
//  swift_basic
//
//  Created by Majid Bhuiyan on 21/1/26.
//

import SwiftUI

struct StudentView: View {
    
    @State private var students: [Student] = []
    
    var body: some View {
        List(students) { student in
            VStack(alignment: .leading) {
                Text(student.name)
                    .font(.headline)
                Text("ID: \(student.id)")
                Text("School: \(student.school)")
            }
        }
        .onAppear {
            fetchStudents()
        }
    }
    
    func fetchStudents() {
        guard let url = URL(string: "http://127.0.0.1:8080/students") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error:", error.localizedDescription)
                return
            }

            guard let data = data else {
                print("No data found")
                return
            }

            do {
                let students = try JSONDecoder().decode([Student].self, from: data)
                DispatchQueue.main.async {
                    self.students = students
                }
            } catch {
                print("Decoding error:", error.localizedDescription)
            }
        }.resume()
    }
}

struct Student: Codable, Identifiable {
    let id: String
    let name: String
    let school: String

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
        case school = "School"
    }
}


#Preview {
    StudentView()
}

