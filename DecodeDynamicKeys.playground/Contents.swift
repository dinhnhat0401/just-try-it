import Foundation

enum ParsingError: Error {
    case cannotCreateContainer
}

struct DynamicPrice: Decodable {
    var open: String
    var hight: String
    var low: String
    var close: String
    var volume: String
}

struct DynamicPriceResponse: Decodable {

    private struct DynamicKey: CodingKey {
        var intValue: Int?
        init?(intValue: Int) {
            self.intValue = intValue
            self.stringValue = ""
        }

        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
    }

    private enum CodingKeys: String, CodingKey {
        case open = "1. open"
        case hight = "2. high"
        case low = "3. low"
        case close = "4. close"
        case volume = "5. volume"
    }

    var prices: [DynamicPrice]

    init(from decoder: Decoder) throws {
        guard let container = try? decoder.container(keyedBy: DynamicPriceResponse.DynamicKey.self) else {
            throw ParsingError.cannotCreateContainer
        }

        var prices = [DynamicPrice]()

        for key in container.allKeys {
            let nested = try container.nestedContainer(keyedBy: DynamicPriceResponse.CodingKeys.self, forKey: key)
            let open = try nested.decode(String.self, forKey: .open)
            let hight = try nested.decode(String.self, forKey: .hight)
            let low = try nested.decode(String.self, forKey: .low)
            let close = try nested.decode(String.self, forKey: .close)
            let volume = try nested.decode(String.self, forKey: .volume)
            let price = DynamicPrice(open: open, hight: hight, low: low, close: close, volume: volume)
            prices.append(price)
        }

        self.prices = prices
    }
}

let jsonResponseString: String =
"""
{
      \"2020-01-17 10:55:00\": {
            \"1. open\": \"138.1700\",
            \"2. high\": \"138.2800\",
            \"3. low\": \"137.9700\",
            \"4. close\": \"138.0295\",
            \"5. volume\": \"135435\"
      },
      \"2020-01-17 10:50:00\": {
            \"1. open\": \"138.2650\",
            \"2. high\": \"138.2700\",
            \"3. low\": \"138.1300\",
            \"4. close\": \"138.1710\",
            \"5. volume\": \"79366\"
      }
}
"""

let data = jsonResponseString.data(using: .utf8)!
let response = try JSONDecoder().decode(DynamicPriceResponse.self, from: data)
print(response.prices)
