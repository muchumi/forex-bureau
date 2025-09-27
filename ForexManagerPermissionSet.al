permissionset 50102 "Forex Manager"
{
    Assignable=true;
    Caption='Forex Manager';
    Permissions=
                // Core tables
                tabledata "ForexTransaction"=RIMD,
                tabledata "ForexCurrency"=RIMD,
                tabledata "ForexSetup"=RIMD,

                // Adding system/user control tables to be used when needed
                tabledata User=R,
                tabledata "Access Control"=RIMD,
                tabledata "Expanded Permission" = R,

                // Pages
                page "Forex Bureau Role Center"=X,
                page "ForexTransactionCard"=X,
                page "ForexTransactionList"=X,
                page "ForexCurrencyList"=X,
                page "ForexSetupCard"=X,

                // Reports
                report "Forex Daily Report" = X,
                report "Forex Transaction Summary" = X,
                report "Forex Audit Trail Report" = X;
}