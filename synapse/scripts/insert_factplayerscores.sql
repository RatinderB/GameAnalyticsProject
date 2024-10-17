INSERT INTO GameAnalytics.FactPlayerScores (GameplayID, PlayerID, GameID, Score, Timestamp)
SELECT
    s.GameplayID,
    dp.PlayerID,
    dg.GameID,
    s.Score,
    s.Timestamp
FROM GameAnalytics.StagingPlayerScores s
INNER JOIN GameAnalytics.DimPlayer dp ON s.Player = dp.PlayerName
INNER JOIN GameAnalytics.DimGame dg ON s.Game = dg.GameName;
