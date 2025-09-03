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