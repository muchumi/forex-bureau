table 50103 "Forex Audit Trail"
{
    Caption = 'Forex Audit Trail';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "AuditEntryNo."; Integer)
        {
            Caption = 'Audit Entry No.';
            AutoIncrement = true;
            DataClassification = SystemMetadata;

        }
        field(2; "TransactionNo."; Code[20])
        {
            Caption='Transaction No.';
            TableRelation=ForexTransaction."TransactionNo.";
            DataClassification=CustomerContent;
        }
        field(3; "ActionType"; Option)
        {
            Caption='Action Type';
            OptionMembers=Insert,Modify,Delete;
            DataClassification=SystemMetadata;
        }
        field(4; "CustomerIDNo."; Code[50])
        {
            Caption='Customer ID No.';
            TableRelation=ForexTransaction."CustomerIDNo.";
            DataClassification=CustomerContent;
        }
        field(5; "UserID"; Code[50])
        {
            Caption='User ID';
            DataClassification=SystemMetadata;
        }
        field(6; "Date"; Date)
        {
            Caption='Date';
            DataClassification=SystemMetadata;
        }
        field(7; "Time"; Time)
        {
            Caption='Time';
            DataClassification=SystemMetadata;
        }
        field(8; "FieldName"; Text[100])
        {
            Caption='Field Name';
            DataClassification=CustomerContent;
        }
        field(9; "OldValue"; Text[250])
        {
            Caption='Old Value';
            DataClassification=EndUserIdentifiableInformation;
        }
        field(10; "NewValue"; Text[250])
        {
            Caption='New Value';
            DataClassification=EndUserIdentifiableInformation;
        }
    }

    keys
    {
        key(PK; "AuditEntryNo.")
        {
            Clustered = true;
        }
        // Secondary key that enables to sort and filter audit trail records efficiently by TransactionNo. first, then Date and later Time
        key(Transaction; "TransactionNo.", "Date", "Time"){ }
    }
}