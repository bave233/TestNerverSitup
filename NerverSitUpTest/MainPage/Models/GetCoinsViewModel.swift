
import Foundation

// MARK: - Welcome
struct GetCoinsViewModel: Codable {
    let time: Time
    let disclaimer, chartName: String
    let bpi: Bpi
    
    // MARK: - Bpi
    struct Bpi: Codable {
        let usd, gbp, eur: MoneyType
        enum CodingKeys: String, CodingKey {
            case usd = "USD"
            case gbp = "GBP"
            case eur = "EUR"
        }
    }

    // MARK: - MoneyType
    struct MoneyType: Codable {
        let code, symbol, rate, eurDescription: String
        let rateFloat: Double

        enum CodingKeys: String, CodingKey {
            case code, symbol, rate
            case eurDescription = "description"
            case rateFloat = "rate_float"
        }
    }

    // MARK: - Time
    struct Time: Codable {
        let updated: String
        let updatedISO: String
        let updateduk: String
    }

}

