INSERT INTO GameAnalytics.DimGame (GameName, IsCurrent, EffectiveDate)
SELECT DISTINCT s.Game, 1, GETDATE()
FROM GameAnalytics.StagingPlayerScores s
LEFT JOIN GameAnalytics.DimGame d ON s.Game = d.GameName
WHERE d.GameName IS NULL;
