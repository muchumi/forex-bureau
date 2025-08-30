table 50100 ForexCurrency
{
    Caption = 'Forex Currency';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"Code"; Code[10])
        {
            Caption = 'Currency Code';
            DataClassification = ToBeClassified;
            NotBlank=true;         
        }
        field(2; "Description"; Text[50])
        {
            Caption = 'Currency Description';
            DataClassification = ToBeClassified;
            NotBlank=true;
        }
        field(3; "BuyingRate"; Decimal)
        {
            Caption='Buying Rate';
            DecimalPlaces=2:6;
            DataClassification = ToBeClassified;
        }
        field(4; "SellingRate"; Decimal)
        {
            Caption = 'Selling Rate';
            DecimalPlaces=2:6;
            DataClassification = ToBeClassified;
        }
        field(5; "RoundingPrecision"; Decimal)
        {
            Caption='Rounding Precision';
            DecimalPlaces=0:4;
            InitValue=0.05; // Default value for every new entry of a currency record  
            DataClassification = ToBeClassified;
        }
        field(6; "Available"; Boolean)
        {
            Caption='Available';
            InitValue=true;
            DataClassification = ToBeClassified;
        }
    }
    
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}