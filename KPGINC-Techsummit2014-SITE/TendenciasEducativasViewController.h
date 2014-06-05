//
//  TendenciasEducativasViewController.h
//  KPGINC-Techsummit2014-SITE
//
//  Created by Mike on 6/4/14.
//  Copyright (c) 2014 Knowledge Power Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TendenciasEducativasViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *PercentMajor1Lbl;

@property (weak, nonatomic) IBOutlet UILabel *PercentMajor2Lbl;
@property (weak, nonatomic) IBOutlet UILabel *PercentMajor3Lbl;

@property (weak, nonatomic) IBOutlet UILabel *PercentMajor4Lbl;

@property (weak, nonatomic) IBOutlet UILabel *PercentMajor5Lbl;
@property (weak, nonatomic) IBOutlet UILabel *PercentMajor6Lbl;

@property (weak, nonatomic) IBOutlet UILabel *MajorName1Lbl;
@property (weak, nonatomic) IBOutlet UILabel *MajorName2Lbl;
@property (weak, nonatomic) IBOutlet UILabel *MajorName3Lbl;
@property (weak, nonatomic) IBOutlet UILabel *MajorName4Lbl;
@property (weak, nonatomic) IBOutlet UILabel *MajorName5Lbl;
@property (weak, nonatomic) IBOutlet UILabel *MajorName6Lbl;


@property (weak, nonatomic) IBOutlet UILabel *MalePercentageLbl;
@property (weak, nonatomic) IBOutlet UILabel *FemalePercentageLbl;


@property (weak, nonatomic) IBOutlet UILabel *PuebloLbl;

@property (weak, nonatomic) IBOutlet UILabel *CampusNameLbl;


- (IBAction)PonceBtn:(id)sender;

- (IBAction)SanJuanBtn:(id)sender;
- (IBAction)MayaguezBtn:(id)sender;




@end
