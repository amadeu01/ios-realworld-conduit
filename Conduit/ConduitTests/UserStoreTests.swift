//
//  UserStoreTests.swift
//  ConduitTests
//
//  Created by Amadeu Cavalcante Filho on 24/09/18.
//  Copyright © 2018 Amadeu Cavalcante Filho. All rights reserved.
//

import XCTest
@testable import Conduit

class UserStoreTests: XCTestCase {

    fileprivate var store: UserStore!

    fileprivate let remoteDataManager = MockUserRemoteDataManager()
    fileprivate let localDataManager = MockUserLocalDataManager()
    fileprivate var userObserved: User?

    override func setUp() {
        super.setUp()
        store = UserStore(remoteDataManager: remoteDataManager, localDataManager: localDataManager)
        NotificationCenter.default.addObserver(
        forName: UserStore.userDidChange, object: nil, queue: nil) { [weak self] (note) in
            self?.userObserved = note.userInfo?[UserStore.userKey] as? User
        }

    }

    override func tearDown() {
        store = nil
        super.tearDown()
    }

    func testRegisterUser() {
        let expectedUser = User.Mock
        remoteDataManager.mockedUser = expectedUser
        
        store.register(username: "amadeu01",
                       email: "amadeu01@gmail.com",
                       password: "password")

        XCTAssertTrue(remoteDataManager.registerInvoked)
        XCTAssertTrue(localDataManager.saveUserInvoked)
        XCTAssertEqual(userObserved!, localDataManager.savedUser!)
        XCTAssertEqual(userObserved!, expectedUser)
    }

    func testGetCurrentUserWhenExistLocally() {
        let expectedUser = User.Mock

        localDataManager.mockedUser = expectedUser
        
        store.getCurrentUser()

        XCTAssertFalse(remoteDataManager.getCurrentUserInvoked)
        XCTAssertTrue(localDataManager.getCurrentUserInvoked)
        XCTAssertEqual(userObserved!, expectedUser)
    }
    
    func testGetCurrentUserWhenDoesNotExistLocally() {
        let expectedUser = User.Mock
        
        localDataManager.mockedUser = nil
        localDataManager.mockedError = PersistenceError.objectNotFound
        remoteDataManager.mockedUser = expectedUser
        
        store.getCurrentUser()
        
        XCTAssertTrue(remoteDataManager.getCurrentUserInvoked)
        XCTAssertTrue(localDataManager.getCurrentUserInvoked)
        XCTAssertEqual(userObserved!, expectedUser)
    }
}
