report 50100 "CSD Create Invoices"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Create Invoice';
    ProcessingOnly = True;
    //DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem("CSD Customer Subscription"; "CSD Customer Subscription")
        {
            RequestFilterFields = "Customer No", "Item No.";
            trigger OnPreDataItem();
            begin
                IF NOT CONFIRM(CreateWarningTxt) THEN
                    CurrReport.Quit;
                "CSD Customer Subscription".SETRANGE(Active, TRUE);
                "CSd Customer Subscription".SETFILTER("Next Invoice Date", '<=%1', WORKDATE);
            end;

            trigger OnAfterGetRecord();
            var
                SalesLine: Record "Sales Line";
                OldCustomer: Code[20];
                OldInvoiceDate: Date;
                NextLineNo: Integer;
            begin
                IF (OldCustomer <> "CSd Customer Subscription"."Customer No") OR (OldInvoiceDate <> "CSd Customer Subscription"."Next Invoice Date") THEN BEGIN
                    OldCustomer := "CSD Customer Subscription"."Customer No";
                    OldInvoiceDate := "CSD Customer Subscription"."Next Invoice Date";
                    NextLineNo := 0;
                    CLEAR(SalesHeader);
                    SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
                    SalesHeader.INSERT(TRUE);
                    SalesHeader.VALIDATE("Sell-to Customer No.", "CSd Customer Subscription"."Customer No");
                    SalesHeader.VALIDATE("Location Code", '');
                    SalesHeader.VALIDATE("Posting Date", "CSd Customer Subscription"."Next Invoice Date");
                    SalesHeader.Modify();
                    InvoiceCounter += 1;
                END;
                NextLineNo += 10000;
                SalesLine.INIT;
                SalesLine."Line No." := NextLineNo;
                SalesLine."Document Type" := SalesHeader."Document Type";
                SalesLine."Document No." := SalesHeader."No.";
                SalesLine.VALIDATE("Sell-to Customer No.", SalesHeader."Sell-to Customer No.");
                SalesLine.INSERT;
                SalesLine.VALIDATE(Type, SalesLine.Type::Item);
                SalesLine.VALIDATE("No.", "CSD Customer Subscription"."Item No.");
                SalesLine.VALIDATE(Quantity, 1);
                SalesLine.VALIDATE("Allow Line Disc.", "CSD Customer Subscription"."Allow Line Discount");
                SalesLine.VALIDATE("Unit Price", "CSD Customer Subscription"."Invoicing Price");
                SalesLine.MODIFY;
            end;

            trigger OnPostDataItem();
            var
                InvCounterTXT: label 'Total No. of Invoices created %1', Comment = '%1 %2(s) Created';
            begin

                MESSAGE(InvCounterTxt, InvCounterTXT, SalesHeader."Document Type");
            end;
        }
    }
    var

        CreateWarningTxt: label 'Create subscriptions for all customers?';
        //  InvCounterTxt: label '%1 %2(s) Created';
        InvoiceCounter: Integer;
        SalesHeader: Record "Sales Header";
}