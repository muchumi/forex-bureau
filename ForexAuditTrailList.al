page 50106 "Forex Audit Trail List"
{
    Caption='Forex Audit Trail';
    PageType=List;
    SourceTable="Forex Audit Trail";
    UsageCategory=History;
    ApplicationArea=All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("AuditEntryNo."; Rec."AuditEntryNo.")
                {
                    ApplicationArea=All;
                }
                field("TransactionNo."; Rec."TransactionNo.")
                {
                    ApplicationArea=All;
                }
                field("CustomerIDNo."; Rec."CustomerIDNo.")
                {
                    ApplicationArea=All;
                }
                field("UserID"; Rec."UserID")
                {
                    ApplicationArea=All;
                }
                field("ActionType"; Rec."ActionType")
                {
                    ApplicationArea=All;
                }
                field("FieldName"; Rec."FieldName")
                {
                    ApplicationArea=All;
                }
                field("OldValue"; Rec."OldValue")
                {
                    ApplicationArea=All;
                }
                field("NewValue"; Rec."NewValue")
                {
                    ApplicationArea=All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea=All;
                }
                field("Time"; Rec."Time")
                {
                    ApplicationArea=All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("View Transaction")
            {
                Caption='View Transaction';
                ApplicationArea=All;
                Image=Navigate;

                trigger OnAction()
                var
                    ForexTrans: Record "ForexTransaction";
                begin
                    if ForexTrans.Get(Rec."TransactionNo.") then
                        Page.Run(Page::ForexTransactionCard, ForexTrans);
                end;
            }
        }
    }
}