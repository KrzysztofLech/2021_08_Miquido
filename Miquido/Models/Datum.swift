//
//  Datum.swift
//  Miquido
//
//  Created by KL on 09/08/2021.
//

import Foundation

struct Datum: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case avatar
    }
    
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    let avatar: String
}
