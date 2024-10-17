INSERT INTO GameAnalytics.DimPlayer (PlayerName, IsCurrent, EffectiveDate)
SELECT DISTINCT s.Player, 1, GETDATE()
FROM GameAnalytics.StagingPlayerScores s
LEFT JOIN GameAnalytics.DimPlayer d ON s.Player = d.PlayerName
WHERE d.PlayerName IS NULL;
