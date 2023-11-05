//
//  EventsViewModel_Tests.swift
//  TraceNBA_Tests
//
//  Created by Вадим Мартыненко on 05.11.2023.
//

import XCTest
@testable import TraceNBA
import Combine

final class EventsViewModel_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_EventsViewModel_asyncGetScheduleMatches_shouldSetScheduleMatches() {
        let viewModel = EventsViewModel(dataService: MockDataService<Data>())
        
        XCTAssertNil(viewModel.scheduleMatches)
        
        Task {
            await viewModel.asyncGetScheduleMatches(isRefresh: false)
            
            guard let scheduleMatches = viewModel.scheduleMatches else { XCTFail(); return }
            
            XCTAssertGreaterThan(scheduleMatches.count, 0)
        }
    }
    
    func test_EventsViewModel_asyncGetScheduleMatches_shouldSetScheduleMatchesAsBlankWhenDataIsBad() {
        let viewModel = EventsViewModel(dataService: MockDataService<[Int]>(data: [1, 2, 3]))
        
        var cancellables = Set<AnyCancellable>()
        
        XCTAssertNil(viewModel.scheduleMatches)
        
        let expection = XCTestExpectation()
        
        Task {
            await viewModel.asyncGetScheduleMatches(isRefresh: false)
        }
        
        viewModel.$scheduleMatches
            .sink { newValue in
                guard let scheduleMatches = newValue else { return }
                
                XCTAssertTrue(scheduleMatches.isEmpty)
                
                expection.fulfill()
            }
            .store(in: &cancellables)
        
        wait(for: [expection], timeout: 5)
        
        cancellables.forEach{ $0.cancel() }
    }
    
    func test_EventsViewModel_getScheduleMatches_shouldSetScheduleMatches() {
        let viewModel = EventsViewModel(dataService: MockDataService<Data>())
        
        var cancellables = Set<AnyCancellable>()
        
        XCTAssertNil(viewModel.scheduleMatches)
        
        let expection = XCTestExpectation()
        
        viewModel.getScheduleMatches(date: Date())
        
        viewModel.$scheduleMatches
            .sink { newValue in
                guard let value = newValue else { return }
                
                XCTAssertGreaterThan(value.count, 0)
                
                expection.fulfill()
            }
            .store(in: &cancellables)
        
        wait(for: [expection], timeout: 5)
        
        cancellables.forEach{ $0.cancel() }
    }
    
    func test_EventsViewModel_getScheduleMatches_shouldSetScheduleMatchesAsBlankWhenDataIsBad() {
        let viewModel = EventsViewModel(dataService: MockDataService<[Int]>(data: [1, 2, 3]))
        
        var cancellables = Set<AnyCancellable>()
        
        XCTAssertNil(viewModel.scheduleMatches)
        
        let expection = XCTestExpectation()
        
        viewModel.getScheduleMatches(date: Date())
        
        viewModel.$scheduleMatches
            .sink { newValue in
                
                guard let value = newValue else { return }
                
                XCTAssertTrue(value.isEmpty)
                
                expection.fulfill()
            }
            .store(in: &cancellables)
        
        wait(for: [expection], timeout: 5)
        
        cancellables.forEach{ $0.cancel() }
    }
    
    func test_EventsViewModel_asyncGetScheduleMatches_shouldDontSetScheduleMatchesWhenCannotRefreshThrowed() {
        let viewModel = EventsViewModel(dataService: MockDataService<[Int]>())
        
        XCTAssertNil(viewModel.scheduleMatches)
        
        Task {
            await viewModel.asyncGetScheduleMatches(isRefresh: true)
            
            XCTAssertNil(viewModel.scheduleMatches)
        }
    }
}
