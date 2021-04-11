//
//  mainView.swift
//  reservation_swiftUI
//
//  Created by 이수연 on 2020/06/04.
//  Copyright © 2020 이수연. All rights reserved.
//

import SwiftUI

struct mainView: View {
    @State var selected = "Home"
    var body: some View {
         
            NavigationView{
                
                
                VStack{
                    
                    if self.selected == "Home"{
                        Home()
                        }
                    else if self.selected == "Community"{
                    
                            ComView()}
                
                    else{
                       
                        MapContentView().edgesIgnoringSafeArea(.all)
                    }
                    
                    CustomTabView(selected: $selected)
                }
               // .navigationBarTitle("")
               // .navigationBarHidden(true)
               // .navigationBarBackButtonHidden(true)
                
            }
    }
}


struct CustomTabView : View {
    
    @Binding var selected : String
    
    var body : some View{
        
        HStack{
            
            ForEach(tabs,id: \.self){i in
                
                VStack(spacing: 10){
                    
                    Capsule()
                        .fill(Color.clear)
                        .frame(height: 5)
                        .overlay(
                    
                            Capsule().fill(self.selected == i ? Color("mintColor") : Color.clear).frame(width: 55, height: 5)
                         )
                    
                    Button(action: {
                        
                        self.selected = i
                        
                    }) {
                        
                        VStack{
                            
                            Image(i).renderingMode(.original).resizable().frame(width: 30, height: 30)
                            Text(i).foregroundColor(.black)
                        }
                    }
                }
            }
            
        }.padding(.horizontal)
    }
}


var tabs = ["Community","Home","GPS"]
