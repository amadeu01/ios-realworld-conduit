//
//  PercistenceErros.swift
//  Conduit
//
//  Created by Amadeu Cavalcante Filho on 29/09/18.
//  Copyright © 2018 Amadeu Cavalcante Filho. All rights reserved.
//

import Foundation

enum PersistenceError: Error {
    case managedObjectContextNotFound
    case couldNotSaveObject
    case couldNotRemoveObject
    case objectNotFound
}
