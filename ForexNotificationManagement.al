codeunit 50101 "Forex Notification Management"
{
    Subtype = Normal;
    procedure SendSMS(PhoneNo: Text; MessageText: Text)
    var
        Client: HttpClient;
        RequestContent: HttpContent;
        Response: HttpResponseMessage;
        Setup: Record "Forex Notification Setup";
        APIUrl: Text;
        BodyText: Text;
        ResultText: Text;
        ContentHeaders: HttpHeaders;
    begin
        if not Setup.Get('SETUP') then
            Error('Notification setup record not found.');

        if not Setup."SendSMS" then
            exit; // SMS sending disabled

        if (PhoneNo = '') or (MessageText = '') then
            Error('Phone number or message text cannot be empty.');

        APIUrl := Setup."SMSAPIURL";

        // Compose request body for Africa's Talking API
        BodyText :=
            'username=' + Setup."APIUsername" +
            '&to=' + PhoneNo +
            '&message=' + MessageText +
            '&from=' + Setup."SenderID" +
            '&apiKey=' + Setup."APIKey";

        RequestContent.WriteFrom(BodyText);
        RequestContent.GetHeaders(ContentHeaders);
        ContentHeaders.Add('Content-Type', 'application/x-www-form-urlencoded');

        if Client.Post(APIUrl, RequestContent, Response) then begin
            Response.Content.ReadAs(ResultText);
            Message('SMS sent successfully. Response: %1', ResultText);
        end else
            Error('Failed to send SMS via API.');
    end;

    procedure SendEmail(ToAddress: Text; Subject: Text; Body: Text)
    var
        EmailMsg: Codeunit "Email Message";
        Email: Codeunit Email;
    begin
        if ToAddress = '' then
            Error('Recipient email address cannot be blank.');

        // Create and send email
        EmailMsg.Create(ToAddress, Subject, Body, false);
        Email.Send(EmailMsg, Enum::"Email Scenario"::Default);

        Message('Email sent successfully to %1.', ToAddress);
    end;

    procedure SendHighValueAlert(Amount: Decimal; TransactionNo: Code[20])
    var
        Setup: Record "Forex Notification Setup";
        Msg: Text;
    begin
        if not Setup.Get('SETUP') then
            Error('Notification setup record not found.');

        if Amount < Setup."HighValueLimit" then
            exit; // No alert needed

        Msg := StrSubstNo('High-value transaction detected. Transaction %1 of amount %2.', TransactionNo, Amount);

        if Setup."SendSMS" then
            SendSMS(Setup."ManagerPhoneNo.", Msg);

        if Setup."SendEmail" then
            SendEmail(Setup."ManagerEmail", 'High-Value Transaction Alert', Msg);
    end;
}
