//
//  ViewController.swift
//  ImageResizingDemo
//
//  Created by 이원빈 on 2022/12/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
//    let image = UIImage(named: "Photo")
//    var resizeQuality = CGFloat.init(300.0)
//    var jpegQuality = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        myImageView.image = image
//        myLabel.text = "\(image!.byteCount) bytes"
    }
    
//    func translateImageToData(q: Double) -> Data? {
//        guard let data = image?.jpegData(compressionQuality: q) else { return nil }
//        return data
//    }
    
    @IBAction func downButtonDidTap(_ sender: UIButton) {
//        resizeDown()
//        jpegCompress()
        downSampling()
    }
    @IBAction func upButtonDidTapped(_ sender: UIButton) {
//        resizeUp()
    }
    
    // MARK: - Resize
//    private func resizeUp() {
//        resizeQuality += 5.0
//        guard let newImg = image?.resize(newWidth: resizeQuality) else { return }
//        myImageView.image = newImg
//        myLabel.text = "\(newImg.byteCount) bytes"
//    }
//
//    private func resizeDown() {
//        resizeQuality -= 5.0
//        guard let newImg = image?.resize(newWidth: resizeQuality) else { return }
//        myImageView.image = newImg
//        myLabel.text = "\(newImg.byteCount) bytes"
//    }
    
    // MARK: - JpegData
//    private func jpegCompress() {
////        jpegQuality -= 0.05
//        guard let data = translateImageToData(q: 0.1),
//              let image = UIImage(data: data) else { return }
//
//        myImageView.image = image
//        myLabel.text = "\(image.byteCount) bytes"
//    }
    
    // MARK: - DownSampling
    private func downSampling() {
        let image = downSample1(scale: 10000000)
        myImageView.image = image
        myLabel.text = "\(image.byteCount) bytes"
    }
    
    func downSample1(scale: CGFloat) -> UIImage {
//        let imageSourceOption = [kCGImageSourceShouldCache: false] as CFDictionary
//        let data = self.pngData()! as CFData
//        let imageSource = CGImageSourceCreateWithData(data, nil)!
        let url = NSURL(fileURLWithPath: "/Users/leewonbeen/Downloads/Images/richard-horvath-RAZU_R66vUc-unsplash.jpg")
        let imageSource = CGImageSourceCreateWithURL(url, nil)
//        let maxPixel = max(self.size.width, self.size.height) * scale
//        let downSampleOptions = [
//            kCGImageSourceCreateThumbnailFromImageAlways: true,
//            kCGImageSourceShouldCacheImmediately: true,
//            kCGImageSourceCreateThumbnailWithTransform: true,
//            kCGImageSourceThumbnailMaxPixelSize: maxPixel
//        ] as CFDictionary

//        let downSampledImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, downSampleOptions)!
        let properties = CGImageSourceCopyPropertiesAtIndex(imageSource!, 0, nil)
        let options: [NSString: Any] = [
            kCGImageSourceThumbnailMaxPixelSize: scale,
            kCGImageSourceCreateThumbnailFromImageAlways: true
        ]

//        let newImage = UIImage(cgImage: downSampledImage)
        let scaledImage = CGImageSourceCreateThumbnailAtIndex(imageSource!, 0, options as CFDictionary)
//        printDataSize(newImage)
        return UIImage(cgImage: scaledImage!)
    }
}

extension UIImage {
    func resize(newWidth: CGFloat) -> UIImage {
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale

        let size = CGSize(width: newWidth, height: newHeight)
        let render = UIGraphicsImageRenderer(size: size)
        let renderImage = render.image { context in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        
        print("화면 배율: \(UIScreen.main.scale)")// 배수
        print("origin: \(self), resize: \(renderImage)")
//        printDataSize(renderImage)
        return renderImage
    }
    
    var byteCount: Int {
        return self.jpegData(compressionQuality: 1.0)!.count
    }
    
//    func downSample1(scale: CGFloat) -> UIImage {
////        let imageSourceOption = [kCGImageSourceShouldCache: false] as CFDictionary
////        let data = self.pngData()! as CFData
////        let imageSource = CGImageSourceCreateWithData(data, nil)!
//        let url = NSURL(fileURLWithPath: "/Users/leewonbeen/Downloads/Images/richard-horvath-RAZU_R66vUc-unsplash.jpg")
//        let imageSource = CGImageSourceCreateWithURL(url, nil)
//        let maxPixel = max(self.size.width, self.size.height) * scale
////        let downSampleOptions = [
////            kCGImageSourceCreateThumbnailFromImageAlways: true,
////            kCGImageSourceShouldCacheImmediately: true,
////            kCGImageSourceCreateThumbnailWithTransform: true,
////            kCGImageSourceThumbnailMaxPixelSize: maxPixel
////        ] as CFDictionary
//
////        let downSampledImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, downSampleOptions)!
//        let properties = CGImageSourceCopyPropertiesAtIndex(imageSource!, 0, nil)
//        let options: [NSString: Any] = [
//            kCGImageSourceThumbnailMaxPixelSize: maxPixel,
//            kCGImageSourceCreateThumbnailFromImageAlways: true
//        ]
//
////        let newImage = UIImage(cgImage: downSampledImage)
//        let scaledImage = CGImageSourceCreateThumbnailAtIndex(imageSource!, 0, options as CFDictionary)
////        printDataSize(newImage)
//        return UIImage(cgImage: scaledImage!)
//    }


    // 이미지뷰 크기에 맞게 조절
    func downSample2(size: CGSize, scale: CGFloat = UIScreen.main.scale) -> UIImage {
        let imageSourceOption = [kCGImageSourceShouldCache: false] as CFDictionary
        let data = self.pngData()! as CFData
        let imageSource = CGImageSourceCreateWithData(data, imageSourceOption)!

        let maxPixel = max(size.width, size.height) * scale
        let downSampleOptions = [
            kCGImageSourceCreateThumbnailFromImageAlways: true,
            kCGImageSourceShouldCacheImmediately: true,
            kCGImageSourceCreateThumbnailWithTransform: true,
            kCGImageSourceThumbnailMaxPixelSize: maxPixel
        ] as CFDictionary

        let downSampledImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, downSampleOptions)!

        let newImage = UIImage(cgImage: downSampledImage)
//        printDataSize(newImage)
        return newImage
    }

}
