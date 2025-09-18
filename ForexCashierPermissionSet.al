permissionset 50100 "Forex Cashier"
{
    Assignable=true;
    Permissions=
        tabledata "ForexTransaction"=RIMD, // Can Read, Insert, Modify and Delete
        tabledata "ForexCurrency"=R,
        page "Forex Bureau Role Center"=X, 
        page "ForexTransactionCard"=X,
        page "ForexTransactionList"=X;

}