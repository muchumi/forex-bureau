pageextension 50101 RoleCenterExt extends "Business Manager Role Center"
{
    actions
    {
        addlast(Navigation)
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