table 50101 ForexTransaction
{
    Caption='Forex Transaction';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "TransactionNo."; Code[20])
        {
            Caption='Transaction No.';
            DataClassification=CustomerContent;
            
        }
        field(2; "TransactionDate"; Date)
        {
            Caption='Transaction Date';
            DataClassification=SystemMetadata;
            
        }
        field(3; "TransactionTime"; Time)
        {
            Caption='Transaction Time';
            DataClassification=SystemMetadata;
        }
        field(4; "CustomerName"; Text[100])
        {
            Caption='Customer Name';
            DataClassification=CustomerContent;
        }
        field(5; "CustomerIDNo."; Code[50])
        {
            Caption='Customer ID No.';
            DataClassification=CustomerContent;
        }
        field(6; "CurrencyCode"; Code[10])
        {
            Caption='Currency Code';
            TableRelation="ForexCurrency"."Code";
            DataClassification=CustomerContent;
        }
        field(7; "ForeignAmount"; Decimal)
        {
            Caption='Foreign Amount (Foreign Currency)';
            DataClassification=CustomerContent;
        }
        field(8; "ExchangeRate"; Decimal)
        {
            Caption='Exchange Rate';
            DecimalPlaces=0:6;
            DataClassification=CustomerContent;
        }
        field(9; "LocalAmount"; Decimal)
        {
            Caption='Local Amount (Local Currency)';
            DataClassification=CustomerContent;
        }
        field(10; "TransactionType"; Option)
        {
            Caption='Transaction Type';
            OptionMembers=Buy, Sell;
            DataClassification=CustomerContent;
        }
        field(11; "UserID"; Code[50])
        {
            Caption='User ID'; // User ID will hold username/login ID of the person who captured the forex deal,Used for audit trails
            DataClassification=SystemMetadata; 

        }

    }
    
    keys
    {
        key(PK; "TransactionNo.")
        {
            Clustered = true;
        }
    }    
}