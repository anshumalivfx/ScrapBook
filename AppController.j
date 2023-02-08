/*
 * AppController.j
 * NewApplication
 *
 * Created by Anshumali Karna on February 8, 2023.
 * Copyright 2023, Anshumali Karna All rights reserved.
 */

@import <Foundation/CPObject.j>
@import "PhotoInspector.j"

@implementation AppController : CPObject
{
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc]
                        initWithContentRect:CGRectMakeZero()
                        styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];

    [contentView setBackgroundColor:[CPColor blackColor]];

    [theWindow orderFront:self];

    var theInspector = [[PhotoInspector alloc] init];

    [theInspector showWindow:self];
}

@end