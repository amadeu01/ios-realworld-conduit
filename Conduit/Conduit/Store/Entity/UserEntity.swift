//
//  UserEntity.swift
//  Conduit
//
//  Created by Amadeu Cavalcante Filho on 29/09/18.
//  Copyright © 2018 Amadeu Cavalcante Filho. All rights reserved.
//

struct User: Codable, Equatable {
    let email, username: String
    let bio: String?
    let token: String?
    let image: String?
    
    static func == (lhs: User, rhs: User) -> Bool {
        return
            lhs.username == rhs.username &&
                lhs.email == rhs.email &&
                lhs.bio == rhs.bio &&
                lhs.token == rhs.token &&
                lhs.image == rhs.image
    }
}
