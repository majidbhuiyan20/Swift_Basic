import SwiftUI

struct SwiftUIScreen: View {
    var body: some View {
        VStack(){
            
            // AppBar Created done
            VStack(alignment:.leading){
                HStack(spacing: 16){
                    Image(systemName: "person.circle.fill",)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .padding(.top, 16)
                        .foregroundColor(.white)
                    VStack(alignment:.leading, spacing: -2){
                        Text("Majid Bhuiyan")
                            .font(.title2)
                            .foregroundColor(.white)
                        
                        Text("majid.bhuiyan2021@gmail")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Image(systemName: "bell.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)

                }
                Spacer()
            }.padding()
            .frame(maxWidth: .infinity, maxHeight: 70, alignment: .leading)
            .background(.blue)
            
            // AppBar Creation Done
            
            
            HStack{
                //Progress stack
                VStack{
                    Text("Progress")
                        .font(.title2)
                        .bold()
                    
                    ZStack{
                        Circle()
                            .stroke(Color.gray.opacity(0.3),lineWidth: 12)
                        
                        Circle()
                            .trim(from: 0.0, to: 0.7)
                            .stroke(Color.blue, lineWidth: 12)
                            .rotationEffect(.degrees(-90))
                            .animation(.easeInOut, value: 0.7)
                        
                        Text("70%")
                            .font(.title2)
                            .bold()
                    }.frame(width: 100, height: 100)
                }.padding(.vertical, 20)
                    .padding(.horizontal, 30)

                    .background(.white)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white, lineWidth: 2)
                    ).shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 4)
             
                
                
                
                Spacer()
                // Time and calories stack
                VStack(spacing:26){
                    CustomCard(
                        iconName: "alarm",
                        title: "Total Time",
                        time: "20 Min",
                        iconBgColor: .blue,
                        iconColor: .blue
                    )
                    
                    CustomCard(
                        iconName: "flame.fill",
                        title: "Calories",
                        time: "150 kcal",
                        iconBgColor: .red,
                        iconColor: .red
                    )

                    
                }
            }.padding()
                
            
            Spacer()
        }
        
    
    }
}

struct SwiftUI_Previews: PreviewProvider{
    static var previews: some View{
        SwiftUIScreen()
    }
}
