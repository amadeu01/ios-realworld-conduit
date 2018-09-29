//
//  UserStoreContract.swift
//  Conduit
//
//  Created by Amadeu Cavalcante Filho on 25/09/18.
//  Copyright © 2018 Amadeu Cavalcante Filho. All rights reserved.
//

protocol UserRemoteDataManagerProtocol: class {
    func getCurrentUser(onComplete: @escaping (User) -> Void)
    func register(username: String,
                  email: String,
                  password: String,
                  onComplete: @escaping (User) -> Void)
    func login(email: String, password: String,
               onComplete: @escaping (User) -> Void)
    func updateUser(user: User, onComplete: @escaping (User) -> Void)
}

protocol UserLocalDataManagerProtocol: class {
    func saveUser(user: User, onComplete: @escaping (User?, PersistenceError?) -> Void)
    func getCurrentUser(onComplete: @escaping (User?, PersistenceError?) -> Void)
    func removeCurrentUser(onComplete: @escaping (PersistenceError?) -> Void)
}
