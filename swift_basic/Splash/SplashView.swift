import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var animateLogo = false

    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
            
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)

                VStack(spacing: 30) {
                  
                    Image(systemName: "sparkles")
                        .font(.system(size: 80))
                        .foregroundColor(.white)
                        .scaleEffect(animateLogo ? 1.2 : 0.8)
                        .opacity(animateLogo ? 1 : 0.6)
                        .animation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true), value: animateLogo)

            
                    Text("My Swift Practice App")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)

            
                    Text("Experience the best UI ever")
                        .font(.system(size: 16))
                        .foregroundColor(.white.opacity(0.9))
                }
                .padding()
            }
            .onAppear {
                animateLogo = true

                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}
