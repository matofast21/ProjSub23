pageextension 50103 "CSD ItemCardExt" extends "Item Card"
{
    layout
    {

        addlast(Item)
        {
            field("Subscription Item"; Rec."CSD Subscription Item")
            {
                ApplicationArea = All;
            }
        }
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
        addlast(navigation)
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