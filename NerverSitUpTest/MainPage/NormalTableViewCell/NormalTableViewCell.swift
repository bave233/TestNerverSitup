
import UIKit
import Kingfisher

class NormalTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField,
                                reason: UITextField.DidEndEditingReason){
        if let value = textField.text  {
            btcLabel.text = "\((Double(value) ?? 0.0) * coinsData! ) BTC"
        }
    }
    
    @IBAction func enterButtonAction(_ sender: Any) {
        textField.resignFirstResponder()
    }
    
    @IBOutlet weak var contentImageView: UIImageView!
    
    @IBOutlet weak var contentTitleLabel: UILabel!
    
    @IBOutlet weak var contentSubtitleLabel: UILabel!
    
    @IBOutlet weak var btcLabel: UILabel!
    @IBOutlet weak var contentPrice: UILabel!
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.delegate = self
        }
    }
    @IBOutlet weak var contentDetailLabel: UILabel!
    
    var coinsData : Double?
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupColor()
    }
    
    func setupColor() {
        contentTitleLabel.textColor = UIColor().hexStringToUIColor(hex: "#333333")
        contentSubtitleLabel.textColor = UIColor().hexStringToUIColor(hex: "#999999")
        contentPrice.textColor = UIColor().hexStringToUIColor(hex: "#333333")
    }

    func setupUI(   coinsData : Double?,
                     viewModel : NormalTableViewCellViewModel,previousPrice : String?) {
        self.coinsData = coinsData
        contentImageView.kf.setImage(with: URL(string: viewModel.imageView.replacingOccurrences(of: ".svg", with: ".png")))
        contentTitleLabel.text =  viewModel.title
        contentSubtitleLabel.text = viewModel.subtitle
        contentDetailLabel.text  = viewModel.detail
        if !(previousPrice?.isEmpty ?? false) {
            contentPrice.text = "Previous Price\(previousPrice ?? "")"
        } else {
            contentPrice.text =  ""
        }
        btcLabel.text = ""
        
    }
    
    
}

struct NormalTableViewCellViewModel {
    var imageView : String
    var title : String
    var subtitle : String
    var detail : String
    var price : String
}

