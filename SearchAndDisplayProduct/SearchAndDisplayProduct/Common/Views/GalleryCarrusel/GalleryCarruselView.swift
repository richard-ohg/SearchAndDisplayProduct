//
//  GalleryCarruselView.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 15/04/25.
//

import UIKit

class GalleryCarruselView: UIView {

    var arrayImages : [UIImage] = []

    lazy var viewContainer: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.backgroundGalleryView
        return view
    }()

    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl(frame: .zero)
        return pageControl
    }()

    lazy var collectionViewImages: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = ViewValues.minimumLineSpacingGalleryCollection
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = Colors.backgroundGalleryView
        collectionView.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.reuseIdentifier)
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        self.backgroundColor = .clear
        addSubviews()
        addConstraints()
    }

    func addSubviews() {
        add(subviews: viewContainer)
        viewContainer.add(subviews: collectionViewImages, pageControl)
    }

    func addConstraints() {
        viewContainer
            .pinEdges(to: self)

        collectionViewImages
            .pin(.top, to: viewContainer.topAnchor)
            .pin(.leading, to: viewContainer.leadingAnchor)
            .pin(.trailing, to: viewContainer.trailingAnchor)
            .pin(.height, constant: ViewValues.heightCollectionImages)

        pageControl
            .pin(.bottom, to: viewContainer.bottomAnchor)
            .pin(.centerX, to: viewContainer.centerXAnchor)
    }

    func updateCarrousel(images : [UIImage]) {
        DispatchQueue.main.async {
            self.arrayImages = images
            self.pageControl.numberOfPages = self.arrayImages.count
            self.pageControl.translatesAutoresizingMaskIntoConstraints = false
            self.pageControl.currentPageIndicatorTintColor = Colors.currentPageIndicator
            self.pageControl.pageIndicatorTintColor = Colors.pageIndicator
            self.pageControl.addTarget(self, action: #selector(self.pageControlHandle), for: .valueChanged)
            self.collectionViewImages.reloadData()
        }
    }

    func selectImageBy(index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        self.collectionViewImages.selectItem(at: indexPath, animated: false, scrollPosition: UICollectionView.ScrollPosition.top)
        self.pageControl.currentPage = index
    }

    @objc private func pageControlHandle(sender: UIPageControl) {
        self.collectionViewImages.scrollToItem(at: IndexPath(row: sender.currentPage, section: 0), at: .centeredHorizontally, animated: true)
    }
}

// MARK: - ProductGalleryComponent: UICollectionViewDataSource

extension GalleryCarruselView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.reuseIdentifier, for: indexPath as IndexPath) as? GalleryCollectionViewCell
        else {
            return UICollectionViewCell()
        }

        cell.setupImage(arrayImages[indexPath.row])
        return cell
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1)
        self.pageControl.currentPage = page
    }
}

// MARK: - ProductGalleryComponent: UICollectionViewDelegateFlowLayout

extension GalleryCarruselView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.viewContainer.frame.width , height: collectionViewImages.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        guard let selectedItems = collectionView.indexPathsForSelectedItems else { return true }
        guard selectedItems.contains(indexPath) else { return true }
        collectionView.deselectItem(at: indexPath, animated: true)
        return false
    }
}
