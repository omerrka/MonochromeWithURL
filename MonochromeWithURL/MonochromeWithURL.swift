
import UIKit

public class MonochromeWithURL {
    
    
    public init() {}
    
}

public func monochrome(_ image: UIImage) -> UIImage? {
    let context = CIContext(options: nil)
    if let filter = CIFilter(name: "CIPhotoEffectNoir") {
        filter.setValue(CIImage(image: image), forKey: kCIInputImageKey)
        if let output = filter.outputImage {
            if let cgImage = context.createCGImage(output, from: output.extent) {
                return UIImage(cgImage: cgImage)
            }
        }
    }
    return nil
}

class ImageStore: NSObject {
    
    static let imageCache = NSCache<NSString, UIImage>()
}
public extension UIImageView {
    func setImageWithURL(_ url: String?, shoulConvertMonochrome: Bool) {
        DispatchQueue.global().async { [weak self] in
            guard let stringURL = url, let url = URL(string: stringURL) else {
                return
            }
            func setImage(image: UIImage?) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
            let urlToString = url.absoluteString as NSString
            if let cachedImage = ImageStore.imageCache.object(forKey: urlToString) {
                if !shoulConvertMonochrome {
                    setImage(image: cachedImage)
                } else {
                    let monochromeImage = monochrome(cachedImage)
                    setImage(image: monochromeImage)
                }
                
            } else if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    ImageStore.imageCache.setObject(image, forKey: urlToString)
                    if !shoulConvertMonochrome {
                        setImage(image: image)
                        
                    } else {
                        let monochromeImage = monochrome(image)
                        setImage(image: monochromeImage)
                    }
                }
            } else {
                setImage(image: nil)
            }
        }
    }
}


