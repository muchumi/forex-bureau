report 50101 "Forex Transaction Summary"
{
    Caption = 'Forex Transaction Summary';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Trans; "ForexTransaction")
        {
            DataItemTableView = sorting("TransactionNo.") order(ascending);

            column(CurrencyCode; Trans."CurrencyCode") { }
            column(TransactionCount; TransCount) { }
            column(TotalAmount; TotalAmount) { }

            trigger OnPreDataItem()
            begin
                SetRange("TransactionDate", StartDate, EndDate);

                // Reset counters before looping
                TotalAmount := 0;
                TransCount := 0;
            end;

            trigger OnAfterGetRecord()
            begin
                TotalAmount := TotalAmount + Trans."LocalAmount";
                TransCount := TransCount + 1;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                field("Start Date"; StartDate) { }
                field("End Date"; EndDate) { }
            }
        }
    }

    var
        StartDate: Date;
        EndDate: Date;
        TotalAmount: Decimal;
        TransCount: Integer;
}
