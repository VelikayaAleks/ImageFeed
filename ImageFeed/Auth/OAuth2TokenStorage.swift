import Foundation

final class OAuth2TokenStorage {
    var token: String? {
        get {
            return UserDefaults.standard.string(forKey: "OAuth2Token") ?? nil
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "OAuth2Token")
        }
    }
    static let shared = OAuth2TokenStorage()
}

