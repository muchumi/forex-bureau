table 50101 ForexTransaction
{
    Caption = 'Forex Transaction';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "TransactionNo."; Code[20])
        {
            Caption = 'Transaction No.';
            DataClassification = CustomerContent;

        }
        field(2; "TransactionDate"; Date)
        {
            Caption = 'Transaction Date';
            DataClassification = SystemMetadata;

        }
        field(3; "TransactionTime"; Time)
        {
            Caption = 'Transaction Time';
            DataClassification = SystemMetadata;
        }
        field(4; "CustomerName"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = CustomerContent;
        }
        field(5; "CustomerIDNo."; Code[50])
        {
            Caption = 'Customer ID No.';
            DataClassification = CustomerContent;
        }
        field(6; "CurrencyCode"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = "ForexCurrency"."Code";
            DataClassification = CustomerContent;
        }
        field(7; "ForeignAmount"; Decimal)
        {
            Caption = 'Foreign Amount (Foreign Currency)';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                CalculateLocalAmount();
            end;
        }
        field(8; "ExchangeRate"; Decimal)
        {
            Caption = 'Exchange Rate';
            DecimalPlaces = 0:6;
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                CalculateLocalAmount();
            end;
        }
        field(9; "LocalAmount"; Decimal)
        {
            Caption = 'Local Amount (Local Currency)';
            Editable=false; // Preventing user from typing manually
            DataClassification = CustomerContent;
        }
        field(10; "TransactionType"; Option)
        {
            Caption = 'Transaction Type';
            OptionMembers = Buy,Sell;
            DataClassification = CustomerContent;
        }
        field(11; "UserID"; Code[50])
        {
            Caption = 'User ID'; // User ID will hold username/login ID of the person who captured the forex deal/Used for audit trails
            DataClassification = SystemMetadata;

        }

    }

    keys
    {
        key(PK; "TransactionNo.")
        {
            Clustered = true;
        }
    }
    // The below trigger adds logic to pull a number from the No. Series if they not manually configured
    // Enables automatic capture of the logged-in user by using the system variable UserId whenever a new transaction is created
    trigger OnInsert()
    var
        ForexSetup: Record ForexSetup;
        NoSeriesMgt: Codeunit "No. Series";
    begin
        if "TransactionNo."='' then begin
            if not ForexSetup.Get('SETUP') then
                Error('Forex Setup not configured.Please set up the Transaction Nos.');
            "TransactionNo.":=NoSeriesMgt.GetNextNo(ForexSetup."TransactionNos.", Today, true);  
        end;
        if "TransactionDate" = 0D then
            "TransactionDate" := Today;

        if "TransactionTime" = 0T then 
            "TransactionTime" := Time;

        if "UserID" = '' then
            "UserID" := UserId;
    end;

    local procedure CalculateLocalAmount()
    begin
        "LocalAmount":=Round("ForeignAmount" * "ExchangeRate", 0.01);
    end;
}