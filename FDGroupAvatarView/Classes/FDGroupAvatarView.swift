
import Foundation
import UIKit

public class FDGroupAvatarView: UIView {
    
    let padding: CGFloat = 10
    
    var _imgUrls = [URL]()
    public var imgUrls : [URL]{
        set{
            _imgUrls = newValue
            collectionView.reloadData()
        }
        get{
            return _imgUrls
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        collectionView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FDGroupAvatarItemCell.classForCoder(), forCellWithReuseIdentifier: "FDGroupAvatarItemCell")
        return collectionView
    }()
}

extension FDGroupAvatarView: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgUrls.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FDGroupAvatarItemCell", for: indexPath) as! FDGroupAvatarItemCell
        if indexPath.item < imgUrls.count {
            cell.imgUrl = imgUrls[indexPath.item]
        }
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch imgUrls.count {
        case 1:
            return CGSize(width: bounds.size.width - padding * 2, height: bounds.size.height - padding * 2)
        case 2,3,4:
            let width = (bounds.size.width - padding * 3) / 2
            return CGSize(width: width, height: width)
        default:
            return CGSize.zero
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
}
