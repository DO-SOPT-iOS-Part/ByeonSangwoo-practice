//
//  CheckNameService.swift
//  ByeonSangwoo-practice-4th-Seminar
//
//  Created by 변상우 on 11/11/23.
//

import Foundation

class CheckNameService {
    static let shared = CheckNameService()
    private init() {}
    
    func makeRequest(username: String) -> URLRequest {
        let url = URL(string: "http://3.39.54.196/api/v1/members/check?username=\(username)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        return request
    }
    
    func getCheckNameResultData(usreName: String) async throws -> CheckNameDataModel? {
        do {
            let request = self.makeRequest(username: usreName)
            let (data, response) = try await URLSession.shared.data(for: request)
//            dump(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
//            dump(response)
            return parseCheckNameResultData(data: data)
        } catch {
            throw error
        }
    }
    
    private func parseCheckNameResultData(data: Data) -> CheckNameDataModel? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(CheckNameDataModel.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
}
