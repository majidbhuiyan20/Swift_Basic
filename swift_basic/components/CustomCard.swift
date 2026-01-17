import SwiftUI
struct CustomCard: View {
    let iconName: String
    let title: String
    let time: String
    let iconBgColor: Color
    let iconColor: Color

    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(iconBgColor.opacity(0.2))
                    .frame(width: 50, height: 50)

                Image(systemName: iconName)
                    .font(.system(size: 22))
                    .foregroundColor(iconColor)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text(time)
                    .font(.headline)
                    .foregroundColor(.black)
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 16)
        .background(Color.white)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.white, lineWidth: 2)
        )
        .shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 4)
    }
}

