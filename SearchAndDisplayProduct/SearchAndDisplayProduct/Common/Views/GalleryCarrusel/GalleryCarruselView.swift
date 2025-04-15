//
//  GalleryCarruselView.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 15/04/25.
//

import UIKit

class ProductGalleryComponent: UIView {
    
    var arrayImages : [UIImage] = []
    
    lazy var viewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl(frame: .zero)
        return pageControl
    }()
    
    lazy var collectionViewImages: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.register(ProductGalleryCollectionViewCell.self, forCellWithReuseIdentifier: "productGalleryCollectionViewCell")
        return collectionView
    }()
    
    lazy var buttonShare: CPIconButton = {
        let button = CPIconButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = false
        button.size = .small
        button.customImage = AppTheme.theme.icons.share
        button.style = .secondary
        button.addTarget(self, action: #selector(clickShareButton), for: .touchUpInside)
        return button
    }()
    lazy var button360: Button360Component = {
        let button = Button360Component()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var shareButtonHandler: (() -> Void)?
    var didSelectItemAt: ((Int) -> Void)?
    var is360Active: Bool = false {
        didSet {
            self.setView360Button()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        self.backgroundColor = .clear

        self.addSubview(viewContainer)
        viewContainer.addSubview(collectionViewImages)
        viewContainer.addSubview(pageControl)
        viewContainer.addSubview(buttonShare)

        viewContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        viewContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        viewContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        viewContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true

        collectionViewImages.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 0).isActive = true
        collectionViewImages.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 0).isActive = true
        collectionViewImages.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: 0).isActive = true
        collectionViewImages.heightAnchor.constraint(equalToConstant: 320).isActive = true

        pageControl.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor).isActive = true

        buttonShare.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 8).isActive = true
        buttonShare.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 12).isActive = true
    }

    func updateCarrousel(images : [UIImage]) {
        DispatchQueue.main.async {
            self.arrayImages = images
            self.pageControl.numberOfPages = self.arrayImages.count
            self.pageControl.translatesAutoresizingMaskIntoConstraints = false
            self.pageControl.currentPageIndicatorTintColor = AppTheme.theme.colors.interactivePrimary
            self.pageControl.pageIndicatorTintColor = AppTheme.theme.colors.backgroundInactive
            self.pageControl.addTarget(self, action: #selector(self.pageControlHandle), for: .valueChanged)
            self.collectionViewImages.reloadData()
        }
    }

    func selectImageBy(index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        self.collectionViewImages.selectItem(at: indexPath, animated: false, scrollPosition: UICollectionView.ScrollPosition.top)
        self.pageControl.currentPage = index
    }

    @objc private func setView360Button() {
        if is360Active {
            viewContainer.addSubview(button360)
            button360.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 0).isActive = true
            button360.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: 0).isActive = true
            button360.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: -5).isActive = true
        }
    }

    @objc func showModalImage(image: UIImage) { }

    @objc func clickShareButton(image: UIImage) {
        self.shareButtonHandler?()
        ProductDetailAnalyticsFS.shared.customEventProductDetailA()
    }

    @objc private func pageControlHandle(sender: UIPageControl) {
        self.collectionViewImages.scrollToItem(at: IndexPath(row: sender.currentPage, section: 0), at: .centeredHorizontally, animated: true)
    }
}

// MARK: - ProductGalleryComponent: UICollectionViewDataSource

extension ProductGalleryComponent: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productGalleryCollectionViewCell", for: indexPath as IndexPath) as? ProductGalleryCollectionViewCell else {
            return UICollectionViewCell()
        }
        if let image =  arrayImages[safe: indexPath.row] {
            cell.setupImage(image)
        }
        return cell
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1)
        self.pageControl.currentPage = page
    }
}

// MARK: - ProductGalleryComponent: UICollectionViewDelegate

extension ProductGalleryComponent: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectItemAt?(indexPath.row)
    }
}

// MARK: - ProductGalleryComponent: UICollectionViewDelegateFlowLayout

extension ProductGalleryComponent: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.viewContainer.frame.width , height: collectionViewImages.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        guard let selectedItems = collectionView.indexPathsForSelectedItems else {return true}
        guard selectedItems.contains(indexPath) else { return true }
        collectionView.deselectItem(at: indexPath, animated: true)
        return false
    }
}
