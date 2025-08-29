page 50100 ForexCurrencyCard
{
    PageType=Card;
    SourceTable=ForexCurrency;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption='General';
                field("Code"; Rec."Code")
                {
                    ApplicationArea=All;
                    Editable=false;
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea=All;
                }
            }
            group(Details)
            {
                Caption='Details';
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