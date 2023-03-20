page 50101 "CDS Customer List"
{
    Caption = 'Customer List';
    PageType = List;
    SourceTable = "CSD Subscriptions";
    Editable = false;
    CardPageId = "CSD Subscription Card";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Name; rec.Name)
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
                field("Invoicing Price"; rec."Invoice Pricing")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}