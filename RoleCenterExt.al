pageextension 50101 RoleCenterExt extends "Business Manager Role Center"
{
    actions
    {
        modify("Customers")
        {
            Visible=false;
        }
        modify("Sales Orders")
        {
            Visible=false;
        }
        modify("Posted Sales Invoices")
        {
            Visible=false;
        }
        modify("Vendors")
        {
            Visible=false;
        }
        modify("Cash Management")
        {
            Visible=false;
        }
        modify("Chart of Accounts")
        {
            Visible=false;
        }
        addlast(Navigation)
        {
            group("Forex Bureau")
            {
                action("Currency")
                {
                    ApplicationArea = All;
                    RunObject = page "ForexCurrencyList";
                }
                action("Transactions")
                {
                    ApplicationArea = All;
                    RunObject = page "ForexTransactionList";
                }
                action("Setup")
                {
                    ApplicationArea = All;
                    RunObject = page "ForexSetupCard";
                }
            }
        }
    }
}