//
//  ScoreViewModelTests.swift
//  DemoAppTests
//
//  Created by Vishwas Mukund on 20/11/22.
//

import XCTest
import CreditScoreSDK

final class ScoreViewModelTests: XCTestCase {
    var viewModel: ScoreViewModel!
    let initViewModel = InitlizerViewModel()
    
    override func setUpWithError() throws {
        guard let data = ScoreViewInitilizer.openJsonFile(fileName: "scoreData"), let scoreData = initViewModel.parseData(with: data) else { return }
        
        viewModel = ScoreViewModel(with: scoreData)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetPercentage() {
        let percentage = viewModel.getPercentage()
    
        XCTAssertGreaterThanOrEqual(percentage, 0)
        XCTAssertLessThanOrEqual(percentage, 100)
    }
    
    func testGetFormattedDateString() {
        guard let data = ScoreViewInitilizer.openJsonFile(fileName: "scoreDataDifferentDate"), let scoreData = initViewModel.parseData(with: data) else { return }
        
        let viewModel = ScoreViewModel(with: scoreData)
        let formattedString = viewModel.getFormattedDateString()
        
        let testString = "As of 16/02/2022"
        XCTAssertEqual(formattedString, testString)
    }
    
    func testScoreInRange() {
        let range1 = viewModel.getRangeWith(score: 301)
        XCTAssertEqual(range1, RangeType.poor)
        
        let range2 = viewModel.getRangeWith(score: 720)
        XCTAssertEqual(range2, RangeType.belowAverage)
        
        let range3 = viewModel.getRangeWith(score: 780)
        XCTAssertEqual(range3, RangeType.average)
        
        let range4 = viewModel.getRangeWith(score: 816)
        XCTAssertEqual(range4, RangeType.good)
        
        let range5 = viewModel.getRangeWith(score: 864)
        XCTAssertEqual(range5, RangeType.excellent)
        
        let range6 = viewModel.getRangeWith(score: 200)
        XCTAssertEqual(range6, RangeType.poor)
    }
}
