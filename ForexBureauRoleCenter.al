page 50105 "Forex Bureau Role Center"
{
    PageType=RoleCenter;
    ApplicationArea=All;
    Caption='Forex Bureau';

    layout
    {
        area(RoleCenter)
        {

        }
    }
    actions
    {
        area(Sections)
        {
            group("Forex Bureau")
            {
                action("Currency")
                {
                    ApplicationArea=All;
                    RunObject=page "ForexCurrencyList";
                }
                action("Transactions")
                {
                    ApplicationArea=All;
                    RunObject=page "ForexTransactionList";
                }
                action("Setup")
                {
                    ApplicationArea=All;
                    RunObject=page "ForexSetupCard";
                }
            }
        }
    }
}