//
//  JsonPlaceHolderService.swift
//  Alamofire Example
//
//  Created by Burak AKCAN on 15.07.2022.
//

import Foundation
import Alamofire

let urlString = "https://jsonplaceholder.typicode.com/posts"
let url = URL(string: urlString)!
protocol JsonPlaceHolderProtocol{
    func fetchAll(onSucces:@escaping ([UsersModel])->Void, onFail:@escaping (String?)->Void)
}

struct JsonPlaceHolderService:JsonPlaceHolderProtocol{
    func fetchAll(onSucces:@escaping ([UsersModel]) -> (), onFail:@escaping (String?) -> ()) {
        AF.request(url, method: .get).validate().responseDecodable(of: [UsersModel].self) { (response) in
            guard let items = response.value else{
                onFail(response.debugDescription)
                return
            }
            onSucces(items)
        }
    }
    
    
}

enum JsonPlaceHolderPath:String{
    case POST = "/posts"
}
extension JsonPlaceHolderPath{
    func withBaseUrl()->String{
        return "https://jsonplaceholder.typicode.com\(self.rawValue)"
    }
}
