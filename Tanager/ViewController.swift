//
//  ViewController.swift
//  Tanager
//
//  Created by Jonathan Arbogast on 3/3/18.
//  Copyright © 2018 Jonathan Arbogast. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, TanagerViewController {

    var persistentContainer: NSPersistentContainer?
    var urlSession: URLSession?
    var workQueue: OperationQueue?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let operations = OperationFactory.getTabsOperationChain(urlSession: urlSession!)
        workQueue?.addOperations(operations, waitUntilFinished: false)
    }
}

