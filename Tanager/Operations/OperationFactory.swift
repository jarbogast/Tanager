//
//  OperationFactory.swift
//  Tanager
//
//  Created by Jonathan Arbogast on 3/6/18.
//  Copyright © 2018 Jonathan Arbogast. All rights reserved.
//

import UIKit

class OperationFactory {
    static func getTabsOperationChain(urlSession: URLSession) -> [Operation] {
        let authCodeOperation = GetAuthenticationCodeOperation()
        let accessTokenOperation = GetAccessTokenOperation(urlSession: urlSession)
        let adapter = BlockOperation() { [unowned authCodeOperation, unowned accessTokenOperation] in
            accessTokenOperation.authCode = authCodeOperation.authCode
        }
        let tabsOperation = GetTabsOperation(urlSession: urlSession)
        let adapter2 = BlockOperation() { [unowned tabsOperation, unowned accessTokenOperation] in
            tabsOperation.instanceURL = accessTokenOperation.instanceURL
            tabsOperation.accessToken = accessTokenOperation.accessToken
        }
        
        adapter.addDependency(authCodeOperation)
        accessTokenOperation.addDependency(adapter)
        adapter2.addDependency(accessTokenOperation)
        tabsOperation.addDependency(adapter2)
        
        return [authCodeOperation, adapter, accessTokenOperation, adapter2, tabsOperation]
    }
}
