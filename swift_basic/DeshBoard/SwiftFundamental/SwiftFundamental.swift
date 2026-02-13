//
//  SwiftFundamental.swift
//  swift_basic
//
//  Created by Majid Bhuiyan on 13/2/26.
//

import SwiftUI
struct SwiftFundamentalsView: View {
   @Environment(\.dismiss) var dismiss
    var body: some View {
        //Here Basic SwiftUI VStack and HStack
        
        VStack(){
            ZStack{
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 150)
                
                Image(systemName: "photo")
                    .font(.largeTitle)
            }
            HStack{
                Text("Product Name")
                    .font(.headline)
                
                Spacer()
                Text("$99")
                    .bold()
            }.padding()
            
            
            
            //Basic Geometry Reader
            GeometryReader{
                geo in VStack{
                    Text("Parent Width:\(geo.size.width)")
                    Text("Parent Height:\(geo.size.height)")
                    
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                dismiss()
                
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                }
            }
        }
        
    }
}

#Preview {
    SwiftFundamentalsView()
}
