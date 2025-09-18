permissionset 50101 "Forex Supervisor"
{
    Assignable=true;
    Permissions=
        tabledata "ForexTransaction"=RIMD,
        tabledata "ForexCurrency"=RIMD,
        page "Forex Bureau Role Center"=X,
        page "ForexTransactionCard"=X,
        page "ForexTransactionList"=X,
        page "ForexCurrencyList"=X;
}