report 50100 "CSD Create Invoices"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Create Invoice';
    ProcessingOnly= True;
    //DefaultRenderingLayout = LayoutName;
    
    dataset
    {
        dataitem("CSD Customer Subscription"; "CSD Customer Subscription")
        {
            column(ColumnName; SourceFieldName)
            {
                
            }
        }
    }
    
   
    
        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;
                    
                }
            }
        }
    }
    
    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'mylayout.rdl';
        }
    }
    
    var
        myInt: Integer;
}