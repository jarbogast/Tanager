//
//  GetAuthenticationCodeOperation.swift
//  Tanager
//
//  Created by Jonathan Arbogast on 3/6/18.
//  Copyright © 2018 Jonathan Arbogast. All rights reserved.
//

import UIKit
import SafariServices

class GetAuthenticationCodeOperation: Operation {
    var authCode: String?
    
    override func main() {
        let url = URL(string: "https://login.salesforce.com/services/oauth2/authorize?response_type=code&client_id=3MVG9uudbyLbNPZNRMfTgCTmwO54tEBrv8A0wUEXz_C_Cnmx8KHtz2EyqGDNCWjoN5OVJ0A0yoKteHDaJqUkV&redirect_uri=authentication://anothercupofcocoa.com")!
        let semaphore = DispatchSemaphore(value: 0)

        let authSession = SFAuthenticationSession(url: url, callbackURLScheme: "authentication") { (url, error) in
            let components = URLComponents(url: url!, resolvingAgainstBaseURL: true)
            self.authCode = components?.queryItems?.first?.value
            semaphore.signal()
        }
        authSession.start()
        semaphore.wait()
    }
}
