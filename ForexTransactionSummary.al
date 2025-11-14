report 50101 "Forex Transaction Summary"
{
    Caption = 'Forex Transaction Summary';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;

    DefaultRenderingLayout = SummaryRDLC;

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
                if (StartDate <> 0D) or (EndDate <> 0D) then
                    SetRange("TransactionDate", StartDate, EndDate);

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

    rendering
    {
        layout(SummaryRDLC)
        {
            Type = RDLC;
            LayoutFile = 'ReportLayouts/ForexTransactionSummary.rdlc';
        }
    }

    var
        StartDate: Date;
        EndDate: Date;
        TotalAmount: Decimal;
        TransCount: Integer;
}
