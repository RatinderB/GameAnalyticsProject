SELECT
    id,
    Player,
    Game,
    Score,
    Timestamp
INTO
    [CosmosDBOutput]
FROM
    [datasolutionshub]

SELECT
    id AS GameplayID,
    Player,
    Game,
    Score,
    Timestamp
INTO
    [SynapseOutput]
FROM
    [datasolutionshub]
