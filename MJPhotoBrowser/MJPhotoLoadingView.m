//
//  MJPhotoLoadingView.m
//
//  Created by mj on 13-3-4.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MJPhotoLoadingView.h"
#import "MJPhotoBrowser.h"
#import <QuartzCore/QuartzCore.h>
#import "MJPhotoProgressView.h"

@interface MJPhotoLoadingView ()
{
    UILabel *_failureLabel;
    MJPhotoProgressView *_progressView;
    UIActivityIndicatorView *_activityIndicatorView;
}

@end

@implementation MJPhotoLoadingView

- (void)setFrame:(CGRect)frame
{
    [super setFrame:[UIScreen mainScreen].bounds];
}

- (void)showFailure
{
    [_progressView removeFromSuperview];
    
    if (_failureLabel == nil) {
        _failureLabel = [[UILabel alloc] init];
        _failureLabel.bounds = CGRectMake(0, 0, self.bounds.size.width, 44);
        _failureLabel.textAlignment = NSTextAlignmentCenter;
        _failureLabel.center = self.center;
        _failureLabel.text = @"网络不给力，图片下载失败";
        _failureLabel.font = [UIFont boldSystemFontOfSize:20];
        _failureLabel.textColor = [UIColor whiteColor];
        _failureLabel.backgroundColor = [UIColor clearColor];
        _failureLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    }
    [self addSubview:_failureLabel];
}

- (void)showLoading
{
    [_failureLabel removeFromSuperview];
    
//    if (_progressView == nil) {
//        _progressView = [[MJPhotoProgressView alloc] init];
//        _progressView.bounds = CGRectMake( 0, 0, 60, 60);
//        _progressView.center = self.center;
//    }
//    _progressView.progress = kMinProgress;
    
    if (_activityIndicatorView == nil) {
        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _activityIndicatorView.bounds = CGRectMake(0, 0, 80, 80);
        _activityIndicatorView.center = self.center;
        _activityIndicatorView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        _activityIndicatorView.layer.cornerRadius = 10;
        [_activityIndicatorView startAnimating];
    }
    
    [self addSubview:_activityIndicatorView];
}

#pragma mark - customlize method
- (void)setProgress:(float)progress
{
    _progress = progress;
    _progressView.progress = progress;
    if (progress >= 1.0) {
        [_progressView removeFromSuperview];
    }
}
@end
