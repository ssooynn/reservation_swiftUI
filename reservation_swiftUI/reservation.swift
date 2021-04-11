//
//  reservation.swift
//  reservation_swiftUI
//
//  Created by 이수연 on 2020/06/18.
//  Copyright © 2020 이수연. All rights reserved.
//

import SwiftUI

struct reservation: View {

    @Binding var re_show: Bool
    @State var date = Date()
    @State var time = Date()
    
    var body: some View {
     
        
        VStack{
         
            if re_show{
                Form{
            DatePicker(selection: $date, displayedComponents: .date){
                Text("날짜를 선택해주세요")
            }
            DatePicker(selection: $time, displayedComponents: .hourAndMinute){
                Text("시간을 선택해주세요")
            }
                }
            
            Button(action: {
                
            }){
                Text("예약하기").font(.system(size: 18)).foregroundColor(Color.black)
                   .frame(width:125, height: 50)
                .textFieldStyle(PlainTextFieldStyle())
                //.padding([.leading, .trailing], 4)
                .cornerRadius(5)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("mintColor")))
                //.padding([.leading, .trailing], 24)
                .padding(.bottom, 10)
            }
        }
        }
    }
}

