@import <AppKit/CPView.j>

@implementation PageView : CPView
{
}

@end

@implementation PageView : CPView
{
    CALayer _rootLayer;
}

- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];

    if (self)
    {
        _rootLayer = [CALayer layer];

        [self setWantsLayer:YES];
        [self setLayer:_rootLayer];

        [_rootLayer setBackgroundColor:[CPColor whiteColor]];

        [_rootLayer setNeedsDisplay];
    }

    return self;
}

@end