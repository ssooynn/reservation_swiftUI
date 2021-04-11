//
//  ComView.swift
//  reservation_swiftUI
//
//  Created by 이수연 on 2020/06/17.
//  Copyright © 2020 이수연. All rights reserved.
//

import SwiftUI
import CoreData




struct ComView : View {
    
    @ObservedObject var observedData = obsevable()
    @State var user = ""
    
    var body: some View{
        
        
        NavigationView{
            
            VStack{
                    
                    List{
                        
                        ForEach(observedData.data){i in
                            
                            Text(i.user)
                        }.onDelete { (indexset) in
                            
                            self.observedData.deleteData(indexset: indexset, id: self.observedData.data[indexset.first!].id)
                        }
                }.navigationBarTitle("게시판")
                    
                    HStack{
                        
                        TextField("내용", text: $user).textFieldStyle(RoundedBorderTextFieldStyle())
                        Button(action: {
                            
                            print(self.user)
                            self.observedData.addData(user: self.user)
                            self.user = ""
                            
                        }) {
                            
                            Text("추가하기")
                        }
                    }.padding()
            }
        }

    }
}

class obsevable : ObservableObject{
    
    @Published var data = [datatype]()
    
    init() {
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        do{
            
            let res = try context.fetch(req)
            
            for i in res as! [NSManagedObject]{
                
                self.data.append(datatype(id: i.objectID, user: i.value(forKey: "user") as! String))
            }
        }
        catch{
            
            print("error")
        }
    }

    func addData(user : String){
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        entity.setValue(user, forKey: "user")
        
        do{
            
            try context.save()
            print("sucess")
            
            data.append(datatype(id: entity.objectID, user: user))
        }
        catch{
            print(error.localizedDescription)
        }
        
    }
    
    
    func deleteData(indexset : IndexSet,id : NSManagedObjectID){
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        do{
            
            let res = try context.fetch(req)
            
            for i in res as! [NSManagedObject]{
                
                if i.objectID == id{
                    
                    try context.execute(NSBatchDeleteRequest(objectIDs: [id]))
                    self.data.remove(atOffsets: indexset)
                }
            }
        }
        catch{
            
            print("error")
        }
    }
    
        
}

struct datatype : Identifiable {
    
    var id : NSManagedObjectID
    var user : String
}


 
     
