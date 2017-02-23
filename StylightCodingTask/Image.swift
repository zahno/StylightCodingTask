import Foundation

public class Image: CustomStringConvertible{
    
    private var _url: URL
    
    init(_ url: URL){
        self._url = url
    }
    
    var URL:URL{
        get {return self._url}
        set {self._url = newValue}
    }

    public var description: String{
        return "Image {" +
        "url='\(_url)'}";
    }
}
