//
//  AppDelegate+LaunchAd.swift
//  ZDLaunchAdDemo
//
//  Created by season on 2018/8/1.
//  Copyright © 2018年 season. All rights reserved.
//

import UIKit

extension AppDelegate {
    func setupLaunchAd() {
        //loadNetworkAdImage()
        //loadLocalAdImage()
        loadNetworkAdVideo()
        //loadLocalAdVideo()
    }
    
    
    /// 加载网络图片广告图片
    private func loadNetworkAdImage() {
        
        let imageAdConfiguration = ZDLaunchImageAdConfiguration()
        imageAdConfiguration.duration = 10
        imageAdConfiguration.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight * 0.8)
        imageAdConfiguration.imageNameOrURLString = "http://img.zcool.cn/community/01c034578e09800000018c1be24327.jpg@900w_1l_2o_100sh.jpg"
        imageAdConfiguration.gifImageCycleOnce = true
        imageAdConfiguration.contentMode = .scaleAspectFill
        imageAdConfiguration.openModel = "www.baidu.com"
        imageAdConfiguration.showFinishAnimate = .fadein
        imageAdConfiguration.showFinishAnimateTime = 0.8
        imageAdConfiguration.skipButtonType = .roundTime
        imageAdConfiguration.showEnterForeground = false
        
        //  一定要设置数据等待时间 一般情况下 广告配置与广告类型都是通过网络请求获取的 虽然可以链式编写 实际开发中建议这样写
        /*
         ZDLaunchAd.setWaitDataDuration(5).setSourceType(.launchImage)
         
         networkRequest.success = { model in
         ZDLaunchAd.setLaunchAdType(.image).setImageAdConfiguration(imageAdConfiguration, delegate: self)
         }
         
         networkRequest.failed = { error in
         
         }
         */
        
