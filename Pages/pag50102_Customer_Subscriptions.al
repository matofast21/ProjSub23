page 50102 "CSD Customer Subscriptions"
{
    Caption = 'Customer Subscriptions';
    PageType = List;
    SourceTable = "CSD Customer Subscription";
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer No"; rec."Customer No")
                {
                    ApplicationArea = All;
                    Enabled = ShowCustomerField;
                }
                field("Subscription Code"; rec."Subscriptions Code")
                {
                    ApplicationArea = All;
                }
                field("Item No"; rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field("Start Date"; rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("Last Invoice Date"; rec."Last Invoice Date")
                {
                    ApplicationArea = All;
                }
                field("Next Invoicing Date"; rec."Next Invoice Date")
                {
                    ApplicationArea = All;
                }
                field("Cancelled Date"; rec."Cancelled Date")
                {
                    ApplicationArea = All;
                }
                field(Active; rec.Active)
                {
                    ApplicationArea = All;
                }
                field("Invoicing Price"; rec."Invoicing Price")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        ShowCustomerField := Rec.GetFilter(rec."Customer No") = '';
    end;

    var
        ShowCustomerField: Boolean;
}