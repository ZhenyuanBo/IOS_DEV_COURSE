import Foundation
struct CoinModel{
    let currency: String
    let rate: Double
    
    var rateString: String{
        return String(format: "%.2f", rate);
    }
}
