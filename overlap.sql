CREATE FUNCTION [results].[Tenure_Overlap] (@Bracket_Id INT)
RETURNS INT
AS
BEGIN
	DECLARE @result INT;


	SELECT @result = COUNT(s.[Bracket_Id])
	FROM [results].[TenureBracketsTable] s
	LEFT JOIN [results].[TenureBracketsTable] t
			ON (
					s.[LowerBound] >= t.[LowerBound]
					AND t.[UpperBound] >= s.[LowerBound]
				)
	WHERE s.[Bracket_Id] = @Bracket_Id;
	RETURN @result;
END
