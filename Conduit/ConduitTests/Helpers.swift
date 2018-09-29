//
//  Helpers.swift
//  ConduitTests
//
//  Created by Amadeu Cavalcante Filho on 26/09/18.
//  Copyright © 2018 Amadeu Cavalcante Filho. All rights reserved.
//

import Foundation
@testable import Conduit

extension User {
    public static var Mock : User {
        return User(
            email: "mock01@gmail.com",
            username: "mock01",
            bio: "My mocked bio",
            token: "My mocked token",
            image: nil)
    }
    
    func newToken(token: String) -> User {
        return User(
            email: self.email,
            username: self.username,
            bio: self.bio,
            token: token,
            image: self.image
        )
    }
}

class MockUserRemoteDataManager: UserRemoteDataManagerProtocol {
    var getCurrentUserInvoked = false
    var registerInvoked = false
    var loginInvoked = false
    var updateUserInvoked = false

    var mockedUser: User!

    func getCurrentUser(onComplete: @escaping (User) -> Void) {
        getCurrentUserInvoked = true
        onComplete(mockedUser)
    }
    
    func login(email: String, password: String, onComplete: @escaping (User) -> Void) {
        loginInvoked = true
        onComplete(mockedUser)
    }
    
    func updateUser(user: User, onComplete: @escaping (User) -> Void) {
        updateUserInvoked = true
        onComplete(mockedUser)
    }

    func register(username: String, email: String,
                  password: String,
                  onComplete: @escaping (User) -> Void) {
        registerInvoked = true
        onComplete(mockedUser)
    }
}

class MockUserLocalDataManager: UserLocalDataManagerProtocol {
    var mockedUser: User?
    var mockedError: PersistenceError?
    
    var saveUserInvoked = false
    var getCurrentUserInvoked = false
    var removeCurrentUserInvoked = false
    
    var savedUser: User?
    var updatedUser: User?
    
    func saveUser(user: User, onComplete: @escaping (User?, PersistenceError?) -> Void) {
        saveUserInvoked = true
        savedUser = user
        onComplete(user, mockedError)
    }
    
    func getCurrentUser(onComplete: @escaping (User?, PersistenceError?) -> Void) {
        getCurrentUserInvoked = true
        onComplete(mockedUser, mockedError)
    }
    
    func removeCurrentUser(onComplete: @escaping (PersistenceError?) -> Void) {
        removeCurrentUserInvoked = true
        onComplete(mockedError)
    }
}
