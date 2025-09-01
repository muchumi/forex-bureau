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
}