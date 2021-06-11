//
//  FDGroupAvatarItemCell.swift
//  FDGroupAvatarView
//
//  Created by Mac on 2021/6/11.
//

import UIKit
import SDWebImage

class FDGroupAvatarItemCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.frame = contentView.bounds
    }
    
    var _imgUrl : URL!
    public var imgUrl : URL!{
        set{
            _imgUrl = newValue
            imageView.sd_setImage(with: imgUrl, completed: nil)
        }
        get{
            return _imgUrl
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
}
