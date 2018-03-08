//
//  ViewController.swift
//  Tanager
//
//  Created by Jonathan Arbogast on 3/3/18.
//  Copyright © 2018 Jonathan Arbogast. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    let urlSession = URLSession(configuration: .default)
    let workQueue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workQueue.isSuspended = false

        let operations = OperationFactory.getTabsOperationChain(urlSession: urlSession)
        workQueue.addOperations(operations, waitUntilFinished: false)
    }
}

