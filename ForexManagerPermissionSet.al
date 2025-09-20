permissionset 50102 "Forex Manager"
{
    Assignable=true;
    Permissions=
                tabledata "ForexTransaction"=RIMD,
                tabledata "ForexCurrency"=RIMD,
                tabledata "ForexSetup"=RIMD,
                page "Forex Bureau Role Center"=X,
                page "ForexTransactionCard"=X,
                page "ForexTransactionList"=X,
                page "ForexCurrencyList"=X;
}