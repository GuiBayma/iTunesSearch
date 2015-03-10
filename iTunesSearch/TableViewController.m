//
//  ViewController.m
//  iTunesSearch
//
//  Created by joaquim on 09/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "iTunesManager.h"
#import "Entidades/Filme.h"
#import "TableViewHeader.h"

@interface TableViewController () {
    iTunesManager *itunes;
    TableViewHeader *tableHeader;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    [self.tableview registerNib:nib forCellReuseIdentifier:@"celulaPadrao"];
    
    itunes = [iTunesManager sharedInstance];
    _filmes = [itunes buscarFilmes:@"Apple"];
    _musicas = [itunes buscarMusicas:@"Love"];
    
    tableHeader = [[[NSBundle mainBundle] loadNibNamed:@"TableViewHeader" owner:self options:nil] firstObject];
    
    [tableHeader.buscaButton setTitle:NSLocalizedString(@"busca", @"") forState:UIControlStateNormal];
    [tableHeader.tituloLabel setText:NSLocalizedString(@"titulo", @"")];
    
    self.tableview.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:tableHeader];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Metodos do UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0: return [_filmes count]; break;
        case 1: return [_musicas count]; break;
        default: return 0; break;
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0: return @"Filmes"; break;
        case 1: return @"Musicas"; break;
        default: return nil; break;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *celula = [self.tableview dequeueReusableCellWithIdentifier:@"celulaPadrao"];
    
    if (indexPath.section == 0) {
        Filme *filme = [_filmes objectAtIndex:indexPath.row];
    
        [celula.nome setText:filme.nome];
        [celula.tipo setText:@"Filme"];
        [celula.artista setText:filme.artista];
    
    return celula;
    }
    else {
        Filme *filme = [_musicas objectAtIndex:indexPath.row];
        [celula.nome setText:filme.nome];
        [celula.tipo setText:@"Filme"];
        [celula.artista setText:filme.artista];
        
        return celula;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return tableHeader;
    }
    return  nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [tableHeader.textoBusca resignFirstResponder];
}


@end
