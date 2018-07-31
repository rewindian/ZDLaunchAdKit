//
//  ZDLaunchAdConfiguration.swift
//  ZDLaunchAdDemo
//
//  Created by season on 2018/7/26.
//  Copyright © 2018年 season. All rights reserved.
//

import UIKit
import AVKit

/// 动画效果
///
/// - none: 无动画
/// - fadein: 淡入
/// - lite: 放大淡入
/// - flipFromLeft: 左右翻转
/// - flipFromBottom: 下上翻转
/// - curUp: 向上翻页
enum ShowFinishAnimate {
    case none, fadein, lite, flipFromLeft, flipFromBottom, curUp
}

/// 动画启动配置基类
class ZDLaunchAdConfiguration {
    /// 停留时间(default 5 ,单位:秒)
    var duration: Int = 5
    
    /// 跳过按钮类型(default squareTimeText)
    var skipButtonType: SkipType = .squareTimeText
    
    /// 显示完成动画(default fadein)
    var showFinishAnimate: ShowFinishAnimate = .fadein
    
    /// 显示完成动画时间(default 0.8 , 单位:秒)
    var showFinishAnimateTime = 0.8
    
    /// 设置开屏广告的frame(default [UIScreen mainScreen].bounds)
    var frame = UIScreen.main.bounds
    
    /// 程序从后台恢复时,是否需要展示广告(defailt NO)
    var showEnterForeground = false
    
    /// 点击打开页面参数
    var openModel: Any?
    
    /// 自定义跳过按钮(若定义此视图,将会自定替换系统跳过按钮)
    var customSkipView: UIView?
    
    /// 子视图(若定义此属性,这些视图将会被自动添加在广告视图上,frame相对于window)
    var subViews: [UIView]?
    
    /// 占位的广告图 主要用于第一次下载视频 视频不会暂时的时候显示
    var placeholderAdImage: UIImage?
    
}

/// 动画启动配置图片类
class ZDLaunchImageAdConfiguration: ZDLaunchAdConfiguration {
    /// image本地图片名(jpg/gif图片请带上扩展名)或网络图片URL string
    var imageNameOrURLString = ""
    
    /// 图片广告缩放模式(default UIViewContentModeScaleToFill)
    var contentMode: UIViewContentMode = .scaleToFill
    
    /// 缓存机制(default XHLaunchImageDefault)
    var imageOption: ZDLaunchAdImageOptions = .default
    
    /// 设置GIF动图是否只循环播放一次(YES:只播放一次,NO:循环播放,default NO,仅对动图设置有效)
    var gifImageCycleOnce = false
}


/// 动画启动配置视频类
class ZDLaunchVideoAdConfiguration: ZDLaunchAdConfiguration {
    /// video本地名或网络链接URL string
    var videoNameOrURLString = ""
    
    /// 视频缩放模式(default AVLayerVideoGravityResizeAspectFill)
    var videoGravity: AVLayerVideoGravity = .resizeAspectFill
    
    /// 设置视频是否只循环播放一次(YES:只播放一次,NO循环播放,default YES)
    var isVideoCycleOnce = true
    
    /// 是否关闭音频(default NO)
    var isMuted = false
    
}