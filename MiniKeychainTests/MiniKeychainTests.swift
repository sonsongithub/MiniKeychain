//
//  MiniKeychainTests.swift
//  MiniKeychainTests
//
//  Created by sonson on 2016/08/18.
//  Copyright © 2016年 sonson. All rights reserved.
//

import XCTest
@testable import MiniKeychain

class MiniKeychainTests: XCTestCase {
    var keychain: MiniKeychain!
    
    override func setUp() {
        super.setUp()
        keychain = MiniKeychain(service: "hoge")
        keychain.clear()
    }
    
    override func tearDown() {
        super.tearDown()
        keychain.clear()
    }
    
    func testExample() {
        let test_data = [
            ("account1", "password1"),
            ("account2", "password2"),
            ("account3", "password3")
        ]
        
        test_data.forEach { (account, password) in
            if let data = password.data(using: .utf8) {
                do {
                    try keychain.save(key: account, data: data)
                } catch {
                    XCTFail("Can not save password. \(error).")
                }
            } else {
                XCTFail("Can not create binary from password.")
            }
        }
    }
}