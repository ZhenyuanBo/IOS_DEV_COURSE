import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoin(_ coinManager: CoinManager, coin: CoinModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    let apiKey = "2EE6F807-AC4B-4B15-A075-8535527D07ED"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    func getCoinPrice(for currency: String){
        let urlString = "\(baseURL)\(currency)?apikey=\(apiKey)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
        if let url = URL(string: urlString){
            //create URL session object
            let session = URLSession(configuration: .default)
            //give session a task
            //trailing closure
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil{
                    return
                }
                
                if let safeData = data{
                    if let coin = self.parseJSON(safeData){
                        self.delegate?.didUpdateCoin(self, coin: coin)
                    }
                }
            }
            //start task
            task.resume()
        }
    }
    
    func parseJSON(_ coinData: Data)->CoinModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let rate = decodedData.rate
            let currency = decodedData.asset_id_quote
            let coin = CoinModel(currency: currency, rate: rate)
            return coin
        }catch{
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
