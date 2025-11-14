report 50102 "Forex Audit Trail Report"
{
    Caption='Forex Audit Trail Report';
    ApplicationArea=All;
    UsageCategory=ReportsAndAnalysis;
    DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem(AuditTrail; "Forex Audit Trail")
        {
            RequestFilterFields="TransactionNo.", "UserID", Date;
            column(AuditEntry;"AuditEntryNo."){}
            column(TransactionNo;"TransactionNo."){}
            column(ActionType;"ActionType"){}
            column(CustomerIDNo;"CustomerIDNo."){}
            column(UserID;"UserID"){}
            column(Date;"Date"){}
            column(Time;"Time"){}
            column(FieldName;"FieldName"){}
            column(OldValue;"OldValue"){}
            column(NewValue;"NewValue"){}
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(FilterGroup)
                {
                    Caption='Filters';
                    field(TransactionNo; AuditTrail."TransactionNo.")
                    {
                        ApplicationArea=All;
                        Caption='Transaction No.';
                    }
                    field(UserID; AuditTrail."UserID")
                    {
                        ApplicationArea=All;
                        Caption='User ID';
                    }
                    field(Date; AuditTrail."Date")
                    {
                        ApplicationArea=All;
                        Caption='Date';
                    }
                }
            }
        }
    }
    rendering
    {
        layout(layoutName)
        {
            Type=RDLC;
            LayoutFile='ReportLayouts/ForexAuditTrailReport.rdlc';
        }
    }
}