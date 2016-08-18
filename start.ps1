[CmdletBinding()]
Param(
	[Parameter(Mandatory=$True,
		HelpMessage='Username')]
	[string]$theUsername,

	[Parameter(Mandatory=$True,
		HelpMessage='Password')]
	[string]$thePassword
)

# Delay for 5 minutes to allow VM installation to complete?
Start-Sleep -s 300

# Installs TFS 2015 update 3 using a default "Standard" configuration.

$tfs_url = "http://go.microsoft.com/fwlink/?LinkId=615439"
$output = "c:\temp\tfs_server.exe"

If (-Not(Test-Path "c:\temp"))
{
    New-Item -ItemType Directory "c:\temp"
}

# Download the installer file
Invoke-WebRequest -Uri $tfs_url -OutFile $output

# Install Quietly
Start-Process -Wait -FilePath "c:\temp\tfs_server.exe" -ArgumentList "/quiet" -NoNewWindow

# Delay again, to make sure that the installation is complete
Start-Sleep -s 150

# Configure TFS using default options
.\PsExec.exe -accepteula -h -u $theUsername -p $thePassword `
"C:\Program Files\Microsoft Team Foundation Server 14.0\Tools\tfsconfig.exe" `
unattend /configure /type:standard

# Allow public through firewall
netsh advfirewall firewall set rule name='Team Foundation Server:8080' new profile='any'
