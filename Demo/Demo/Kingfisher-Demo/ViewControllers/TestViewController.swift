//
//  TestViewController.swift
//  Kingfisher
//
//  Created by lazy on 2019/4/22.
//
//  Copyright (c) 2019年 Wei Wang <onevcat@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

class TestViewController: UIViewController {
    
    
    
    let resource: URL = {
        let s1 = "http://p3.music.126.net/ltTnEArjCnpEQdn_IPiK1A==/3252355414700769.jpg"
        let s2 = "http://commondatastorage.googleapis.com/megaphone-prod/podcasts/9499954e-4f68-11e9-9e96-e742ec23bf13/image/uploads_2F1553564581450-w2lt4efoykq-b8d907341c0ac810f3fd9f87b313a575_2FTheBreakdownPodcastArtwork-01.png"
        return URL(string: s1)!
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(imageView)
        view.addSubview(progressLabel)
        view.addSubview(totalLabel)
        
        imageView.frame = CGRect(x: (UIScreen.main.bounds.width - 100.0) * 0.5,
                                 y: 100.0,
                                 width: 100.0,
                                 height: 100.0)
        progressLabel.frame = CGRect(x: imageView.frame.minX,
                                     y: imageView.frame.maxY + 10.0,
                                     width: UIScreen.main.bounds.width - 200.0,
                                     height: 50.0)
        totalLabel.frame = CGRect(x: imageView.frame.minX,
                                  y: progressLabel.frame.maxY + 10.0,
                                  width: progressLabel.bounds.width,
                                  height: 50.0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        imageView.kf.cancelDownloadTask()
        imageView.image = nil
        
        imageView.kf.setImage(with: resource, placeholder: nil, options: nil, progressBlock: { [weak self] (progress, total) in
            self?.progressLabel.text = "\(progress)"
            self?.totalLabel.text = "\(total)"
        }) { (results) in
            switch results {
            case .success(let element):
                break
            case .failure(let error):
                break
            }
        }
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    private lazy var progressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
}
