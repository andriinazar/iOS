//
//  ViewController.swift
//  final_bank
//
//  Created by Andrii Nazar on 12/5/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import UIKit

class PreviewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    private var slides:[SlideItem] = [];
    @IBOutlet weak var beginBtn: UIButton!
    @IBOutlet weak var transparentView: UIView!
    @IBOutlet weak var coinsImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initScrollView();
        initButton()
        initSlider()
        initPageControl()
        setCoinsImagePosition(xStart: Int(self.view.frame.width - coinsImage.frame.width / 2), yStart: Int(self.view.frame.height - coinsImage.frame.height / 3))
    }
    
    private func setCoinsImagePosition(xStart: Int, yStart: Int) {
        self.coinsImage.frame.origin.x = CGFloat(xStart)
        self.coinsImage.frame.origin.y = CGFloat(yStart)
        self.transparentView.frame.origin.x = CGFloat(xStart)
        self.transparentView.frame.origin.y = CGFloat(yStart)
    }
    
    private func initSlider() {
        slides = createSlide()
        setupSlideScrollView(slides: slides)
    }
    
    private func initScrollView() {
        self.mainScrollView.delegate = self
        self.mainScrollView.showsHorizontalScrollIndicator = false
        self.mainScrollView.showsVerticalScrollIndicator = false
    }
    
    private func initButton() {
        self.beginBtn.layer.cornerRadius = 30
        self.beginBtn.clipsToBounds = true
    }
    
    private func initPageControl() {
        self.pageControl.numberOfPages = slides.count
        self.pageControl.currentPage = 0
        self.view.bringSubviewToFront(pageControl)
    }
    
    private func createSlide() -> [SlideItem] {
        let slide1:SlideItem = Bundle.main.loadNibNamed("SlideItem", owner: self, options: nil)?.first as! SlideItem
        slide1.pageImage.image = UIImage(named: "piggyBank")
        slide1.pageHeader.text = "Заощаджуйте кошти"
        slide1.pageContent.text = "Переглядайте інформацію щодо банківських курсів та вибирайте оптимальний варіант"
        
        let slide2:SlideItem = Bundle.main.loadNibNamed("SlideItem", owner: self, options: nil)?.first as! SlideItem
        slide2.pageImage.image = UIImage(named: "money")
        slide2.pageHeader.text = "Заробляйте"
        slide2.pageContent.text = "Отримайте вигідний відсоток з вигідним вкладом"
        
        let slide3:SlideItem = Bundle.main.loadNibNamed("SlideItem", owner: self, options: nil)?.first as! SlideItem
        slide3.pageImage.image = UIImage(named: "analysis")
        slide3.pageHeader.text = "Аналізуйте"
        slide3.pageContent.text = "Повна інформація про грошові курси та банки"
        return [slide1, slide2, slide3]
    }
    
    private func setupSlideScrollView(slides : [SlideItem]) {
        mainScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        mainScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        mainScrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            mainScrollView.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        //print(percentageHorizontalOffset)
        let partOfCoinHeigth = 2 * (coinsImage.frame.height / 3)
        setCoinsImagePosition(xStart: Int(self.view.frame.width - coinsImage.frame.width / 2), yStart: Int(self.view.frame.height - (coinsImage.frame.height / 3) - partOfCoinHeigth * percentageHorizontalOffset))
    }
    @IBAction func beginButtonClick(_ sender: Any) {
        
    }
}
