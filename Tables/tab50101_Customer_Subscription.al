table 50101 "CSD Customer Subscriptiom"
{
    Caption = 'Customer Subscription';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1;"Customer Code"; Code[20])
        {   
            Caption = 'Customer Code';
            DataClassification = CustomerContent;
            TableRelation = Customer;
            
        }
        field(2; "Subscriptions Code"; Code[10])
        {   
            Caption = 'Subscriptions Code';
            DataClassification = CustomerContent;
            TableRelation = "CSD Subscriptions";

            trigger OnValidate()
            var
                Subscription: Record "CSD Subscriptions";
            begin
                if xRec."Subscriptions Code"<> Rec."Subscriptions Code" then
                Rec.TestField("Last Invoice Date", 0D);
                
            end;
        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
            TableRelation = Item;
        }
        field(4; "Start Date"; Date)
        {
            Caption= 'Start Date';
            DataClassification = CustomerContent;
        }
        field(5; "Last Invoice Date"; Date)
        {
            Caption = 'Last Invoice Date';
            DataClassification = CustomerContent;
        }
        field(6; "Next Invoice Date"; Date)
        {
            Caption = 'Next Invoice Date';
            DataClassification = CustomerContent;
        }
        field(7; "Cancelled Date"; Date)
        {   
            Caption = 'Cancelled Date';
            DataClassification = CustomerContent;
        }

    }
    
    keys
    {
        key(Key1; MyField)
        {
            Clustered = true;
        }
    }
    
    var
        myInt: Integer;
    
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}