        ZDLaunchAd.setWaitDataDuration(5).setSourceType(.launchImage)
            .setLaunchAdType(.image)
            .setImageAdConfiguration(imageAdConfiguration, delegate: self)
        
    }
    
    /// 加载本地图片广告图片
    private func loadLocalAdImage() {
        
        let imageAdConfiguration = ZDLaunchImageAdConfiguration()
        imageAdConfiguration.duration = 10
        imageAdConfiguration.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight * 0.8)
        imageAdConfiguration.imageNameOrURLString = "image12.gif"
        imageAdConfiguration.gifImageCycleOnce = true
        imageAdConfiguration.contentMode = .scaleAspectFill
        imageAdConfiguration.openModel = "www.baidu.com"
        imageAdConfiguration.showFinishAnimate = .curUp
        imageAdConfiguration.showFinishAnimateTime = 0.8
        imageAdConfiguration.skipButtonType = .roundProgressTime
        imageAdConfiguration.showEnterForeground = false
        
        ZDLaunchAd.setWaitDataDuration(5).setSourceType(.launchImage)
            .setLaunchAdType(.image)
            .setImageAdConfiguration(imageAdConfiguration, delegate: self)
        
    }
    
    
    /// 加载网络视频广告
    private func loadNetworkAdVideo() {
        let videoAdConfiguration = ZDLaunchVideoAdConfiguration()
        videoAdConfiguration.openModel = "www.hao123.com"
        videoAdConfiguration.skipButtonType = .squareTimeText
        videoAdConfiguration.isVideoCycleOnce = false
        videoAdConfiguration.duration = 10
        videoAdConfiguration.showEnterForeground = false
        videoAdConfiguration.videoNameOrURLString = "http://yun.it7090.com/video/XHLaunchAd/video02.mp4"
        videoAdConfiguration.placeholderAdImage = UIImage(named: "placeholderAdImage")
        videoAdConfiguration.showFinishAnimate = .flipFromLeft
        //videoAdConfiguration.subViews = [alreadyView()]
        //videoAdConfiguration.customSkipView = customSkipButton()
        videoAdConfiguration.isMuted = true
        ZDLaunchAd.setWaitDataDuration(5).setSourceType(.launchImage)
            .setLaunchAdType(.video)
            .setVideoAdConfiguration(videoAdConfiguration, delegate: self)
    }
    
    /// 加载本地视频广告
    private func loadLocalAdVideo() {
        let videoAdConfiguration = ZDLaunchVideoAdConfiguration()
        videoAdConfiguration.openModel = "www.hao123.com"
        videoAdConfiguration.skipButtonType = .roundProgressText
        videoAdConfiguration.isVideoCycleOnce = true
        videoAdConfiguration.duration = 10
        videoAdConfiguration.showEnterForeground = false
        videoAdConfiguration.videoNameOrURLString = "ad_douyin.mp4"
        videoAdConfiguration.placeholderAdImage = UIImage(named: "placeholderAdImage")
        videoAdConfiguration.showFinishAnimate = .flipFromBottom
        videoAdConfiguration.subViews = [alreadyView()]
        
        //  设置了自定义的跳过按钮后 不能设置系统跳过按钮的配置项
        videoAdConfiguration.customSkipView = customSkipButton()
        videoAdConfiguration.isMuted = false
        
        ZDLaunchAd.setWaitDataDuration(5).setSourceType(.launchImage)
            .setLaunchAdType(.video)
            .setVideoAdConfiguration(videoAdConfiguration, delegate: self)
    }
    
    /// 自定义控件
    private func alreadyView() -> UIView {
        let y: CGFloat = isiPhoneX ? 46 : 22
        let label = UILabel(frame: CGRect(x: kScreenWidth - 140, y: y, width: 60, height: 30))
        label.text = "已预载"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 5.0
        label.layer.masksToBounds = true
        label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        return label
    }
    
    ///  自定义跳过按钮
    private func customSkipButton() -> UIButton {
        let y: CGFloat = isiPhoneX ? 46 : 22
        let button = UIButton(type: .infoLight)
        button.frame = CGRect(x: kScreenWidth - 60, y: y, width: 30, height: 30)
        button.addTarget(self, action: #selector(customSkipButtonAction(_:)), for: .touchUpInside)
        return button
    }
    
    @objc private func customSkipButtonAction(_ button: UIButton) {
        ZDLaunchAd.removeWithAnimated()
    }
}

extension AppDelegate: ZDLaunchAdDelegate {
    
    func launchAd(launchAd: ZDLaunchAd, click model: Any?, clickPoint: CGPoint) {
        print("model:\(String(describing: model)), clickPoint: \(clickPoint)")
    }
    
    func launchAd(launchAd: ZDLaunchAd, imageDownoadFinish image: UIImage?, imageData: Data?, url: URL?) {
        print("image:\(String(describing: image)), imageData: \(String(describing: imageData)), url: \(String(describing: url))")
    }
    
    func launchAd(launchAd: ZDLaunchAd, videoDownloadFinish path: URL?) {
        print("catche path: \(String(describing: path))")
    }
    
    func launchAd(launchAd: ZDLaunchAd, videoDownloadProgress progress: Double, total: Int64, current: Int64) {
        print("progress: \(progress), total: \(total), current: \(current)")
    }
    
    func launchAd(launchAd: ZDLaunchAd, customSkipView: UIView?, duration: Int) {
        print("customSkipView: \(String(describing: customSkipView)), duration: \(duration)")
    }
    
    func launchAdShowDefaultAdImage(launchAd: ZDLaunchAd) {
        print("展示默认的广告页!")
    }
    
    func launchAdShowFinish(launchAd: ZDLaunchAd) {
        print("广告页显示完成!")
    }
    
    func launchAd(launchAd: ZDLaunchAd, imageView: UIImageView, url: URL?) {
        print("imageView: \(imageView), url: \(String(describing: url))")
    }
}

