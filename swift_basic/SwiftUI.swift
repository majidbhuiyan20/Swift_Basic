import SwiftUI

struct SwiftUIScreen: View {
    let imageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeRTw4l43rtDoc4oTRF1PS_eiWkSjxrlmhpQ&s"
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
            
           //======Image as textTitle and subTitle background
            ZStack(alignment: .bottomLeading){
                AsyncImage(url: URL(string: imageUrl)){
                    phase in if let image = phase.image{
                        image.resizable()
                            .scaledToFill()
                    }
                    else{
                        Color.gray.opacity(0.3)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 200)
                .clipped()
                .cornerRadius(16)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [.black.opacity(0.2), .clear]),
                        startPoint: .center,
                        endPoint: .top
                    )
                    .cornerRadius(16)
                )
                
                VStack(alignment:.leading){
                    Text("BODY COMBAT")
                        .font(.system(size: 32))
                        .bold()
                        .foregroundColor(.white)
                    Text("Beginner * 8-16 mins per day")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }.padding()

                
                
            }.padding(.horizontal, 16)

               
            
            HStack{
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
            
            Button(action:{
                print("Button Tapped")
            }){
                HStack(spacing: 16){
                    Image(systemName: "play.fill", ).bold()
                    Text("Start Day")
                        .font(.title2)
                        .bold()
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(25)
                
            }.padding(.horizontal, 20)
        
            VStack{
                Spacer().frame(height: 16)
                HStack(spacing: 10) {
                    Text("Coach's Chose")
                        .font(.system(size: 24))
                        .bold()

                    Image(systemName: "figure.strengthtraining.traditional")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)

            }
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    CategoryCard(
                        iconName: "heart.fill",
                        title: "Weight Loss",
                        iconBgColor: .blue,
                        iconColor: .blue
                    )
                    
                    CategoryCard(
                        iconName: "bolt.fill",
                        title: "Strength",
                        iconBgColor: .red,
                        iconColor: .red
                    )
                    
                    CategoryCard(
                        iconName: "flame.fill",
                        title: "Calories",
                        iconBgColor: .orange,
                        iconColor: .orange
                    )
                }
                .padding(.horizontal, 16)
            }





                
            
            Spacer()
            TabView {
                SecondView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                
                SecondView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                
                SecondView()
                    .tabItem {
                        Image(systemName: "chart.bar.fill")
                        Text("Statistics")
                    }
                
                SecondView()
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                        Text("Settings")
                    }
                
               
            }

        }.navigationBarBackButtonHidden(true)
        
    
    }
}

struct SwiftUI_Previews: PreviewProvider{
    static var previews: some View{
        SwiftUIScreen()
    }
}
