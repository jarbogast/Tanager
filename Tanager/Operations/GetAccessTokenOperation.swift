//
//  GetAccessTokenOperation.swift
//  Tanager
//
//  Created by Jonathan Arbogast on 3/6/18.
//  Copyright © 2018 Jonathan Arbogast. All rights reserved.
//

import UIKit

class GetAccessTokenOperation: Operation {
    var accessToken: String?
    var instanceURL: URL?
    var authCode: String?
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    override func main() {
        let tokenURL = URL(string: "https://login.salesforce.com/services/oauth2/token?grant_type=authorization_code&client_secret=8600123663449393289&client_id=3MVG9uudbyLbNPZNRMfTgCTmwO54tEBrv8A0wUEXz_C_Cnmx8KHtz2EyqGDNCWjoN5OVJ0A0yoKteHDaJqUkV&redirect_uri=authentication://anothercupofcocoa.com&code=" + authCode!)!
        var tokenRequest = URLRequest(url: tokenURL)
        tokenRequest.httpMethod = "POST"
        let semaphore = DispatchSemaphore(value: 0)

        let dataTask = urlSession.dataTask(with: tokenRequest.url!, completionHandler: { (data, response, error) in
            let responseJson = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String, String>
            self.accessToken = responseJson["access_token"]!
            self.instanceURL = URL(string: responseJson["instance_url"]!)
            semaphore.signal()
        })
        dataTask.resume()
        semaphore.wait()
    }
}
