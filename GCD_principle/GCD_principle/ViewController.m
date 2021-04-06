//
//  ViewController.m
//  GCD_principle
//
//  Created by Tom.Liu on 2021/4/6.
//

#import "ViewController.h"


 

typedef void (^MTVoidBlock)(void);

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
 
    
    
    int(^sum)(int a ,int b) =  ^(int a,int b){
        
        return a+b;
    };
    
    int sum1 = sum(1,5);
    int sum2 = sum(5,6);
    
    
    
    MTVoidBlock task0 =  ^(){
        NSLog(@"task0 MTVoidBlock");
    };
    
    task0();
    
    
    dispatch_block_t task1 = ^{
        NSLog(@"task1 -  打印 ");
        self.label.text = @"task1";
    };
    
    task1();
    
    //*************************************************************************************************************
    
    dispatch_block_t task2 = dispatch_block_create(DISPATCH_BLOCK_BARRIER, ^{
        NSLog(@"task2 - 阻塞 任务");
    });
    
    task2();
    
    //*************************************************************************************************************
    
    // 用C函数包装任务
    
        dispatch_function_t func = base_c_task;
    
    func(NULL);
}

void base_c_task(void *arg)
{
    NSLog(@"用C函数包装任务");
}



@end
