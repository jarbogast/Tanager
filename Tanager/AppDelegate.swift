//
//  AppDelegate.swift
//  Tanager
//
//  Created by Jonathan Arbogast on 3/3/18.
//  Copyright © 2018 Jonathan Arbogast. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let persistentContainer = NSPersistentContainer(name: "Model")
    let urlSession = URLSession(configuration: .default)
    let workQueue = OperationQueue()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        configureViewController(viewController: (window?.rootViewController)!, container: persistentContainer, urlSession: urlSession, workQueue: workQueue)
        return true
    }

    func configureViewController(viewController : UIViewController, container: NSPersistentContainer, urlSession: URLSession, workQueue: OperationQueue) {        
        if let _ = viewController as? TanagerViewController {
            var tanagerViewController = viewController as! TanagerViewController
            tanagerViewController.persistentContainer = container
            tanagerViewController.urlSession = urlSession
            tanagerViewController.workQueue = workQueue
        }
        
        for childViewController in viewController.childViewControllers {
            configureViewController(viewController: childViewController, container: container, urlSession: urlSession, workQueue: workQueue)
        }
    }
}

