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
                        //Fetch Users Data from json placeholder api
                        NavigationStack{
                            NavigationLink(destination: UsersScreen()){
                                Text("User Data Api")
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(Color.white)
                                    .frame(maxWidth:.infinity)
                                    .cornerRadius(10)
                                
                            }.padding()
                            
                            
                        }
                        
                        //Swift Ui Screen navigation
                        
                        NavigationStack{
                            NavigationLink(destination: SwiftUIScreen()){
                                Text("SwiftUI Screen")
                                    .padding()
                                    .background(Color.myAccent)
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .cornerRadius(30)
                            }
                        }
                        
                        NavigationStack{
                            NavigationLink(destination: StudentView()){
                                Text("Student List")
                                    .padding()
                                    .background(Color.myAccent)
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                                    .cornerRadius(30)
                                
                            }
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


/**
 
 1️⃣ SwiftUI Core UI Development

 Views & View Composition

 Layout System (VStack, HStack, ZStack, GeometryReader)

 Custom Reusable Components

 Modifiers & Custom Modifiers

 NavigationStack & NavigationPath

 List & LazyVStack Optimization

 Form & Input Controls

 Sheet, FullScreenCover

 Alert & ConfirmationDialog

 Dark Mode Support

 Dynamic Type Support (Accessibility)

 Safe Area Handling

 Toolbar & TabView

 Custom Tab Bar

 Animations & Transitions

 MatchedGeometryEffect

 SF Symbols Usage

 🧠 2️⃣ State Management & Data Flow

 @State

 @Binding

 @StateObject

 @ObservedObject

 @EnvironmentObject

 @Published

 ObservableObject

 Data Flow in SwiftUI

 Two-way Binding

 View Lifecycle in SwiftUI

 MainActor

 AppStorage

 SceneStorage

 🏗 3️⃣ Architecture & Code Structure

 MVVM Architecture

 Clean Architecture (Basic)

 Dependency Injection

 Repository Pattern

 Service Layer Design

 Modular Folder Structure

 Separation of Concerns

 Reusable Networking Layer

 🌐 4️⃣ Networking & API Integration

 URLSession

 Async/Await

 Generic NetworkManager

 Codable & JSON Decoding

 Error Handling Strategy

 HTTP Methods (GET, POST, PUT, DELETE)

 Token-based Authentication

 Authorization Header Injection

 Refresh Token Flow

 API Response Wrapper (Generic Model)

 Multipart Upload

 Image Upload API

 Pagination Handling

 💾 5️⃣ Local Data & Persistence

 UserDefaults

 Keychain (Secure Token Storage)

 FileManager

 Local JSON Loading

 CoreData (Basic to Intermediate)

 SwiftData (iOS 17+)

 Offline Caching Strategy

 🔐 6️⃣ Authentication & Security

 Login / Register Flow

 JWT Token Handling

 Keychain Storage

 Biometric Authentication (Face ID / Touch ID)

 Secure API Calls

 Logout Flow

 Auto Logout on 401

 ⚡ 7️⃣ Concurrency & Performance

 async / await

 Task

 TaskGroup

 async let

 MainActor

 Structured Concurrency

 Background Tasks

 Memory Management

 Lazy Loading

 Image Caching

 Performance Optimization

 🎨 8️⃣ UI/UX Professional Topics

 Responsive Layout

 Adaptive Layout (iPhone / iPad)

 Accessibility (VoiceOver)

 Animations & Microinteractions

 Skeleton Loading

 Shimmer Effect

 Empty State Design

 Error State UI

 Pull to Refresh

 Swipe Actions

 📦 9️⃣ Advanced iOS Features

 Push Notifications

 Deep Linking

 App Lifecycle Management

 Background Modes

 Widgets

 Share Extension

 App Clips

 Universal Links

 🧪 🔟 Testing & Debugging

 Unit Testing

 UI Testing

 Debugging Tools

 Instruments

 Memory Leak Detection

 Logging System Design

 🚀 1️⃣1️⃣ Deployment & Production

 App Signing

 Certificates & Provisioning Profiles

 TestFlight

 App Store Submission

 App Versioning

 Build Configurations (Dev / Prod)

 Environment Handling

 CI/CD (Basic)


 */
