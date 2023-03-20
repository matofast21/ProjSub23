table 50101 "CSD Customer Subscription"
{
    Caption = 'Customer Subscription';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Customer No"; Code[20])
        {
            Caption = 'Customer No';
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
                Item: Record item;
            begin
                if xRec."Subscriptions Code" <> Rec."Subscriptions Code" then
                    Rec.TestField("Last Invoice Date", 0D);
                if Subscription.GET("Subscriptions Code") then begin
                    Subscription.TESTFIELD("Invoicing Frequence");
                    Subscription.TESTFIELD("Item Number");
                    "Item No." := Subscription."Item Number";
                    if Subscription."Invoice Pricing" = 0 then begin
                        Item.GET("Item No.");
                        "Invoicing Price" := Item."Unit Price";
                    end else
                        "Invoicing Price" := Subscription."Invoice Pricing";
                    case Subscription."Invoicing Schedule" of
                        Subscription."Invoicing Schedule"::"Beginning of Next Period":
                            "Start Date" := CalcDate('<CM+1D>', WorkDate);

                        Subscription."Invoicing Schedule"::"Beginning of Period":
                            "Start Date" := CALCDATE('-<CM>', WORKDATE);

                        Subscription."Invoicing Schedule"::"End of Period":
                            "Start Date" := CALCDATE('<CM>', WORKDATE);

                        Subscription."Invoicing Schedule"::"Posting Date":
                            "Start Date" := WORKDATE;


                    end;
                    "Next Invoice Date" := "Start Date";
                    Active := TRUE;
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
            Caption = 'Start Date';
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
        field(8; Active; Boolean)
        {
            Caption = 'Active';
        }
        field(9; "Invoicing Price"; Decimal)
        {
            Caption = 'Invoicing Price';
        }
        field(10; "Allow Line Discount"; Boolean)
        {
            Caption = 'Allow Line Discount';
        }

    }

    keys
    {
        key(PK; "Customer No", "Subscriptions Code")
        {
            Clustered = true;
        }
    }

}