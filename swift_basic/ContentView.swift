import SwiftUI

struct ContentView: View {
    
    @State private var count = 0
    @State private var navigate = false
    @State private var navigateThird = false
    @State private var navigateHabitTracker = false

    var body: some View {
        NavigationStack { // 👈 Add this for navigation
            ZStack {
                Color.purple
                    .ignoresSafeArea()   // full screen background

                ScrollView(.vertical, showsIndicators: true) {
                    VStack(spacing: 20) {
                        Image("niagarafalls")
                            .resizable()
                            .cornerRadius(20)
                            .padding()
                            .aspectRatio(contentMode: .fit)
                        
                        Text("Placeholder")
                            .font(.largeTitle)
                        
                        Text("Counter App")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text("\(count)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        HStack(spacing: 20){
                            Button(action:{
                                count -= 1
                            }){
                                Text("-")
                                    .font(.largeTitle)
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.white)
                                    .background(Color.red)
                                    .cornerRadius(10)
                            }
                            
                            Button(action:{
                                count += 1
                            }){
                                Text("+")
                                    .font(.largeTitle)
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.white)
                                    .background(Color.green)
                                    .cornerRadius(10)
                            }
                        }
                        
                        //Habit Tracker Button add here
                        NavigationStack {
                            NavigationLink(destination: HabitTracker()) {
                                Text("Habit Tracker App")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                           .padding()
                        }
                        
                        
                        NavigationStack{
                            NavigationLink(destination: HabitTracker()){
                                Text("Habit Tracker")
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(Color.white)
                                    .frame(maxWidth: .infinity)
                                    .cornerRadius(10)
                            }
                            .padding()
                        }

                        
                        // Navigation Button
                        Button(action: {
                            navigate = true
                        }){
                            Text("Go To Second Screen")
                                .font(.headline)
                                .padding()
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        // Hidden NavigationLink
                        NavigationLink("", destination: SecondView(), isActive: $navigate)
                            .hidden()
                        
                        //Naivigation button is end here
                        
                        Button("Go to third Screen"){navigateThird = true}
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .cornerRadius(20)
                        
                        NavigationLink("", destination: ThirdView(), isActive: $navigateThird)
                        
                        HStack(spacing: 20){
                            //Home Button Start Here
                            Button("Home"){
                                print("This is Home button")
                            }
                            .buttonStyle(.borderedProminent)
                            
                            //Home Button end here
                            
                            Button("Settings"){
                                print("This is Settings button")
                            }
                            .buttonStyle(.borderedProminent)
                            
                            //Settings button end here
                            
                            Button("Profile"){
                                print("This is Profile Button")
                            }
                            .buttonStyle(.borderedProminent)
                            //Profile button end here
                            
                            Button("Logout"){
                                print("This is Logout button")
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.red)
                            
                            
                        }
                        Button(action: {
                            print("Gradient button tapped")
                        }) {
                            Text("Gradient Button")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                    LinearGradient(
                                        colors: [Color.purple, Color.blue],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .cornerRadius(12)
                                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 5)
                        }
                        .padding()
                        VStack(spacing: 20) {
                            Button("1") { }
                            Button("2") { }
                            Button("3") { }
                            Button("4") { }
                            Button("5") { }
                            Button("6") { }
                        }
                        
                        HStack{
                            Button("Button1"){
                                print("Button is Pressed")
                            }.buttonStyle(.borderedProminent)
                            
                            Button("Button2"){
                                print("Button is Pressed")
                            }.buttonStyle(.borderedProminent)
                        }
                        
                        VStack{
                            Text("Hello SwiftUI")
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing: 12){
                                    Button("Click Me"){
                                        
                                    }.buttonStyle(.borderedProminent)
                                    Button("Click Me"){
                                        
                                    }.buttonStyle(.borderedProminent)
                                    Button("Click Me"){
                                        
                                    }.buttonStyle(.borderedProminent)
                                    Button("Click Me"){
                                        
                                    }.buttonStyle(.borderedProminent)
                                }
                            }
                            
                        }
                        .frame(width: 350, height: 200)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                    
                    }
                }
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    //Button(action:{print("Menu is Tapped")}){}
                    Image(systemName: "line.horizontal.3")
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack(){
                        Image(systemName: "magnifyingglass")
                        Spacer().frame(width: 16)
                        Image(systemName: "person.circle")
                    }.padding()
                    
                }
            }
        }
        
    }
}




#Preview {
    ContentView()
}
