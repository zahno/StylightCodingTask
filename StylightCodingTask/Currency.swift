import Foundation

public class Currency: CustomStringConvertible{
    private var _symbol: String
    
    init(_ symbol: String){
        self._symbol = symbol
    }
    
    var Symbol:String{
        get {return self._symbol}
        set {self._symbol = newValue}
    }
    
    public var description: String{
        return "Currency {" +
        "symbol='\(_symbol)'}";
    }
}
