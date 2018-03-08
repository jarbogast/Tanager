//
//  GetTabsOperation.swift
//  Tanager
//
//  Created by Jonathan Arbogast on 3/6/18.
//  Copyright © 2018 Jonathan Arbogast. All rights reserved.
//

import UIKit

class GetTabsOperation: Operation {
    private let urlSession: URLSession
    var accessToken: String?
    var instanceURL: URL?
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    override func main() {
        let tabsURL = URL(string: "services/data/v42.0/tabs", relativeTo: instanceURL)!
        var tabsRequest = URLRequest(url: tabsURL)
        tabsRequest.addValue("Bearer " + accessToken!, forHTTPHeaderField: "Authorization")
        
        let semaphore = DispatchSemaphore(value: 0)
        let tabsTask = urlSession.dataTask(with: tabsRequest, completionHandler: { (tabsData, tabsResponse, tabsError) in
            let tabsJson = try! JSONSerialization.jsonObject(with: tabsData!, options: .allowFragments)
            print(tabsJson)
            semaphore.signal()
        })
        tabsTask.resume()
        semaphore.wait()
    }
}
