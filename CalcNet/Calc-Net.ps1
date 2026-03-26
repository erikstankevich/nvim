$length = (Import-csv .\data.csv -Delimiter ";").Length
$GetRandom = Get-Random -Maximum $length -Minimum 0


$i =  $GetRandom
$ImportCSV = (Import-csv .\data.csv -Delimiter ";")
$GetDate = Get-Date |
  Select-Object Second

$Second = ($GetDate).Second
$CIDR_IP = $ImportCSV[$i] |
  Select-Object ip, cidr

$SUBNET_IP = $ImportCSV[$i] |
  Select-Object ip, subnet

function AskSubnet ()
{
  $AskSubnet = [PsCustomObject]@{
    Subnet = "?"
  }
  $AskSubnet |
    Format-Table

  $x = Read-Host
  $AskSubnet = [PsCustomObject]@{
    Subnet = $ImportCSV[$i].Subnet
  }
  $AskSubnet | 
    Format-Table
}

function AskCidr ()
{
  $AskCidr = [PsCustomObject]@{
    cidr = "?"
  }
  $AskCidr |
    Format-Table

  $x = Read-Host
  $AskCidr = [PsCustomObject]@{
    cidr = $ImportCSV[$i].cidr 
  }
  $AskCidr | 
    Format-Table
}

function AskLast()
{
  $AskLast = [PsCustomObject]@{
    last_usable = "?"
  }
  $AskLast |
    Format-Table

  $x = Read-Host
  $AskLast = [PsCustomObject]@{
    last_usable = $ImportCSV[$i].last_usable
  }
  $AskLast | 
    Format-Table
}

function AskBroadcast()
{
  $AskBroadcast = [PsCustomObject]@{
    broadcast = "?"
  }
  $AskBroadcast |
    Format-Table

  $x = Read-Host
  $AskBroadcast = [PsCustomObject]@{
    broadcast = $ImportCSV[$i].broadcast
  }
  $AskBroadcast | 
    Format-Table
}


if ($Second %2 -eq 0)
{
  $CIDR_IP
  AskSubnet
  AskLast
  AskBroadcast
}
else
{
  $SUBNET_IP
  AskCidr
  AskLast
  AskBroadcast
}

