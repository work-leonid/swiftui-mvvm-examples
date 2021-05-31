//
//  swiftui_mvvmTests.swift
//  swiftui-mvvmTests
//
//  Created by Kilo Loco on 12/22/20.
//

import XCTest
@testable import swiftui_mvvm

class MockDataService: DataService {
    func getUsers(completion: @escaping ([User]) -> Void) {
        completion([User(id: 1, name: "Kilo Loco")])
    }
    
    
}

class swiftui_mvvmTests: XCTestCase {
    
    var sut: UsersView.ViewModel!
    
    override func setUpWithError() throws {
//        sut = .init()
        sut = UsersView.ViewModel(dataService: MockDataService())
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_getUsers() throws {
        XCTAssertTrue(sut.users.isEmpty)
        
        sut.getUsers()
        
        XCTAssertEqual(sut.users.count, 1)
    }
    
}
