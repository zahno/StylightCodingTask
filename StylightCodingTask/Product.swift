import Foundation

public class Product: CustomStringConvertible{
    
    private var _name: String
    private var _brand: Brand
    private var _price: Double
    private var _currency: Currency
    private var _image: Image
    
    init(_ name: String, _ brand: Brand, _ price: Double, _ currency: Currency, _ image: Image){
        self._name = name
        self._price = price
        self._brand = brand
        self._currency = currency
        self._image = image
    }
    
    var Name:String{
        get {return self._name}
        set {self._name = newValue}
    }
    
    var Price:Double{
        get {return self._price}
        set {self._price = newValue}
    }
    
    var Brand:Brand{
        get {return self._brand}
        set {self._brand = newValue}
    }
    
    var Currency:Currency{
        get {return self._currency}
        set {self._currency = newValue}
    }
    
    var Image:Image{
        get {return self._image}
        set {self._image = newValue}
    }
    
    public var description: String{
        return "Product {" +
            "brand='\(_brand)', name='\(_name)', price='\(_price)', currency='\(_currency), image=\(_image)}";
    }
    
}
