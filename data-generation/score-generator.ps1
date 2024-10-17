$ehNameSpace = "DataSolutionsEventHub"
$ehName = "datasolutionshub"
$keyname = "senderPolicy"
$key = "cylVKHx6lbAj5KZvREstLas1XEmJhhBaQ+AEhAm1RvE="

# Make no changes beyond this point

while ($true)
{
    #Generate data
    $id = [Guid]::NewGuid().ToString()
    $playerName = @('Henry', 'Gerja', 'Niels', 'Erwin', 'Eduard', 'Hugo', 'Wendy') | Get-Random
    $gameName = @('Racer', 'Shooter', 'Puzzle', 'Strategy') | Get-Random
    $score = Get-Random -Minimum 1 -Maximum 100
    $timestamp = Get-Date -Format "o"

    [Reflection.Assembly]::LoadWithPartialName("System.Web") | Out-Null

    $URI = "{0}.servicebus.windows.net/{1}" -f @($ehNameSpace,$ehName)
    $encodedURI = [System.Web.HttpUtility]::UrlEncode($URI)

    $expiry = [string](([DateTimeOffset]::Now.ToUnixTimeSeconds())+3600)
    $stringToSign = [System.Web.HttpUtility]::UrlEncode($URI) + "`n" + $expiry

    $hmacsha = New-Object System.Security.Cryptography.HMACSHA256
    $hmacsha.key = [Text.Encoding]::UTF8.GetBytes($key)

    $signature = $hmacsha.ComputeHash([Text.Encoding]::ASCII.GetBytes($stringToSign))
    $signature = [System.Web.HttpUtility]::UrlEncode([Convert]::ToBase64String($signature))

    # Create the JSON payload with the id field and proper formatting
    $body = @{
        "id" = $id
        "Player" = $playerName
        "Game" = $gameName
        "Score" = $score
        "Timestamp" = $timestamp
    } | ConvertTo-Json

    Write-Output($body)

    $headers = @{
                "Authorization"="SharedAccessSignature sr=" + $encodedURI + "&sig=" + $signature + "&se=" + $expiry + "&skn=" + $keyname;
                "Content-Type"="application/json"; # must be this
                }

    $method = "POST"
    $dest = 'https://' +$URI  +'/messages?timeout=60&api-version=2014-01'

    Invoke-RestMethod -Uri $dest -Method $method -Headers $headers -Body $body -Verbose

    $delay = Get-Random -Minimum 250 -Maximum 900

    Start-Sleep -Milliseconds $delay
}
