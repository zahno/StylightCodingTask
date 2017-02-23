import Foundation

public class Brand: CustomStringConvertible{
 
    private var _name: String

    init(_ name: String){
        self._name = name
    }
    
    var Name:String{
        get {return self._name}
        set {self._name = newValue}
    }
    
    public var description: String{
        return "Brand {" +
        "name='\(_name)'}";
    }
}
