//
//  DataModel.swift
//  NetworkingPracticeMedium
//
//  Created by MD Tanvir Alam on 24/2/21.
//

import Foundation

struct DataModel:Codable {

    let userId : Int
    let id : Int
    let title: String
    let body: String
      
}

class ModifiedDataModel{
    var datas:DataModel
    init(datas:DataModel){
        self.datas = datas
    }
    
    var title:String {
        return self.datas.title + "Modified"
    }
    
    var body:String {
        return self.datas.body + "Modified"
    }
}
