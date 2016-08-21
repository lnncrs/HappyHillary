BEGIN TRANSACTION;
CREATE TABLE Persons (
    Id INTEGER PRIMARY KEY,
    Name TEXT);
CREATE TABLE Emails (
    Id INTEGER PRIMARY KEY,
    DocNumber TEXT,
    MetadataSubject TEXT,
    MetadataTo TEXT,
    MetadataFrom TEXT,
    SenderPersonId INTEGER,
    MetadataDateSent TEXT,
    MetadataDateReleased TEXT,
    MetadataPdfLink TEXT,
    MetadataCaseNumber TEXT,
    MetadataDocumentClass TEXT,
    ExtractedSubject TEXT,
    ExtractedTo TEXT,
    ExtractedFrom TEXT,
    ExtractedCc TEXT,
    ExtractedDateSent TEXT,
    ExtractedCaseNumber TEXT,
    ExtractedDocNumber TEXT,
    ExtractedDateReleased TEXT,
    ExtractedReleaseInPartOrFull TEXT,
    ExtractedBodyText TEXT,
    RawText TEXT);
CREATE TABLE EmailReceivers (
    Id INTEGER PRIMARY KEY,
    EmailId INTEGER,
    PersonId INTEGER);
CREATE TABLE Aliases (
    Id INTEGER PRIMARY KEY,
    Alias TEXT,
    PersonId INTEGER);
CREATE INDEX emails_senderpersonid_ix ON Emails (SenderPersonId);
CREATE INDEX emails_docnumber_ix ON Emails (DocNumber);
CREATE INDEX emailreceivers_personid_ix ON EmailReceivers (PersonId);
CREATE INDEX emailreceivers_emailid_ix ON EmailReceivers (EmailId);
CREATE INDEX aliases_personid_ix ON Aliases (PersonId);
COMMIT;
