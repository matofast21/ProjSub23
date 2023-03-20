pageextension 50100 " CSD CustomerCard_Ext" extends "Customer Card"
{
    layout
    {
        addlast(General)
    { 
        field("CSD Subscription Customer";rec."Subscription Customer") 
        { 
            ApplicationArea=All; 
            } 

            } addfirst(FactBoxes) 
            { 
                part("Subscription Factbox";"CSD Subscription Factbox") 
                {
                     SubPageLink="Customer No"=FIELD("No."); ApplicationArea=All; 
                     } } } 
                     actions 
                     { 
                       
                         addafter(Contact) 
                         { action("Subscriptions") 
                         { 
                             ApplicationArea=All; 
                             Caption = 'Subscriptions';
                              RunObject = page "CSD Customer Subscriptions";
                                              RunPageLink = "Customer No"=FIELD("No."); 
                              image = InsuranceRegisters; Promoted=true; PromotedCategory=Process; } } } }