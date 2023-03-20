pageextension 50104 "Item List Ext" extends "Item List"
{
    layout
    {
        addfirst(FactBoxes)
        {
            part("Subscription Factbox"; "CSD Subscription Factbox")
            {
                SubPageLink = "Item No." = FIELD("No.");
                ApplicationArea = All;
            }
        }
    }
    actions
    {

        addlast
                         (navigation)
        {
            action("Subscriptions")
            {
                ApplicationArea = All;
                Caption = 'Subscriptions';
                RunObject = page "CSD Customer Subscriptions";
                RunPageLink = "Item No." = FIELD("No.");
                image = InsuranceRegisters;
                Promoted = true;
                PromotedCategory = Process;
            }
        }
    }
}