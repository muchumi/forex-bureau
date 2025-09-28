codeunit 50100 "Forex Audit Trail Management"
{
    Subtype = Normal;

    // -------------------------------
    // Insert
    // -------------------------------
    [EventSubscriber(ObjectType::Table, Database::"ForexTransaction", 'OnAfterInsertEvent', '', false, false)]
    local procedure LogInsert(var Rec: Record "ForexTransaction")
    var
        AuditTrail: Record "Forex Audit Trail";
    begin
        AuditTrail.Init();
        AuditTrail."TransactionNo." := Rec."TransactionNo.";
        AuditTrail."CustomerIDNo." := Rec."CustomerIDNo.";
        AuditTrail."UserID" := UserId();
        AuditTrail."Date" := Today();
        AuditTrail."Time" := Time();
        AuditTrail."ActionType" := AuditTrail."ActionType"::Insert;
        AuditTrail."FieldName" := '';
        AuditTrail."OldValue" := '';
        AuditTrail."NewValue" := 'New record created';
        AuditTrail.Insert();
    end;

    // -------------------------------
    // Modify
    // -------------------------------
    [EventSubscriber(ObjectType::Table, Database::"ForexTransaction", 'OnAfterModifyEvent', '', false, false)]
    local procedure LogModify(var Rec: Record "ForexTransaction"; xRec: Record "ForexTransaction")
    var
        AuditTrail: Record "Forex Audit Trail";
        FieldRefRec: RecordRef;
        FieldRefxRec: RecordRef;
        Field: FieldRef;
        xField: FieldRef;
        i: Integer;
    begin
        FieldRefRec.Open(Database::"ForexTransaction");
        FieldRefxRec.Open(Database::"ForexTransaction");

        FieldRefRec.GetTable(Rec);
        FieldRefxRec.GetTable(xRec);

        for i := 1 to FieldRefRec.FieldCount do begin
            Field := FieldRefRec.FieldIndex(i);
            xField := FieldRefxRec.FieldIndex(i);

            if Format(Field.Value) <> Format(xField.Value) then begin
                AuditTrail.Init();
                AuditTrail."TransactionNo." := Rec."TransactionNo.";
                AuditTrail."CustomerIDNo." := Rec."CustomerIDNo.";
                AuditTrail."UserID" := UserId();
                AuditTrail."Date" := Today();
                AuditTrail."Time" := Time();
                AuditTrail."ActionType" := AuditTrail."ActionType"::Modify;
                AuditTrail."FieldName" := Field.Caption;
                AuditTrail."OldValue" := Format(xField.Value);
                AuditTrail."NewValue" := Format(Field.Value);
                AuditTrail.Insert();
            end;
        end;

        FieldRefRec.Close();
        FieldRefxRec.Close();
    end;

    // -------------------------------
    // Delete
    // -------------------------------
    [EventSubscriber(ObjectType::Table, Database::"ForexTransaction", 'OnAfterDeleteEvent', '', false, false)]
    local procedure LogDelete(var Rec: Record "ForexTransaction")
    var
        AuditTrail: Record "Forex Audit Trail";
    begin
        AuditTrail.Init();
        AuditTrail."TransactionNo." := Rec."TransactionNo.";
        AuditTrail."CustomerIDNo." := Rec."CustomerIDNo.";
        AuditTrail."UserID" := UserId();
        AuditTrail."Date" := Today();
        AuditTrail."Time" := Time();
        AuditTrail."ActionType" := AuditTrail."ActionType"::Delete;
        AuditTrail."FieldName" := '';
        AuditTrail."OldValue" := 'Record deleted';
        AuditTrail."NewValue" := '';
        AuditTrail.Insert();
    end;
}
