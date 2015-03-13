//
//  TableViewHeader.m
//  iTunesSearch
//
//  Created by Guilherme Bayma on 3/10/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "TableViewHeader.h"
#import "iTunesManager.h"
#import "TableViewController.h"

@implementation TableViewHeader

- (IBAction)buscar:(UIButton *)sender {
    iTunesManager *itunes = [iTunesManager sharedInstance];
    UINavigationController *nav = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    TableViewController *tvc = [nav.viewControllers objectAtIndex:0];
    tvc.filmes = [itunes buscarFilmes:_textoBusca.text];
    tvc.musicas = [itunes buscarMusicas:_textoBusca.text];
    tvc.podcasts = [itunes buscarPodcasts:_textoBusca.text];
    tvc.ebooks = [itunes buscarEbooks:_textoBusca.text];
    [tvc.tableview reloadData];
}

@end
