//
//  Utils.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//

import UIKit
import Kingfisher

struct Utils {
    static func formatPrice(_ value: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        numberFormatter.minimumFractionDigits = 0
        return numberFormatter.string(from: NSNumber(value: value)) ?? "\(Int(value))"
    }

    static func getImagesFromUrlString(urlStrings: [String], completion: @escaping ([UIImage]) -> Void) {
        let group = DispatchGroup()
        var images = [UIImage]()
        urlStrings.forEach { image in
            group.enter()
            downloadImage(with: image) {(image, _) in
                guard let image = image else {
                    group.leave()
                    return
                }
                DispatchQueue.main.async {
                    images.append(image)
                    group.leave()
                }
            }
        }

        group.notify(queue: .main) {
            completion(images)
        }
    }

    static func downloadImage(`with` urlString: String, completion: @escaping (UIImage?, Error?) -> Void){
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = KF.ImageResource(downloadURL: url)

        KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
            switch result {
            case .success(let value):
                completion(value.image, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
