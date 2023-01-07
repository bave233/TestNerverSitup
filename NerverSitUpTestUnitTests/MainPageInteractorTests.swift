
import Foundation
import XCTest
import Quick
import Nimble

@testable import NerverSitUpTest
class MainPageInteractorTests: QuickSpec {
    override func spec() {
        describe("MainPageInteractorTests") {
            var interactor: MainPageInteractor!
            var presenter: MainPageMockPresenter!
            var worker: MainPageMockWorker!
            beforeEach {
                worker = MainPageMockWorker()
                presenter = MainPageMockPresenter()
                interactor = MainPageInteractor()
                interactor.presenter = presenter
                interactor.worker  = worker
            }
            
            context("processShowSnackbarFailView") {
                it("Working") {
                    worker.isFail = false
                    interactor.callGetCoins()
                    expect(presenter.getCoinResponse) != nil
                }
                it("Not Working") {
                    worker.isFail = true
                    interactor.callGetCoins()
                    expect(presenter.getCoinResponse) == nil
                }
            }

            
        }
    }
}
class MainPageMockWorker: MainPageWorker {
    var isFail : Bool = false
    override func getCoins(completion: @escaping (Result<GetCoinsViewModel, ErrorViewModel>) -> Void) {
        if isFail {
            completion(.failure(.init(status: "200", code: "Error", message: "Error")))
        } else {
            completion(.success(GetCoinsViewModel(time: GetCoinsViewModel.Time(updated: "Value", updatedISO: "Value", updateduk: "Value"), disclaimer: "Value", chartName: "Value", bpi: GetCoinsViewModel.Bpi.init(usd: GetCoinsViewModel.MoneyType(code: "USD", symbol: "USD", rate: "USD", eurDescription: "USD", rateFloat: 30.00), gbp: GetCoinsViewModel.MoneyType.init(code: "GBP", symbol: "GBP", rate: "GBP", eurDescription: "GBP", rateFloat: 60.00), eur: GetCoinsViewModel.MoneyType(code: "EUR", symbol: "EUR", rate: "EUR", eurDescription: "EUR", rateFloat: 120.00)))))
        }
    }
}
class MainPageMockPresenter: MainPagePresentationLogic {
    var getCoinResponse : MainPage.FetchCoin.Response?
    func presentGetCoin(response: MainPage.FetchCoin.Response) {
        getCoinResponse = response
    }
}


