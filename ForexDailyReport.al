report 50100 "Forex Daily Report"
{
    Caption = 'Forex Daily Report';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Trans; "ForexTransaction")
        {
            column(Date; Trans."TransactionDate") { }
            column(Currency; Trans."CurrencyCode") { }
            column(Amount; Trans."LocalAmount") { }
            column(CustomerID; Trans."CustomerIDNo.") { }
            column(CustomerName; Trans."CustomerName") { }

            trigger OnPreDataItem()
            begin
                SetRange("TransactionDate", StartDate, EndDate);
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                field("Start Date"; StartDate) { }
                field("End Date"; EndDate) { }
            }
        }
    }

    var
        StartDate: Date;
        EndDate: Date;
}
