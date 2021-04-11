//
//  Home_detail.swift
//  reservation_swiftUI
//
//  Created by 이수연 on 2020/06/05.
//  Copyright © 2020 이수연. All rights reserved.
//

import SwiftUI

struct Home_detail : View {
    
    @Binding var show : Bool
    @State var re_show = false
    @State var top = UIApplication.shared.windows.last?.safeAreaInsets.top
    @State var count = 0
  
    
    var body : some View{
        
        VStack(spacing: 10){
            
            HStack{
            Button(action: {self.show.toggle()
                                           
                                       }) {
                                           
                                           Image("Home").renderingMode(.original).resizable().frame(width: 30, height: 30)
            }
                Spacer()
                Image("title")
                .resizable()
                    .frame(width: 130, height: 40).padding(.top, 10)
                Spacer()
            }.padding(.horizontal, 20)
                            
                           
                            
        
                            
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading,spacing: 15){
                    
                    Image("우리동물병원").renderingMode(.original).resizable().frame(width: 380, height: 250)
                    
                    Text("우리동물병원").font(.title)
                    
                    Text("031-222-2222").foregroundColor(Color("mintColor"))
                    
                    Divider().padding(.vertical, 15)
                    
                    HStack{
                    HStack{
                                Text("4")
                                Image(systemName: "star.fill").foregroundColor(.yellow)
                    
                    }.padding()
                    .background(Color("mintColor"))
                    .cornerRadius(12)
                    
                    HStack(spacing: 20){
                        
                        Spacer(minLength: 12)
                        Button(action: {
                                                  
                                                  if self.count != 0{
                                                      
                                                      self.count -= 1
                                                  }
                                                  
                                              }) {
                                                  
                                                  Image(systemName: "minus.circle").font(.largeTitle)
                                                  
                                              }.foregroundColor(Color("mintColor"))
                    
                        Text("\(self.count)")
                        Button(action: {
                                                
                                                self.count += 1
                                            }) {
                                                
                                                Image(systemName: "plus.circle").font(.largeTitle)
                                                
                                            }.foregroundColor(Color("mintColor"))
                                            Spacer(minLength: 12)
                    }}
                }
                
                Button(action:{
                    withAnimation{
                        self.re_show.toggle()
                    }
                }){
                              Text("예약하기").foregroundColor(Color("mintColor"))
                                 .frame(width:200, height: 50)
                              .textFieldStyle(PlainTextFieldStyle())
    
                              .cornerRadius(5)
                              .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("mintColor")))
                }.padding(.top, 20)
                
                
                
                
            }.padding()
            .background(RoundedCorner().fill(Color.white))
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
            if self.re_show{
                GeometryReader{
                    _ in reservation(re_show: self.$re_show)
                }.background(Color("mintColor").opacity(0.25)).edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation{
                            self.re_show.toggle()
                        }
                }
            }
            
          
        }
    }
}

struct RoundedCorner : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}

