import Foundation
import UIKit

final class OAuth2Service {
    static let shared = OAuth2Service()
    init() {}
    
    func makeOAuthTokenRequest(code: String) -> URLRequest? {
        //guard let baseURL = URL(string: "https://unsplash.com") else {
        //  return nil
        //}
        
        let urlString = "https://unsplash.com/oauth/token"
               + "?client_id=\(accessKey)"
               + "&&client_secret=\(secretKey)"
               + "&&redirect_uri=\(redirectURI)"
               + "&&code=\(code)"
               + "&&grant_type=authorization_code"
        
        guard let url = URL(string: urlString) else {
            print("Failed to create URL with baseURL and parameters.")
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        return request
    }
    
    func fetchOAuthToken(code: String, completion: @escaping (Result<String,Error>) -> Void) {
        
        guard let request = makeOAuthTokenRequest(code: code) else { return }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
                let error = NSError(domain: "HTTP", code: (response as? HTTPURLResponse)?.statusCode ?? -1, userInfo: nil)
                DispatchQueue.main.async {
                    completion(.failure(error))
                    print(error)
                }
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "Data", code: -1, userInfo: nil)
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(OAuthTokenResponseBody.self, from: data)
                OAuth2TokenStorage.shared.token = response.accessToken
                DispatchQueue.main.async {
                    completion(.success(response.accessToken))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
}

