//
//  Home.swift
//  reservation_swiftUI
//
//  Created by 이수연 on 2020/06/05.
//  Copyright © 2020 이수연. All rights reserved.
//

import SwiftUI

struct Home : View {
    
    @State var txt = ""
    @State var profile = false
    @State var search  = ""
    @State var search_show = false
    var names = [ "우리동물병원","나리동물병원","사랑동물병원","우정동물병원","별동물병원"]
    
    var body : some View{
        
        VStack(){
            HStack{
             
                Image("title").renderingMode(.original).resizable().frame(width: 130, height: 40)
                    Spacer()
                Button(action:{
                    self.profile.toggle()
                }){
                    Image(systemName: "person.fill").foregroundColor(Color("mintColor")).padding(.trailing)
                }
            }.padding(.top, 40)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 15){
                    
                    HStack(spacing: 15){
                        
                        HStack{
        
                            TextField("동물병원 검색하기", text: $txt).padding(.horizontal).padding(.top, 20)
                                .padding(.bottom, 5)
                            Spacer()
                            Image(systemName: "magnifyingglass").font(.body)
                                .foregroundColor(Color("mintColor"))
                            
                        }.padding(10)
                        .background(Color("grayColor"))
                        .cornerRadius(20)
                        
                    }
                    
        //
                    if self.txt != ""{
                                          
                        if self.names.filter({$0.lowercased().contains(self.txt.lowercased())}).count == 0{
                                              
                                              Text("검색결과가 없습니다.").padding(.top, 10)
                                          }
                                          else{
                                              
                            ForEach (self.names.filter({$0.lowercased().contains(self.txt.lowercased())}),id: \.self){i in
                                            VStack(spacing: 10){
                                                          
                                                          Image("\(i)").resizable().frame(width: 300, height: 180)
                                                          Text("\(i)").font(.system(size: 16, weight: .light))
                                                          
                                                          
                                                      }
                                             
                                          }
                        }
                    }
                                      
                                      else{

                                        HomeBottomView()
                                          }
                    
                    
                    
                }
            }
            
            }.padding(.horizontal).navigationBarTitle("").navigationBarHidden(true)
}
}

struct HomeBottomView : View {
    var body:some View{
        VStack(spacing: 15){
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 15){
                    
                    ForEach(ads_info){i in
                        
                        adsView(data: i)
                    }
                }
            }

            HStack(spacing: 15){

                Text("병원 목록").font(.system(size: 17, weight: .medium)).foregroundColor(Color("mintColor"))
                
                Spacer()
                
            }.padding(.vertical, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 15){
                    
                    ForEach(info){i in
                        
                        HospitalView(data: i)
                    }
                }
            }
            
        }
    }
}

struct HospitalView : View {
    
    var data: hospitals
    @State var show = false
    var body : some View{
        
   
        ZStack{
            
            NavigationLink(destination: Home_detail(show: self.$show), isActive: self.$show) {
                
                Text("")
            }
            
            VStack(spacing: 10){
                
                Image(data.image).resizable().frame(width: 180, height: 180)
                Text(data.name).font(.system(size: 16, weight: .light))
                
                
            }.onTapGesture {
                
                self.show.toggle()
            }
            
        }
    }
}

struct adsView: View {
    
    var data : ads
    
    var body: some View{
        Button(action: {
            guard let web_url = URL(string: self.data.url),
                UIApplication.shared.canOpenURL(web_url) else {
                return
            }
            UIApplication.shared.open(web_url,
                                      options: [:],
                                      completionHandler: nil)
        }) {
            Image(data.image).renderingMode(.original)
               .resizable()
               .frame(width: 380,
                      height: 200)
               
           }
    }
}

struct ads: Identifiable {
    var id: Int
    var image:String
    var url:String
}

struct  hospitals: Identifiable {
    var id: Int
    var name : String
    var image : String
    var location: String
}

var ads_info = [
    ads(id:0, image: "ad1" , url:"https://www.google.com/" ),
    ads(id:1, image: "ad2" , url:"https://www.mamacat.co.kr/product/list.html?cate_no=4326"),
    ads(id:2, image: "ad3", url: "https://www.mamacat.co.kr/product/list.html?cate_no=4242"),
    ads(id:3, image: "ad4", url: "https://www.google.com/"),
    ads(id:4, image: "ad5", url: "https://www.google.com/")
]

var info = [
    hospitals(id: 0, name: "우리동물병원", image: "우리동물병원", location: "하동"),
    hospitals(id: 1, name: "나리동물병원", image: "나리동물병원", location: "하동"),
hospitals(id: 2, name: "사랑동물병원", image: "사랑동물병원", location: "하동"),
hospitals(id: 3, name: "우정동물병원", image: "우정동물병원", location: "하동"),
hospitals(id: 4, name: "별동물병원", image: "별동물병원", location: "하동")
]
    

