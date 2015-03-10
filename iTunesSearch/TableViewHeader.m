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
    TableViewController *tvc = (TableViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    tvc.midias = [itunes buscarMidias:_textoBusca.text];
    [tvc.tableview reloadData];
}

@end
