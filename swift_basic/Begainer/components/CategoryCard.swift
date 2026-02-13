import SwiftUI

struct CategoryCard: View {
    var iconName: String
    var title: String
    var iconBgColor: Color
    var iconColor: Color

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(iconBgColor.opacity(0.2))
                    .frame(width: 50, height: 50)

                Image(systemName: iconName)
                    .font(.system(size: 22))
                    .foregroundColor(iconColor)
            }

            Text(title)
                .font(.title3)
                .foregroundColor(.black)

            Spacer()
        }
        .padding()
        .frame(width: 210, height: 90)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(16)
        
    }
}
