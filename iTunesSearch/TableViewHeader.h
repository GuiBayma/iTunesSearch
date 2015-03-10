//
//  TableViewHeader.h
//  iTunesSearch
//
//  Created by Guilherme Bayma on 3/10/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewHeader : UIView

@property (weak, nonatomic) IBOutlet UITextField *textoBusca;
@property (weak, nonatomic) IBOutlet UIButton *buscaButton;
@property (weak, nonatomic) IBOutlet UILabel *tituloLabel;
@end
