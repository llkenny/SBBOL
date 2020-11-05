//
//  AzureLanguageResponse.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 05.11.2020.
//

struct AzureLanguageResponse: Decodable {

    struct Language: Decodable {
        let code: String
        let name: String

        enum CodingKeys: CodingKey {
            case name
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            name = try container.decode(String.self, forKey: CodingKeys.name)
            guard container.codingPath.count > 1 else {
                throw APIError.decoding
            }
            code = container.codingPath[1].stringValue
        }
    }

    struct Translation: Decodable {
        let languages: [Language]

        struct DynamicCodingKeys: CodingKey {
            var stringValue: String
            var intValue: Int?

            init?(stringValue: String) {
                self.stringValue = stringValue
            }

            init?(intValue: Int) {
                self.stringValue = ""
                self.intValue = intValue
            }
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

            languages = try container.allKeys.map { try container.decode(Language.self, forKey: DynamicCodingKeys(stringValue: $0.stringValue)!) }
        }
    }

    let translation: Translation
}
