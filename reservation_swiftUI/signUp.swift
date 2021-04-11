//
//  signUp.swift
//  reservation_swiftUI
//
//  Created by 이수연 on 2020/06/05.
//  Copyright © 2020 이수연. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

struct signUp: View {
    @State var res = false
    @State var usr_id:String = ""
    @State var usr_pw:String = ""
    @State var usr_name:String = ""
    @State var usr_num:String = ""
    
    var body: some View {
        
        NavigationView{
            
          
            VStack{
                
                
                Text("회원가입").font(.system(size:32, weight: .heavy)).padding(.bottom, 50)
                    .padding(.top, 120)
                
            
                
                TextField(" 아이디를 입력하세요.",text:  $usr_id).font(.system(size: 14)).padding(12)
                   .frame(height: 30)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.leading, .trailing], 4)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("mintColor")))
                    .padding([.leading, .trailing], 24)
                    .padding(.bottom, 10)
                
                TextField(" 비밀번호를 입력하세요.",text:  $usr_pw).font(.system(size: 14)).padding(12)
                   .frame(height: 30)
                                .textFieldStyle(PlainTextFieldStyle())
                                .padding([.leading, .trailing], 4)
                                .cornerRadius(5)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("mintColor")))
                                .padding([.leading, .trailing], 24).padding(.bottom, 10)
              
                TextField(" 실명을 입력하세요.",text:  $usr_name).font(.system(size: 14)).padding(12)
                .frame(height: 30)
                                .textFieldStyle(PlainTextFieldStyle())
                                .padding([.leading, .trailing], 4)
                                .cornerRadius(5)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("mintColor")))
                                .padding([.leading, .trailing], 24).padding(.bottom, 10)
                
                
                TextField(" 전화번호를 입력하세요.",text:  $usr_num).font(.system(size: 14)).padding(12)
                .frame(height: 30)
                                .textFieldStyle(PlainTextFieldStyle())
                                .padding([.leading, .trailing], 4)
                                .cornerRadius(5)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("mintColor")))
                                .padding([.leading, .trailing], 24)
                
                
                
                HStack{
                    
                    Button(action:{sign_func(usr_id: self.usr_id, usr_pw: self.usr_pw, usr_name: self.usr_name, usr_num: self.usr_num)
            
                        
                    }){
                        Text("가입하기")
                           
                            .frame(width: 150 ,height: 40).foregroundColor(Color.white)
                            .font(.system(size:14, weight: .bold))
                        .background(LinearGradient(gradient: Gradient(colors: [Color("mintColor2"),Color("mintColor")]), startPoint: .leading, endPoint: .trailing))
                    }
               
           
            NavigationLink(destination: ContentView().navigationBarTitle("")
                .navigationBarHidden(true)){
                    Text("로그인페이지 이동") .frame(width:150, height: 40).foregroundColor(Color.white)
                                               .font(.system(size:14, weight: .bold))
                                               .background(LinearGradient(gradient: Gradient(colors: [Color("mintColor2"),Color("mintColor")]), startPoint: .leading, endPoint: .trailing))
            }
                
                }.padding(.all).padding(.top, 50)
            }.edgesIgnoringSafeArea(.all)
        }.edgesIgnoringSafeArea(.all)
        
    }

}





func sign_func(usr_id: String, usr_pw: String, usr_name:String, usr_num:String) {
let request =  NSMutableURLRequest(url: NSURL(string:"http://192.168.64.2/for_swift/practice.php")! as URL)
                  request.httpMethod = "POST"
                   
                   let postString = "a=\(usr_id) &b=\(usr_pw) &c=\(usr_name) &d=\(usr_num)"
                   request.httpBody = postString.data(using: String.Encoding.utf8, allowLossyConversion: true)
                   
                   let task = URLSession.shared.dataTask(with: request as URLRequest){
                       data, response, error in
                       
                       if error != nil {
                           print("erorr = \(String(describing: error))")
                           return
                       }
                       
                    let responseString = String(decoding: data! , as: UTF8.self)
                           
                      print("responseString = \(String(describing: responseString)) ")
                 
    }
    task.resume()
}
