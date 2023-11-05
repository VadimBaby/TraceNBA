//
//  StreamMatchesViewModel_Tests.swift
//  TraceNBA_Tests
//
//  Created by Вадим Мартыненко on 02.11.2023.
//

import XCTest
@testable import TraceNBA
import Combine

final class StreamMatchesViewModel_Tests: XCTestCase {
    
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_StreamMatchesViewModel_getLiveMatches_shouldReturnListOfMatchModel() {
        let vm = StreamMatchesViewModel(manager: MockDataService<Int>())
        
        XCTAssertNil(vm.listLiveMatches)
        
        Task {
            let result = try await vm.getLiveMatches_Tests()
            
            await MainActor.run {
                XCTAssertGreaterThan(result.count, 0)
            }
        }
    }
    
    func test_StreamMatchesViewModel_getLiveMatches_shouldReturnBlankList() {
        let vm = StreamMatchesViewModel(manager: MockDataService<[String]>(data: []))
        
        XCTAssertNil(vm.listLiveMatches)
        
        Task {
            let result = try await vm.getLiveMatches_Tests()
            
            XCTAssertTrue(result.isEmpty)
        }
    }
    
    func test_StreamMatchesViewModel_getLiveMatches_shouldReturnBlankListWhenDataIsBad() {
        let vm = StreamMatchesViewModel(manager: MockDataService<[Int]>(data: [1, 2, 3]))
        
        Task {
            let result = try await vm.getLiveMatches_Tests()
            
            XCTAssertTrue(result.isEmpty)
        }
    }

    func test_StreamMatchesViewModel_getListLiveMatches_shouldSetlistLiveMatches() {
        let vm = StreamMatchesViewModel(manager: MockDataService<Int>())
        
        XCTAssertNil(vm.listLiveMatches)
        
        let expection = XCTestExpectation()
        
        vm.getListLiveMatches()
        
        vm.$listLiveMatches
            .sink(receiveValue: { newValue in
                guard let value = newValue else { return }

                XCTAssertFalse(value.isEmpty)

                expection.fulfill()
            })
            .store(in: &cancellables)

        wait(for: [expection], timeout: 5)
        
        cancellables.forEach{ $0.cancel() }
    }
    
    func test_StreamMatchesViewModel_getListLiveMatches_shouldSetlistLiveMatchesAsBlankWhenDataIsBad() {
        let vm = StreamMatchesViewModel(manager: MockDataService<[Int]>(data: [1, 2, 3]))
        
        XCTAssertNil(vm.listLiveMatches)
        
        let expection = XCTestExpectation()
        
        vm.getListLiveMatches()
        
        var initial: Bool = true
        
        vm.$listLiveMatches
            .sink(receiveValue: { newValue in
                guard !initial else {
                    initial = false
                    return
                }
                
                guard let value = newValue else { return }
                
                XCTAssertTrue(value.isEmpty)

                expection.fulfill()
            })
            .store(in: &cancellables)

        wait(for: [expection], timeout: 5)
        
        cancellables.forEach{ $0.cancel() }
    }
}
