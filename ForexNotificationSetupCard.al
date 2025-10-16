page 50107 "Forex Notification Setup Card"
{
    Caption='Forex Notification Setup';
    PageType=Card;
    SourceTable="Forex Notification Setup";
    UsageCategory=Administration;
    ApplicationArea=All;

    layout
    {
        area(Content)
        {
            group("General Setup")
            {
                Caption='General';
                field("SendSMS"; Rec.SendSMS)
                {
                    ApplicationArea=All;
                    ToolTip='Enable or disable SMS Notifications';
                }
                field("SendEmail"; Rec.SendEmail)
                {
                    ApplicationArea=All;
                    ToolTip='Enable or disable Email Notifications';
                }
            }
            group("SMS API Configuration")
            {
                Caption='SMS API Settings';
                field("SMSAPIURL"; Rec.SMSAPIURL)
                {
                    ApplicationArea=All;
                    ToolTip='Enter the Africas Talking SMS API endpoint URL.';
                }
                field("APIUsername"; Rec.APIUsername)
                {
                    ApplicationArea=All;
                    ToolTip='Enter your Africas Talking API Username';
                }
                field("APIKey"; Rec.APIKey)
                {
                    ApplicationArea=All;
                    ToolTip='Enter your Africas Talking API Key';
                }
                field("SenderID"; Rec.SenderID)
                {
                    ApplicationArea=All;
                    ToolTip='Enter your approved sender ID';
                }
            }
            group("Manager Alerts")
            {
                Caption='Manager Alerts';
                field("ManagerEmail"; Rec.ManagerEmail)
                {
                    ApplicationArea=All;
                    ToolTip='Manager email to receive alerts';
                }
                field("ManagerPhoneNo."; Rec."ManagerPhoneNo.")
                {
                    ApplicationArea=All;
                    ToolTip='Manager phone number to receive SMS alerts';
                }
                field("HighValueLimit"; Rec.HighValueLimit)
                {
                    ApplicationArea=All;
                    ToolTip='Transaction amount threshold for sending high-value alerts.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            group("Testing")
            {
                Caption='Testing Tools';
                action("SendTestSMS")
                {
                    Caption='Send Test SMS';
                    ApplicationArea=All;
                    Image=SendMail;

                    trigger OnAction()
                    var 
                        NotificationMgt: Codeunit "Forex Notification Management";
                    begin
                        NotificationMgt.SendSMS('+254700111222', 'Test message from Forex Bureau Notification Setup.');
                        Message('Test SMS Sent successfully(if SMS API credentials are valid).');
                    end;
                }
                action("SendTestEmail")
                {
                    Caption='Send Test Email';
                    ApplicationArea=All;
                    Image=Email;

                    trigger OnAction()
                    var 
                        NotificationMgt: Codeunit "Forex Notification Management";
                    begin
                        NotificationMgt.SendEmail('wycliffemuchumi@hotmail.com', 'Test Email', 'This is a test email from the Forex Bureau System.');
                        Message('Test Email sent successfully (if SMTP setup is valid).');
                    end;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        // Ensuring that the setup record exists when the page opens
        if not Rec.Get('SETUP') then begin
            Rec.Init();
            Rec."Primary Key":='SETUP';
            Rec.Insert();
        end;
    end;
}