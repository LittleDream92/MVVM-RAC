//
//  NMFColorHeader.h
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/2.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#ifndef NMFColorHeader_h
#define NMFColorHeader_h

#define NMFCOLOR(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define BASE_COLOR NMFCOLOR(243, 243, 246, 1.0)

#define BACK_COLOR NMFCOLOR(240,240,240,1)


#define BASE_COLOR1 NMFCOLOR(210, 210, 210, 1.0)

#define THEME_COLOR NMFCOLOR(250, 98, 97, 1)

#define THEME_COLOR_ALPHA NMFCOLOR(250, 98, 97, 0.99)

#define BLACK_COLOR NMFCOLOR(50,50,50,1)

#define WORDS_COLOR [UIColor colorWithHex:0x5c5c5c] // 常规文字

#define LINKS_COLOR [UIColor colorWithHex:0x333333] // 链接 (深绿)

#define LINE_COLOR [UIColor colorWithHex:0xe9e9e9]  // 描线色


#endif /* NMFColorHeader_h */
