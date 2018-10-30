-- create new table with PK constraint
CREATE TABLE CreditCardDetails (
	CreditCardNumber	char(16)	NOT NULL,
	CreditCardExpDate	date,
	CreditCardName		char(50),
	BillingAddress		char(50),
	BillingCity			char(50),
	BillingState		char(2),
	BillingZip			char(9),
	CONSTRAINT PK_CreditCardDetails PRIMARY KEY CLUSTERED (CreditCardNumber)
);

-- modify an existing PK:
--
-- remove existing PK constraint
ALTER TABLE CreditCardDetails
DROP CONSTRAINT PK_CreditCardDetails;
--
-- add a new PK constraint
ALTER TABLE CreditCardDetails
ADD CONSTRAINT PK_CreditCardDetails PRIMARY KEY CLUSTERED (CreditCardNumber);