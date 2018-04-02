//
//  TanagerViewController.swift
//  Tanager
//
//  Created by Jonathan Arbogast on 3/10/18.
//  Copyright © 2018 Jonathan Arbogast. All rights reserved.
//

import Foundation
import CoreData
import UIKit

protocol TanagerViewController {
    var persistentContainer: NSPersistentContainer? { get set }
    var urlSession: URLSession? { get set }
    var workQueue: OperationQueue? { get set }
}
