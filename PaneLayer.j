/*
 * AppController.j
 * NewApplication
 *
 * Created by Anshumali Karna on February 8, 2023.
 * Copyright 2023, Anshumali Karna All rights reserved.
 */

 @import <AppKit/CPView.j>

 @implementation PaneLayer : CALayer
{
    float       _rotationRadians;
    float       _scale;

    CPImage     _image;
    CALayer     _imageLayer;

    PageView    _pageView;
}

- (id)initWithPageView:(PageView)aPageView
{
    self = [super init];

    if (self)
    {
        _pageView = aPageView;

        _rotationRadians = 0.0;
        _scale = 1.0;

        _imageLayer = [CALayer layer];
        [_imageLayer setDelegate:self];

        [self addSublayer:_imageLayer];
    }

    return self;
}

- (PageView)pageView
{
    return _pageView;
}

- (void)setBounds:(CGRect)aRect
{
    [super setBounds:aRect];

    [_imageLayer setPosition:
        CGPointMake(CGRectGetMidX(aRect),
        CGRectGetMidY(aRect))];
}

- (void)setImage:(CPImage)anImage
{
    if (_image == anImage)
        return;

    _image = anImage;

    if (_image)
        [_imageLayer setBounds:CGRectMake(0.0, 0.0,
            [_image size].width, [_image size].height)];

    [_imageLayer setNeedsDisplay];
}

- (void)setRotationRadians:(float)radians
{
    if (_rotationRadians == radians)
        return;

    _rotationRadians = radians;

    [_imageLayer setAffineTransform:CGAffineTransformScale(
        CGAffineTransformMakeRotation(_rotationRadians),
        _scale, _scale)];
}

- (void)setScale:(float)aScale
{
    if (_scale == aScale)
        return;

    _scale = aScale;

    [_imageLayer setAffineTransform:CGAffineTransformScale(
        CGAffineTransformMakeRotation(_rotationRadians),
        _scale, _scale)];
}

- (void)drawInContext:(CGContext)aContext
{
    CGContextSetFillColor(aContext, [CPColor grayColor]);
    CGContextFillRect(aContext, [self bounds]);
}

- (void)imageDidLoad:(CPImage)anImage
{
    [_imageLayer setNeedsDisplay];
}

- (void)drawLayer:(CALayer)aLayer inContext:(CGContext)aContext
{
    var bounds = [aLayer bounds];

    if ([_image loadStatus] !=
        CPImageLoadStatusCompleted)
        [_image setDelegate:self];
    else
        CGContextDrawImage(aContext, bounds, _image);
}
- (void)drawLayer:(CALayer)aLayer inContext:(CGContext)aContext
{
    var bounds = [aLayer bounds];

    if ([_image loadStatus] != CPImageLoadStatusCompleted)
        [_image setDelegate:self];
    else
        CGContextDrawImage(aContext, bounds, _image);
}

- (void)imageDidLoad:(CPImage)anImage
{
    [_imageLayer setNeedsDisplay];
}

- (void)setImage:(CPImage)anImage
{
    if (_image == anImage)
        return;

    _image = anImage;

    if (_image)
        [_imageLayer setBounds:CGRectMake(0.0, 0.0,
            [_image size].width, [_image size].height)];

    [_imageLayer setNeedsDisplay];
}

- (void)setRotationRadians:(float)radians
{
    if (_rotationRadians == radians)
        return;

    _rotationRadians = radians;

    [_imageLayer setAffineTransform:CGAffineTransformScale(
        CGAffineTransformMakeRotation(_rotationRadians),
        _scale, _scale)];
}

- (void)setScale:(float)aScale
{
    if (_scale == aScale)
        return;

    _scale = aScale;

    [_imageLayer setAffineTransform:CGAffineTransformScale(
        CGAffineTransformMakeRotation(_rotationRadians),
        _scale, _scale)];
}
@end