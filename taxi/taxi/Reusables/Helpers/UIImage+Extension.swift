//
//  UIImage+Extension.swift
//  taxi
//
//  Created by OMER YASIN KOLKANAT on 9.12.2018.
//  Copyright © 2018 Omer Kolkanat. All rights reserved.
//

import Foundation

extension UIImage {
    /**
     Resizes the UIImage with given size.
     - Parameter size: Required size of the UIImage.
     - Returns: A resized UIImage
     */
    func resizeImage(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        self.draw(in: CGRect(origin: .zero,
                             size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}
