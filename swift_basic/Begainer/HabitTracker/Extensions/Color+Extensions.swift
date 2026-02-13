import SwiftUI
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        (r, g, b) = ((int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        self.init(
            red: Double(r)/255,
            green: Double(g)/255,
            blue: Double(b)/255
        )
    }
        
        static let appBarBackgroundColor = Color(hex: "#131216")
        static let backgroundColor = Color(hex: "#222428")
    
        static let selectedColor = Color(hex: "#4ECDC4")
        static let unselectedColor = Color(hex: "#555555")
    
        static let myPrimary = Color(hex: "#131216")
        static let mySecondary = Color(hex: "#FF6B6B")
        static let myBackground = Color(hex: "#F5F5F5")
        static let myAccent = Color(hex: "#4ECDC4")
        static let myText = Color(hex: "#333333")
        
}
