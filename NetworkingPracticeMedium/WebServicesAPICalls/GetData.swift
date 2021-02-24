//
//  GetData.swift
//  NetworkingPracticeMedium
//
//  Created by MD Tanvir Alam on 24/2/21.
//

import Foundation
import Alamofire

class GetData{
    func getPosts(completion:@escaping ([DataModel]?)->()){
        
        guard  let url = URL(string:EndPointSouce.getEndPoint(type: .Base)+EndPointSouce.getEndPoint(type: .Posts)) else {
            fatalError("Invalid URL")
        }
        
        AF.request(url,method: .get).responseDecodable(of: [DataModel].self) { response in
                    
                    switch response.result {
                    case .success(let value):
                        
                        completion(value)
                        
                        break
                    case .failure(let error):
                        
                        print("Error in Alamofire: \(error)")
                        completion(nil)
                        
                        break
                    }
                    
        }
    }
}
