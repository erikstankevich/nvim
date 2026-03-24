$file = ".\UpdateHelp"
$minutes = 1
$alpha = "UpdateHelpCreateTask"


$t1 = New-ScheduledTaskTrigger -Daily -At 09:00
$t2 = New-ScheduledTaskTrigger -Once -At 01:00 `
  -RepetitionInterval (New-TimeSpan -Minutes $minutes) `
  -RepetitionDuration (New-TimeSpan -Hours 23 -Minutes 55) 
$t1 = $t2

$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File $file"
$task = New-ScheduledTask -Action $action -Trigger $t1


Register-ScheduledTask $alpha -InputObject $task
