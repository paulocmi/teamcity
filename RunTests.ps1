trap
{
    Write-Error $_
    exit 1
}
function Exec
{
    [CmdletBinding()]
    param (
        [Parameter(Position=0, Mandatory=1)]
        [scriptblock]$Command,
        [Parameter(Position=1, Mandatory=0)]
        [string]$ErrorMessage = "Execution of command failed.`n$Command"
    )
    & $Command
    if ($LastExitCode -ne 0) {
        throw "Exec: $ErrorMessage"
    }
}

Exec { npm install -g newman }
Exec { npm install newman }
Exec { npm install -g newman-reporter-teamcity }
Exec { npm install newman-reporter-teamcity }
Exec { newman run tests/00_TeamCity.postman_collection -g environments/globals.postman_globals.json -r cli`,teamcity --disable-unicode --no-color }