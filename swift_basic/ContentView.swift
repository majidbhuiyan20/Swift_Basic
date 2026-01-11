import SwiftUI

struct ContentView: View {
    
    @State private var count = 0
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()   // 👈 full screen background

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
                
                HStack{
                    Button(action:{
                        count = count - 1
                    }){
                        Text("-")
                            .font(.largeTitle)
                            .frame(width: 60, height: 60)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    
                    Button(action:{
                        count = count + 1
                    }){
                        Text("+")
                            .font(.largeTitle)
                            .frame(width: 60, height: 60)
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(10)
                        
                    }
                }
            }
        }
    }

}
    
#Preview {
    ContentView()
}
