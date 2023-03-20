codeunit 50100 "CSD Subscription Management"
{
    [EventSubscriber(ObjectType::Codeunit, CodeUnit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]

    local procedure UpdateSubscriptionsInformationOnAfterPostSalesDoc(SalesInvHdrNo: Code[20]);

    var
        SalesInvLine: Record "Sales Invoice Line";
        CustSubscription: REcord "CSD Customer Subscription";
        Subscription: Record "CSD Subscriptions";
    begin
        SalesInvLine.SetRange("Document No.", SalesInvHdrNo);
        SalesInvLine.SetRange(Type, SalesInvLine.Type::Item);
        if SalesInvLine.FindSet() then
            repeat
                CustSubscription.SetRange("Customer No", SalesInvLine."Sell-to Customer No.");
                CustSubscription.SetRange("Item No.", SalesInvLine."No.");
                CustSubscription.SetRange("Next Invoice Date", SalesInvLine."Posting Date");
                if CustSubscription.FindFirst() then begin
                    Subscription.Get(CustSubscription."Subscriptions Code");
                    CustSubscription."Last Invoice Date" := SalesInvLine."Posting Date";
                    CustSubscription."Next Invoice Date" := CalcDate(Subscription."Invoicing Frequence");
                    CustSubscription.Modify();
                end
            until SalesInvLine.Next() = 0;




    end;






}

