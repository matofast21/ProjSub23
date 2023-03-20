page 50103 "CSD Subscription Factbox"
{
    Caption = 'Subscription Factbox';
    PageType = Listpart;
    SourceTable = "CSD Customer Subscription";
    Editable = false;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Subscription Code"; rec."Subscriptions Code")
                {
                    ApplicationArea = All;
                }
                field("Item No"; rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field("Cancelled Date"; rec."Cancelled Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}