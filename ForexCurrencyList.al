page 50101 ForexCurrencyList
{
    PageType = List;
    CardPageId=ForexCurrencyCard;
    UsageCategory = Lists;
    SourceTable = ForexCurrency;
    Editable=true;
    
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea=All;
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea=All;
                }
                field("BuyingRate"; Rec.BuyingRate)
                {
                    ApplicationArea=All;
                }
                field("SellingRate"; Rec.SellingRate)
                {
                    ApplicationArea=All;
                }
                field("RoundingPrecision"; Rec.RoundingPrecision)
                {
                    ApplicationArea=All;
                }
                field("Available"; Rec.Available)
                {
                    ApplicationArea=All;
                }
            }
        }
    }
}