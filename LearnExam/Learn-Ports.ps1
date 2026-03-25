$ImportCsv = (Import-csv .\ports.csv -Delimiter ";")
$min = $Importcsv | Sort-Object Points | Select-Object -First 1
$i =  $ImportCSV.IndexOf($min)

$Port = $ImportCsv[$i].Port
$Port

$ReadHost = Read-Host

$Protocol = $ImportCSv[$i].Protocol
$Protocol

$input = (Read-Host "1 if correct")

if ($input -eq "1")
{
  $ImportCsv[$i].Points = [int]$ImportCSV[$i].Points + 1  
  $Points = $importCSV[$i].Points
  clear
} else { clear }

$Export = [PSCustomObject]@{
  Port = $ImportCSV[$i].Port
  Protocol = $ImportCSV[$i].Protocol
  Points = $Points
}

$ImportCSV | Export-CSV .\ports.csv -Delimiter ";" -NoTypeInformation
