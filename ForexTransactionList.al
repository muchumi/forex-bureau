page 50103 ForexTransactionList
{
    PageType=List;
    CardPageId=ForexTransactionCard;
    SourceTable=ForexTransaction;
    UsageCategory=Lists;
    Caption='Forex Transactions';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("TransactionNo."; Rec."TransactionNo.")
                {
                    ApplicationArea=All;
                }
                field("TransactionDate"; Rec.TransactionDate)
                {
                    ApplicationArea=All;
                }
                field("TransactionTime"; Rec.TransactionTime)
                {
                    ApplicationArea=All;
                }
                field("UserID"; Rec.UserID)
                {
                    ApplicationArea=All;
                }
                field("CustomerName"; Rec.CustomerName)
                {
                    ApplicationArea=All;
                }
                field("CustomerIDNo."; Rec."CustomerIDNo.")
                {
                    ApplicationArea=All;
                }
                field("TransactionType"; Rec.TransactionType)
                {
                    ApplicationArea=All;
                }
                field("CurrencyCode"; Rec.CurrencyCode)
                {
                    ApplicationArea=All;
                }
                field("ForeignAmount"; Rec.ForeignAmount)
                {
                    ApplicationArea=All;
                }
                field("ExchangeRate"; Rec.ExchangeRate)
                {
                    ApplicationArea=All;
                }
                field("LocalAmount"; Rec.LocalAmount)
                {
                    ApplicationArea=All;
                }
            }
        }
    }
    actions
    {
        // action appears in navigation menu
        area(Navigation)
        {
            action(Card)
            {
                Caption='Open Transaction';
                RunObject=page "ForexTransactionCard";
                RunPageLink="TransactionNo."=field("TransactionNo.");
                ApplicationArea=All;
            }
        }
    }

}