//
//  MediaCollectionViewCell.swift
//  Enagram
//
//  Created by Perso on 19/07/2020.
//  Copyright © 2020 Antoine Subra. All rights reserved.
//

import UIKit

protocol MediaCellDelegate {
  func show(media: MediaCaptionModelView, loader: ImageLoader)
}

class MediaCollectionViewCell: UICollectionViewCell {
  var presenter: MediaCellPresenterInput!
  private var onReuse: () -> Void = {}
  
  private lazy var captionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    return label
  }()
  
  private lazy var cellImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.isPagingEnabled = true
    return scrollView
  }()
  
  override func prepareForReuse() {
    super.prepareForReuse()
    onReuse()
    cellImageView.image = nil
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupViews()
  }
  
  private func setupViews() {
    addSubview(scrollView)
    addSubview(captionLabel)
    
    NSLayoutConstraint.activate([
      captionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      captionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      scrollView.topAnchor.constraint(equalTo: topAnchor),
      scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
      scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
  }
}

extension MediaCollectionViewCell: MediaCellPresenterOutput {
  func showImage(image: UIImage, index: Int) {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = image
    imageView.contentMode = .scaleAspectFill
    
    scrollView.addSubview(imageView)
    
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      imageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: CGFloat(index) * frame.width),
      imageView.widthAnchor.constraint(equalTo: widthAnchor),
      imageView.heightAnchor.constraint(equalTo: heightAnchor),
    ])
    
    self.scrollView.contentSize = CGSize(width: CGFloat(index + 1) * frame.width, height: 0)
  }
  
  func setupReuse(tokens: [UUID]) {
    onReuse = {
      self.presenter.onReuse(tokens: tokens)
    }
  }
}

extension MediaCollectionViewCell: MediaCellDelegate {
  func show(media: MediaCaptionModelView, loader: ImageLoader) {
    let configurator = MediaCellConfigurator()
    configurator.configure(cell: self)
    presenter.loadMedia(media: media, loader: loader)
    captionLabel.text = media.caption
  }
}
