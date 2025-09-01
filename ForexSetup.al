table 50102 ForexSetup
{
    Caption='Forex Setup';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"Primary Key"; Code[10])
        {
            Caption='Primary Key';
        }
        field(2; "TransactionNo."; Code[20])
        {
            Caption='Transaction Nos.';
            TableRelation="No. Series";
        }
    }
    
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}