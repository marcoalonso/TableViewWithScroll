//
//  ZoomSingleImageViewController.swift
//  TableViewWithScroll
//
//  Created by marco rodriguez on 27/07/22.
//

import UIKit

class ZoomSingleImageViewController: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageViewZoom: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        
        scrollView.maximumZoomScale = 4
        scrollView.minimumZoomScale = 1
        
        gesturaImagen()
    }
    
    func gesturaImagen(){
        imageViewZoom.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapZoomImage))
        imageViewZoom.addGestureRecognizer(gesture)
    }
    
    @objc func tapZoomImage(){
        print("Zoom image!")
        if scrollView.zoomScale == 1 {
            scrollView.zoomScale = 2.5
        } else {
            scrollView.zoomScale = 1
        }
        
    }

}

extension ZoomSingleImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageViewZoom
    }
    
    //Eliminar espacios en blancos
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if scrollView.zoomScale > 1 {
            if let image = imageViewZoom.image {
                let ratioW = imageViewZoom.frame.width / image.size.width
                let ratioH = imageViewZoom.frame.height / image.size.height
                
                let ratio = ratioW < ratioH ? ratioW: ratioH
                let newWidth = image.size.width * ratio
                let newHeight = image.size.height * ratio
                
                let conditionLeft = newWidth*scrollView.zoomScale > imageViewZoom.frame.width
                
                let left = 0.5 * (conditionLeft ? newWidth - imageViewZoom.frame.width :
                (scrollView.frame.width - scrollView.contentSize.width))
                
                let conditionTop = newHeight * scrollView.zoomScale > imageViewZoom.frame.height
                
                let top = 0.5 * (conditionTop ? newHeight - imageViewZoom.frame.height :
                (scrollView.frame.height - scrollView.contentSize.height))
                
                scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
            }
        } else {
            scrollView.contentInset = .zero
        }
    }
}
