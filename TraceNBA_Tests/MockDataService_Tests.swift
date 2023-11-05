//
//  MockDataService_Tests.swift
//  TraceNBA_Tests
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import XCTest
@testable import TraceNBA

final class MockDataService_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_MockDataService_getLiveMatchesData_shouldReturnDataThatPassedIn() {
        let data: [Int] = [1, 2 ,3]
        
        let manager = MockDataService<[Int]>(data: data)
        
        do {
            let encodeData = try JSONEncoder().encode(data)
            
            Task {
                let dataFromManager = try await manager.getLiveMatchesData(isRefresh: false)
                
                XCTAssertEqual(dataFromManager, encodeData)
            }
        } catch {
            XCTFail()
        }
    }

    func test_MockDataService_getLiveMatchesData_shouldReturnAnotherData() {
        let manager = MockDataService<[Int]>(data: [1, 2 ,3])
        
        let data: [Int] = [1, 2 ,3, 4]
        
        do {
            let encodeData = try JSONEncoder().encode(data)
            
            Task {
                let dataFromManager = try await manager.getLiveMatchesData(isRefresh: false)
                
                XCTAssertNotEqual(dataFromManager, encodeData)
            }
        } catch {
            XCTFail()
        }
    }
}
