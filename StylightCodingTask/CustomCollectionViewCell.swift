import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelBrandName: UILabel!
    @IBOutlet weak var labelProductName: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    
    @IBOutlet weak var imageProduct: UIImageView!
    
    override func prepareForReuse() {
        imageProduct.image = nil
        super.prepareForReuse()
    }
}
