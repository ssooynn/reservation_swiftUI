//
//  ContentView.swift
//  reservation_swiftUI
//
//  Created by 이수연 on 2020/06/03.
//  Copyright © 2020 이수연. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var usr_id:String = ""
    @State var usr_pw:String = ""
    var body: some View {
        NavigationView{
        
        VStack{Image("title").resizable().frame(width:180, height: 50)
            Text("좀 더 쉬운 동물병원 예약").font(.system(size:13, weight: .medium)).foregroundColor(Color("gray"))
                .padding(.bottom, 30)
            
            VStack{   Text("ID")
            TextField(" id",text:  $usr_id).font(.system(size: 14))
                .frame(width:250, height: 40)
             .textFieldStyle(PlainTextFieldStyle())
             .padding([.leading, .trailing], 4)
             .cornerRadius(5)
             .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("mintColor")))
             .padding([.leading, .trailing], 24)
             .padding(.bottom, 10)
            
                Text(" password")
            TextField("password",text: $usr_pw).font(.system(size: 14))
                .frame(width:250, height: 40)
             .textFieldStyle(PlainTextFieldStyle())
             .padding([.leading, .trailing], 4)
             .cornerRadius(5)
             .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("mintColor")))
             .padding([.leading, .trailing], 24)
             .padding(.bottom, 10)
            }
            HStack{
                
            Button(action:{
                login_func(usr_id: self.usr_id, usr_pw: self.usr_pw)
            
            }){
                Text("로그인").font(.system(size: 18)).foregroundColor(Color("mintColor"))
                   .frame(width:125, height: 50)
                .textFieldStyle(PlainTextFieldStyle())
                //.padding([.leading, .trailing], 4)
                .cornerRadius(5)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("mintColor")))
                //.padding([.leading, .trailing], 24)
                    .padding(.bottom, 10)
                
                }
                
                
                NavigationLink(destination: signUp().navigationBarTitle("")
                .navigationBarHidden(true)){
                    Text("회원가입").font(.system(size: 18)).foregroundColor(Color.black)
                       .frame(width:125, height: 50)
                    .textFieldStyle(PlainTextFieldStyle())
                    //.padding([.leading, .trailing], 4)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("mintColor")))
                    //.padding([.leading, .trailing], 24)
                    .padding(.bottom, 10)
                }
            }.padding(.top, 40)
            
            
           
            NavigationLink(destination: mainView().navigationBarTitle("")
                .navigationBarHidden(true)){
                Text("로그인없이 시작하기").font(.system(size: 14))
                    .frame(width:250, height: 30).foregroundColor(Color.black)
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.leading, .trailing], 4)
                .cornerRadius(5)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("mintColor")))
                .padding([.leading, .trailing], 24)
                .padding(.bottom, 10)
                }.padding(.top, 10).navigationBarHidden(true)
            
            
        }//.edgesIgnoringSafeArea(.all)
        }}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


func login_func(usr_id: String, usr_pw:String){
    
    let decoder = JSONDecoder()
    let request =  NSMutableURLRequest(url: NSURL(string:"http://192.168.64.2/for_swift/login.php")! as URL)
                       request.httpMethod = "POST"
    
                   let postString = "a=\(usr_id) &b=\(usr_pw)"
                   request.httpBody = postString.data(using: String.Encoding.utf8)
                   
                   let task = URLSession.shared.dataTask(with: request as URLRequest){
                       data, response, error in
                       
                       if error != nil {
                           print("erorr = \(String(describing: error))")
                           return
                       }//에러
                    
                      let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)

                    
                            print("responseString = \(String(describing: responseString)) ")
                    
                    let users: String = responseString! as String
                    
                     print("\(responseString!)")
                    print("\(users)")
                    
                    let data = users.data(using: .utf8)
                    
                  
                    if let data = data, let members = try? decoder.decode(person.self, from: data){
                    
                        print("\(members.ID)")
                        print("\(members.PW)")
                    }
                    
                   }
    
    task.resume()
   
}

struct person: Codable{
    var ID : String
    var PW : String
}
