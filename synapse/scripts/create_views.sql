CREATE VIEW GameAnalytics.vw_TopScoresPerGame AS
SELECT
    dg.GameName,
    dp.PlayerName,
    fps.Score,
    CAST(fps.Timestamp AS DATE) AS Date,
    ROW_NUMBER() OVER (PARTITION BY dg.GameName ORDER BY fps.Score DESC) AS Rank
FROM
    GameAnalytics.FactPlayerScores fps
    INNER JOIN GameAnalytics.DimPlayer dp ON fps.PlayerID = dp.PlayerID
    INNER JOIN GameAnalytics.DimGame dg ON fps.GameID = dg.GameID;


CREATE VIEW GameAnalytics.vw_PlayerPerformance AS
SELECT
    dp.PlayerName,
    dg.GameName,
    fps.Score,
    CAST(fps.Timestamp AS DATE) AS Date
FROM
    GameAnalytics.FactPlayerScores fps
    INNER JOIN GameAnalytics.DimPlayer dp ON fps.PlayerID = dp.PlayerID
    INNER JOIN GameAnalytics.DimGame dg ON fps.GameID = dg.GameID;


CREATE VIEW GameAnalytics.vw_GameStatistics AS
SELECT
    dg.GameName,
    COUNT(fps.GameplayID) AS TotalGameplays,
    AVG(fps.Score) AS AverageScore
FROM
    GameAnalytics.FactPlayerScores fps
    INNER JOIN GameAnalytics.DimGame dg ON fps.GameID = dg.GameID
GROUP BY
    dg.GameName;
