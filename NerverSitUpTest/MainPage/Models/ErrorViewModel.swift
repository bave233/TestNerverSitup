
import Foundation

// MARK: - ErrorViewModel
struct ErrorViewModel: Error ,Codable {
    let status, code, message: String?
}
