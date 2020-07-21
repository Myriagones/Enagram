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
  
  private var imagesView = [UIImageView]()
  private var numberOfPages: Int = 0
  
  private lazy var date: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .white
    return label
  }()
  
  private lazy var numberPage: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .white
    return label
  }()
  
  private var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .horizontal
    return stackView
  }()
  
  private lazy var container: UIView = {
    let container = UIView()
    container.translatesAutoresizingMaskIntoConstraints = false
    container.backgroundColor = UIColor.black.withAlphaComponent(0.3)
    container.isHidden = true
    return container
  }()
  
  private lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.isUserInteractionEnabled = false
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.isPagingEnabled = true
    scrollView.delegate = self
    return scrollView
  }()
  
  override func prepareForReuse() {
    super.prepareForReuse()
    for imageView in imagesView {
      imageView.image = nil
      stackView.removeArrangedSubview(imageView)
    }
    container.isHidden = true
    imagesView.removeAll()
    onReuse()
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
    contentView.addGestureRecognizer(scrollView.panGestureRecognizer)
    addSubview(scrollView)
    scrollView.addSubview(stackView)
    addSubview(container)
    container.addSubview(date)
    container.addSubview(numberPage)
    setupLayout()
  }
  
  func setupLayout() {
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: topAnchor),
      scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
      scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
      
      stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
      
      container.bottomAnchor.constraint(equalTo: bottomAnchor),
      container.leadingAnchor.constraint(equalTo: leadingAnchor),
      container.trailingAnchor.constraint(equalTo: trailingAnchor),
      container.heightAnchor.constraint(equalToConstant: 30),
      
      date.topAnchor.constraint(equalTo: container.topAnchor),
      date.bottomAnchor.constraint(equalTo: container.bottomAnchor),
      date.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
      
      numberPage.topAnchor.constraint(equalTo: container.topAnchor),
      numberPage.bottomAnchor.constraint(equalTo: container.bottomAnchor),
      numberPage.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10)
    ])
  }
}

extension MediaCollectionViewCell: MediaCellPresenterOutput {
  func display(media: MediaModelView, index: Int, max: Int) {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = media.image
    imageView.contentMode = .scaleAspectFill
    imagesView.append(imageView)
    stackView.addArrangedSubview(imageView)
    
    imageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    imageView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    
    container.isHidden = false
    date.text = media.date
    numberOfPages = max
    numberPage.text = String(format: "1/%i", max)
  }
  
  func setupReuse(tokens: [UUID]) {
    onReuse = {
      self.presenter.onReuse(tokens: tokens)
    }
  }
}

extension MediaCollectionViewCell: MediaCellDelegate {
  func show(media: MediaCaptionModelView, loader: ImageLoader) {
    presenter.loadMedia(media: media, loader: loader)
  }
}

extension MediaCollectionViewCell: UIScrollViewDelegate {
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    let index = Int(scrollView.contentOffset.x / scrollView.bounds.size.width) + 1
    numberPage.text = String(format: "%i/%i", index, numberOfPages)
  }
}
