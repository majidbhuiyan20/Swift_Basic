import SwiftUI

struct HabitTracker: View {
    
    
    var body: some View {
        VStack {
            HStack{
                VStack(alignment: .leading){
                    Text("Yesterday")
//                        .font(.headline)
                        .font(.system(size: 24, weight: .bold))
                        
                    Text("100% Finished")
                        .font(.subheadline)
                        .foregroundColor(.green)
                }
                Spacer()
                Button {
                    print("Add tapped")
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Circle())
                }

            }
            .padding()
            Spacer()
            
        }
    }
}

#Preview {
    HabitTracker()
}

