

import Foundation
import XCTest
import Quick
import Nimble

@testable import NerverSitUpTest

class MainPagePresenterTests: QuickSpec {

    override func spec() {

        describe("MainPagePresenterTests") {
            var presenter: MainPagePresenter!
            var viewController: MainPageMockViewController!
            beforeEach {
                presenter = MainPagePresenter()
                viewController = MainPageMockViewController()
                presenter.viewController = viewController
            }
            
            context("Call Presenter Get Coin "){
                it("Sucess") {
                    presenter.presentGetCoin(response: MainPage.FetchCoin.Response.init(result: .success(GetCoinsViewModel(time: GetCoinsViewModel.Time(updated: "Value", updatedISO: "Value", updateduk: "Value"), disclaimer: "Value", chartName: "Value", bpi: GetCoinsViewModel.Bpi.init(usd: GetCoinsViewModel.MoneyType(code: "USD", symbol: "USD", rate: "USD", eurDescription: "USD", rateFloat: 30.00), gbp: GetCoinsViewModel.MoneyType.init(code: "GBP", symbol: "GBP", rate: "GBP", eurDescription: "GBP", rateFloat: 60.00), eur: GetCoinsViewModel.MoneyType(code: "EUR", symbol: "EUR", rate: "EUR", eurDescription: "EUR", rateFloat: 120.00))))))
                    expect(viewController.coinSucessValue) != nil
                }
                
                it(" Not Sucess") {
                    presenter.presentGetCoin(response: .init(result: .failure(.init(status: "200", code: "Error", message: "Error"))))
                    expect(viewController.coinFailValue) != nil
                }
            }

        }

    }

}

class MainPageMockViewController: MainPageDisplayLogic {
    var coinSucessValue : MainPage.FetchCoin.ViewModel?
    var coinFailValue : MainPage.FetchCoin.ViewModel?
    func displayGetCoinSucess(viewModel: MainPage.FetchCoin.ViewModel) {
        coinSucessValue = viewModel
    }
    
    func displayGetCoinFailure(viewModel: MainPage.FetchCoin.ViewModel) {
        coinFailValue = viewModel
    }
    
    
}
