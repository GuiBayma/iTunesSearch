//
//  DetailViewController.m
//  iTunesSearch
//
//  Created by Guilherme Bayma on 3/11/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "DetailViewController.h"
#import "Midia.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    _tipo.text = _midia.artista;
    [_imagem setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_midia.urlImagem]]]];
    _detalhes.text = _midia.descricao;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setMidia:(Midia *)midia {
    _midia = midia;
    self.navigationItem.title = _midia.nome;
}

@end
