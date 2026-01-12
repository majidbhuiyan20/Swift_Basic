import SwiftUI

struct HabitTracker: View {
    
    @State private var count = 0
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Hello, SwiftUI 👋")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Button clicked: \(count) times")
                .font(.headline)
            
            Button("Click Me") {
                count += 1
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

