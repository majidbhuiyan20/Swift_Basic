import SwiftUI

struct HabitTracker: View {
    
    @State private var selectedDayIndex: Int? = nil
    @State private var selectedDateIndex: Int = 0
    
    let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    // Generate dates of current month
    
    private var currentMonthDates: [Int] {
        let calendar = Calendar.current    // correct spelling
        let date = Date()
        let range = calendar.range(of: .day, in: .month, for: date)!
        return Array(range)
    }
    private var currentWeekDates: [Int] {
           let calendar = Calendar.current
           let today = Date()
           let weekday = calendar.component(.weekday, from: today) // 1...7
           let startOffset = -((weekday - 1) % 7) // start Sunday
           let weekRange = startOffset..<(startOffset + 7)
           return weekRange.map { offset in
               calendar.component(.day, from: calendar.date(byAdding: .day, value: offset, to: today)!)
           }
       }
    
    
    
    var body: some View {
        VStack {
            HStack{
                VStack(alignment: .leading){
                    Text("Yesterday")
                    //                        .font(.headline)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                    
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
            .padding(.horizontal)
            
            //Spacer()
            
            Rectangle()
                .fill(Color.backgroundColor) // #222428
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .edgesIgnoringSafeArea(.bottom)
                .overlay(
                    VStack{
                        HStack{
                            ForEach(0..<days.count, id: \.self){
                                index in
                                Text(days[index])
                                    .foregroundColor(selectedDayIndex == index ? .white : .unselectedColor)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 12)
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        selectedDayIndex = index
                                    }
                                
                            }
                        }
                        .onAppear{
                            selectedDayIndex = Calendar.current.component(.weekday, from: Date()) - 1
                            selectedDateIndex = Calendar.current.component(.day, from: Date()) - 1
                        }
                        .foregroundColor(Color.mySecondary)
                        .frame(maxWidth: .infinity)
                        .padding()
                        
                        
                        //Mark: Dates of Current Month
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 10){
                                ForEach(currentMonthDates.indices, id: \.self){
                                    index in let day = currentMonthDates[index]
                                    Text("\(day)")
                                        .foregroundColor(selectedDateIndex == index ? .white : .gray)
                                        .padding(.horizontal, 16)
                                        .background(RoundedRectangle(cornerRadius: 10)
                                            .fill(selectedDateIndex == index ? Color.blue : Color.clear)
                                        )
                                        .contentShape(Rectangle())
                                        .onTapGesture {
                                            selectedDayIndex = index
                                        }
                                }
                            }
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(currentMonthDates.indices, id: \.self) { index in
                                    let date = currentMonthDates[index]
                                    
                                    Text("\(date)")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(selectedDayIndex == index ? .white : .gray)
                                        .frame(width: 40, height: 40)
                                        .background(
                                            Circle()
                                                .fill(selectedDayIndex == index ? Color.blue : Color.clear)
                                        )
                                        .onTapGesture {
                                            selectedDayIndex = index
                                        }
                                }
                                
                            }
                            .padding(.horizontal)
                        }


                        
                        
                        Spacer()
                    }
                    
                )
            
            
        }
        .navigationBarHidden(true)
        .background(Color.appBarBackgroundColor)
        
    }
    
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}



#Preview {
    HabitTracker()
}

