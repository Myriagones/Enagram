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
  
  var onReuse: () -> Void = {}

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
    backgroundColor = .orange
    addSubview(captionLabel)
    
    addSubview(cellImageView)
    
    NSLayoutConstraint.activate([
      captionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      captionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      cellImageView.topAnchor.constraint(equalTo: topAnchor),
      cellImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
      cellImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      cellImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
  }
}

extension MediaCollectionViewCell: MediaCellPresenterOutput {
  func showImage(image: UIImage, index: Int) {
    self.cellImageView.image = image
  }
  
  func setupReuse(token: UUID?) {
    onReuse = {
      self.presenter.onReuse(token: token)
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
