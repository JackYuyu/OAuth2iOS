//
//  ViewController.m
//  otest
//
//  Created by JackMba on 2018/8/10.
//  Copyright © 2018年 JackMba. All rights reserved.
//

#import "ViewController.h"
//#import "AFOAuth2Manager.h"
#import "AFOAuthCredential.h"
#import "GROAuth2SessionManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.151:8085/"];
    GROAuth2SessionManager *sessionManager = [GROAuth2SessionManager managerWithBaseURL:url clientID:@"clientTest" secret:@"123456"];
    
    [sessionManager authenticateUsingOAuthWithPath:@"oauth/token"
                                          username:@"666666"
                                          password:@"666666"
                                             scope:@"email"
                                           success:^(AFOAuthCredential *credential) {
                                               NSLog(@"I have a token! %@", credential.accessToken);
                                               [AFOAuthCredential storeCredential:credential withIdentifier:sessionManager.serviceProviderIdentifier];
                                           }
                                           failure:^(NSError *error) {
                                               NSLog(@"Error: %@", error);
                                           }];
    // Do any additional setup after loading the view, typically from a nib.
//    NSURL *baseURL = [NSURL URLWithString:@"http://13.70.0.249:8082/"];
//    AFOAuth2Manager *OAuth2Manager =
//    [[AFOAuth2Manager alloc] initWithBaseURL:baseURL
//                                    clientID:@"666666"
//                                      secret:@"666666"];
////    [OAuth2Manager setUseHTTPBasicAuthentication:NO];
////    [OAuth2Manager setValue:@"password" forKey:@"grant_type"];
//
//    [OAuth2Manager authenticateUsingOAuthWithURLString:@"/auth/oauth/token"
//                                              username:@"666666"
//                                              password:@"666666"
//                                                 scope:@"email"
//                                               success:^(AFOAuthCredential *credential) {
//                                                   NSLog(@"Token: %@", credential.accessToken);
//                                               }
//                                               failure:^(NSError *error) {
//                                                   NSLog(@"Error: %@", error);
//                                               }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
