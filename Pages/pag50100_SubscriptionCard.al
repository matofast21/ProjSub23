page 50100 "CSD Subscription Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSD Subscriptions";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;

                }
            }
            field(Name; Rec.Name)
            {
                ApplicationArea = All;
            }
            field("Item No"; Rec."Item Number")
            {
                ApplicationArea = All;
            }
            field("Invoicing Schedule"; Rec."Invoicing Schedule")
            {
                ApplicationArea = All;
            }
            field("Invoicing Frequence"; Rec."Invoicing Frequence")
            {
                ApplicationArea = All;
            }
            field("Invoicing Price"; Rec."Invoice Pricing")
            {
                ApplicationArea = All;
            }
        }
    }
}

