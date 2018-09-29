//
//  UserStore.swift
//  Conduit
//
//  Created by Amadeu Cavalcante Filho on 25/09/18.
//  Copyright © 2018 Amadeu Cavalcante Filho. All rights reserved.
//

import UIKit
import Foundation



class UserStore {
    static let userDidChange = Notification.Name("userDidChange")
    static let userKey = "user"

    let remoteDataManager: UserRemoteDataManagerProtocol
    let localDataManager: UserLocalDataManagerProtocol

    init(remoteDataManager: UserRemoteDataManagerProtocol, localDataManager: UserLocalDataManagerProtocol) {
        self.remoteDataManager = remoteDataManager
        self.localDataManager = localDataManager
    }

    func register(username: String, email: String, password: String) {
        remoteDataManager.register(username: username, email: email, password: password) { (user: User) in
            self.localDataManager.saveUser(user: user) { (user: User?, error: PersistenceError?) in
                if let _ = error {
                    return
                }
                
                guard let user = user else {
                    return
                }
                
                self.postUserDidChange(with: user)
            }
        }
    }

    func getCurrentUser() {
        localDataManager.getCurrentUser { (user: User?, error: PersistenceError?)  in
            if let error = error {
                self.handleGetCurrentUser(with: error)
                return
            }
            
            guard let user = user else {
                return
            }
            
            self.postUserDidChange(with: user)
        }
    }
    
    func handleGetCurrentUser(with error: PersistenceError) {
        switch error {
        case .objectNotFound:
            remoteDataManager.getCurrentUser { (user: User) in
                self.postUserDidChange(with: user)
            }
            break
        default:
            print("Do something")
        }
    }
    
    fileprivate func postUserDidChange(with user: User) {
        NotificationCenter.default.post(name: UserStore.userDidChange,
                                        object: self,
                                        userInfo: [UserStore.userKey: user])
    }
}
