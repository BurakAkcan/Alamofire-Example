//
//  UserModel.swift
//  Alamofire Example
//
//  Created by Burak AKCAN on 15.07.2022.
//

import Foundation
struct UsersModel: Codable {
    let userId, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userId
        case id, title, body
    }
}
