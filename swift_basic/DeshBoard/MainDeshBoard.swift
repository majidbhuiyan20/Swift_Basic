//
//  MainDeshBoard.swift
//  swift_basic
//
//  Created by MajidBhuiyan on 13/2/26.
//

import SwiftUI

import SwiftUI

struct Topic: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let color: Color
    let destination: AnyView
}




struct DashboardView: View {
    
    let topics: [Topic] = [
        Topic(title: "Play With Swift", icon: "swift", color: .red, destination: AnyView(ContentView())),
        Topic(title: "Swift Fundamentals", icon: "swift", color: .orange, destination: AnyView(SwiftFundamentalsView())),
        Topic(title: "SwiftUI", icon: "iphone", color: .blue, destination: AnyView(SwiftUIView())),
        Topic(title: "Networking", icon: "network", color: .green, destination: AnyView(NetworkingView())),

    ]
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(topics) { topic in
                        TopicCard(topic: topic)
                    }
                }
                .padding()
            }
            .navigationTitle("Dashboard")
        }
    }
}



struct TopicCard: View {
    let topic: Topic
    
    var body: some View {
        NavigationLink(destination: topic.destination) {
            VStack(spacing: 15) {
                Image(systemName: topic.icon)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                
                Text(topic.title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
            .frame(height: 150)
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(
                    colors: [topic.color.opacity(0.8), topic.color],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .cornerRadius(20)
            .shadow(color: topic.color.opacity(0.4), radius: 8, x: 0, y: 6)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct SwiftUIView: View {
    var body: some View {
        VStack {
            Text("SwiftUI Topics")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Layouts, Stacks, Views, Modifiers")
                .padding()
            Spacer()
        }
        .padding()
        .navigationTitle("SwiftUI")
    }
}

struct NetworkingView: View {
    var body: some View {
        VStack {
            Text("Networking")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("POST, GET, API Integration, JSON Parsing")
                .padding()
            Spacer()
        }
        .padding()
        .navigationTitle("Networking")
    }
}
