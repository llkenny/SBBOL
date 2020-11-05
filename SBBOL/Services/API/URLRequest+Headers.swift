//
//  URLRequest+Headers.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 05.11.2020.
//

import Foundation

extension URLRequest {

    mutating func setDefaultAzureHeaders(auth: Bool = false) {
        setValue("application/json", forHTTPHeaderField: "Content-Type")
        if auth {
            setValue(APISettings.azureTranslateToken, forHTTPHeaderField: "Ocp-Apim-Subscription-Key")
        }
    }
}
