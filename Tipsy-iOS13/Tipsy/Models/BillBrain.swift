import Foundation

struct BillBrain{
    
    var billAmount: String?
    var tipOption : String?
    var numPeople: Int?
    var finalPayPerPeople: Double?
    
    var tipAmount: Double?

    mutating func setTipAmount(){
        tipAmount = Double(tipOption!)!/Double(100)
    }
    
    func getTipAmount()->String{
        return String(format: "%0.0f", tipAmount! * 100)
    }
    
    func getBillAmount()->String{
        return billAmount!
    }
    
    func getNumPeople()->Int{
        return numPeople!
    }
    
    func getFinalPayPerPeople()->String{
        let finalPay = Double(billAmount!)! * (1+tipAmount!) / Double(numPeople!)
        return String(format: "%0.2f", finalPay)
    }
    
}
