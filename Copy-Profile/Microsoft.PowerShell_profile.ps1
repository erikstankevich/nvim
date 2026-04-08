$PrintPDF = 'Microsoft Print to PDF'


function Upload-Git 
{
  git add -A
  git commit -m (Get-Date)
  git push
}


Set-PSReadLineOption -EditMode Vi


function Test-Connection-t {
  while ($true) {
   Test-Connection 8.8.8.8 -Count 1
   Start-Sleep -Seconds 1
  }
}

