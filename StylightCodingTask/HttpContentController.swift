import Foundation

class HttpContentController{
    
    static func loadAsync(_ url:String, update: @escaping (_:Array<Product>)->Void){
        {self.load(url)} ->- update
    }
    
    
    static func loadImageAsync(_ url:URL, update: @escaping (_:Data?)->Void){
        {let data = try? Data(contentsOf: url)
            return data} ->- update
    }
    
    private static func load(_ url:String) -> Array<Product>{
        var result = Array<Product>()
        
        if let url = URL(string: url) {
            
            do {
                
                let contents = try String(contentsOf: url)
                
                let json = try JSONSerialization.jsonObject(with: contents.data(using: String.Encoding.utf8)!, options: []) as? [String: Any]
                
                if let products = json?["products"] as? [[String: Any]] {
                    for product in products{
                        if let productName = product["name"] as? String, let price = product["price"] as? Double, let brandName = (product["brand"] as? NSDictionary)?["name"] as? String, let currencySymbol = (product["currency"] as? NSDictionary)?["symbol"] as? String
                        {
                            if let images = product["images"] as? [[String: Any]]{
                                for image in images{
                                    if let isPrimary = image["primary"] as? Bool, isPrimary == true {
                                        if let imageUrl = image["url"] as? String, let checkedUrl = URL(string: imageUrl){
                                            result.append(Product(productName, Brand(brandName), price, Currency(currencySymbol), Image(checkedUrl)))
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
            } catch {
                let nsError = error as NSError
                print(nsError)
            }
            
        } else {
            print("Bad URL", "This URL couldn't be opened")
        }
        
        return result
    }
    
}
