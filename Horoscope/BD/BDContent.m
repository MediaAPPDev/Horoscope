//
//  BDContent.m
//  Horoscope
//
//  Created by Satellite on 15/4/13.
//
//

#import "BDContent.h"

@implementation BDContent

+(NSDictionary *)WithStar:(NSString *)str
{
    
    NSDictionary *dic = [NSDictionary dictionary];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:str ofType:@"TXT"];
    NSData* proData = [NSData dataWithContentsOfFile:path];
    NSString* proContent = [[NSString alloc] initWithData:proData encoding:NSUTF8StringEncoding];
    
    dic = [NSDictionary dictionaryWithContentsOfFile:proContent];
    dic = [proContent JSONValue];
    return dic;
}
@end
