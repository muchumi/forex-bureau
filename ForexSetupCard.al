page 50104 ForexSetupCard
{
    PageType=Card;
    SourceTable=ForexSetup;
    Caption='Forex Setup';
    UsageCategory=Administration;

    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                field("TransactionNos."; Rec."TransactionNos.")
                {
                    ApplicationArea=All;
                    TableRelation="No. Series"; //Lookup to BC No. Series table to ensure only valid No.Series are picked
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        ForexSetup: Record ForexSetup;
    begin
        if not ForexSetup.Get('SETUP') then begin
            ForexSetup.Init();
            ForexSetup."Primary Key":='SETUP';
            ForexSetup.Insert()
        end;
    end;
}