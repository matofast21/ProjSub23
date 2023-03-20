tableextension 50101 "CSD Item_Ext" extends Item
{
    fields
    {
        field(50100; "CSD Subscription Item"; Boolean)
        {
            Caption = 'Subscription Item';
            FieldClass = FlowField;
            CalcFormula = Exist("CSD Subscriptions" WHERE("Item Number" = FIELD("No.")));
            Editable = false;
        }
    }
}