#import "Mailer.h"

@implementation Mailer

- (id)initWithSender:(UIViewController <MFMailComposeViewControllerDelegate> *)sender {
    self = [super init];
    if (self) {
        self.sender = sender;
    }

    return self;
}

- (void)presentFeedback {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *emailController = [[MFMailComposeViewController alloc] init];
        emailController.mailComposeDelegate = self.sender;
        NSString *version = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
        NSString *subject = [NSString stringWithFormat:@"Quick Attack Feedback - v%@", version];
        [emailController setSubject:subject];
        [emailController setToRecipients:@[@"pokemon@stefankendall.com"]];
        [self.sender presentViewController:emailController animated:YES completion:nil];
    }
    else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Can't open email" message:@"No mail account configured" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
}

@end