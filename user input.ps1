Function Select-Location {
    try{
    Clear-Host
    $Latitude, $Longitude = Read-Host "Please input the Logitude and Latitude for your location"
    $Url = "https://api.weather.gov/points/$Latitude$Longitude"
    $location = Invoke-RestMethod -Uri $Url
    return $location.properties.forecast
    }

    catch{"an error occured, please ensure your location is in {Latitude},{Longitude} format and try again"
    read-host "Press ENTER to try again"
    Select-Location
    }
}

Function Get-Weather($url) {
    try{
    Clear-Host
    $result = invoke-restmethod -uri $url
    $output = $result.properties.periods | select name, temperature, windSpeed, windDirection, detailedForecast

    return $output
    }
    catch{"An error occurred, please try again later"
    }
}
                                 
Function __main__ {
$url = Select-Location
Get-Weather($url)
}

__main__