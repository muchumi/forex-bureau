page 50102 ForexTransactionCard
{
    PageType = Card;
    SourceTable = ForexTransaction;
    UsageCategory = Tasks; // so it shows under Transactions menu

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("TransactionNo."; Rec."TransactionNo.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("TransactionDate"; Rec.TransactionDate)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("TransactionTime"; Rec.TransactionTime)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("UserID"; Rec.UserID)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group(Customer)
            {
                field("CustomerName"; Rec.CustomerName)
                {
                    ApplicationArea = All;
                }
                field("CustomerIDNo."; Rec."CustomerIDNo.")
                {
                    ApplicationArea = All;
                }
            }
            group(Transaction)
            {
                field("TransactionType"; Rec.TransactionType)
                {
                    ApplicationArea = All;
                }
                field("CurrencyCode"; Rec.CurrencyCode)
                {
                    ApplicationArea = All;
                }
                field("ForeignAmount"; Rec.ForeignAmount)
                {
                    ApplicationArea = All;
                }
                field("ExchangeRate"; Rec.ExchangeRate)
                {
                    ApplicationArea = All;
                }
                field("LocalAmount"; Rec.LocalAmount)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(Post)
            {
                Caption = 'Post Forex Transaction';
                Image = Post;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Message('Transaction %1 has been posted successfully.', Rec."TransactionNo.");
                end;
            }
        }
    }
}
