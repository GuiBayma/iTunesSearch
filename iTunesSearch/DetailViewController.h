//
//  DetailViewController.h
//  iTunesSearch
//
//  Created by Guilherme Bayma on 3/11/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Midia;

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (weak, nonatomic) IBOutlet UILabel *tipo;
@property (weak, nonatomic) IBOutlet UIImageView *imagem;
@property (weak, nonatomic) IBOutlet UILabel *detalhes;
@property (nonatomic, strong) Midia *midia;

@end
