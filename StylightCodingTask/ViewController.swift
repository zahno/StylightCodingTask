import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    
    private let reuseIdentifier = "Cell"
    private var products: [Product] = []
    private let noOfProductsShown = 10
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        labelTitle.text = "Recently viewed"
        labelSubtitle.text = "Items you've checked out"
        
        labelTitle.font = UIFont(name:"HelveticaNeue-Medium", size: 16.0)
        labelSubtitle.font = UIFont(name:"HelveticaNeue-Light", size: 15.0)

        HttpContentController.loadProductsAsync("https://api.stylight.com/rest/products?apiKey=C6490912AB3211E680F576304DEC7EB7",  update: {products in
            self.products = Array(products.prefix(self.noOfProductsShown))
            self.collectionView.reloadData()
        })
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CustomCollectionViewCell
        
        cell.labelProductName.text = self.products[indexPath.item].Name
        cell.labelBrandName.text = self.products[indexPath.item].Brand.Name
        cell.labelPrice.text = String(format: "%.2f", self.products[indexPath.item].Price).replacingOccurrences(of: ".", with: ",").appending(" \(self.products[indexPath.item].Currency.Symbol)")
        
        cell.labelProductName.font = UIFont(name:"HelveticaNeue-Medium", size: 13.0)
        cell.labelBrandName.font = UIFont(name:"HelveticaNeue-Medium", size: 13.0)
        cell.labelPrice.font = UIFont(name:"HelveticaNeue-Medium", size: 13.0)
        
            cell.imageProduct.contentMode = .scaleAspectFit
            HttpContentController.loadDataAsync(self.products[indexPath.item].Image.URL, update:{
                imageData in
                    cell.imageProduct.image = UIImage(data: imageData!)
            })
        
        return cell
    }

}
