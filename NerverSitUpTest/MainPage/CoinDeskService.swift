//
//  CoinDeskService.swift
//  NerverSitUpTest
//
//  Created by Ratchanon Insuvanno on 6/1/2566 BE.
//

import Foundation
import Moya
import Alamofire

public enum CoinDeskService {
    case getCoins
}


extension CoinDeskService: TargetType {
 
    public var validationType: ValidationType {
         .successAndRedirectCodes
    }
    
    public var failsOnEmptyData: Bool {
        return false
    }
    
    public var sampleData: Data {
        switch self {
        case .getCoins:
            return """
        []
        """.utf8Encoded
        }
    }
    
    public var baseURL: URL {
    
        guard let baseURL = URL(string: "https://api.coindesk.com") else {
            return URL(fileURLWithPath: "")
        }
        return baseURL
    }
    
    public var path: String {
        switch self {
        case .getCoins:
            return "/v1/bpi/currentprice.json"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getCoins: return .get
        }
    }
    
    
    
    public var parameters: [String: Any] {
        switch self {
        case .getCoins:
            return ["":""]
        }
    }
    
    

    public var task: Task {
        let encoding: ParameterEncoding = method == .get ? Alamofire.URLEncoding.default : Alamofire.JSONEncoding.default
        return Task.requestParameters(parameters: parameters, encoding: encoding)
    }
    
    public var jsonDecoder: JSONDecoder {
        switch self {
        case .getCoins:
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601)
            return decoder
        }
    }
    
    
    
    public var headers: [String : String]? {
        return [
            "Content-Type" : "application/json;charset=utf-8",
        ]
    }
    
}

extension String {
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

extension DateFormatter {
    static var iso8601: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }
}
