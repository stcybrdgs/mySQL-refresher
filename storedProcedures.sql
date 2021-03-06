USE [H+Active]
GO
/****** Object:  StoredProcedure [dbo].[PopularColors]    Script Date: 10/28/2018 1:06:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Stacy
-- Create date: 10-28-2018
-- Description:	Example Procedure
-- =============================================
CREATE PROCEDURE PopularColors 
AS
BEGIN
	SELECT	po.Color, SUM(li.Quantity) AS Qty
	FROM	dbo.ProductOptions AS po INNER JOIN
			dbo.LineItems AS li ON po.OptionID = li.OptionID INNER JOIN
			dbo.Invoices ON li.InvoiceID = dbo.Invoices.InvoiceID
	GROUP BY po.Color
END


-- =============================================
-- Author:		Stacy
-- Create date: 10-28-2018
-- Description:	Find customers by state
-- =============================================
CREATE PROCEDURE findCustomersByState 
	-- Add the parameters for the stored procedure here
	@state char(2) = 'CA'
AS
BEGIN
	SELECT FirstName, LastName, Phone, City, State, Zip
	FROM Customers
	WHERE State = @state;
END
GO


--///////////////////////////////////////////////////
-- to modify your stored procedure, use ALTER PROCEDURE:
ALTER PROCEDURE PopularColors 
AS
BEGIN
	SELECT	po.Color AS productColor, SUM(li.Quantity) AS Qty
	FROM	dbo.ProductOptions AS po INNER JOIN
			dbo.LineItems AS li ON po.OptionID = li.OptionID INNER JOIN
			dbo.Invoices ON li.InvoiceID = dbo.Invoices.InvoiceID
	GROUP BY po.Color
END