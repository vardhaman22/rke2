echo "Installing RemoteAccess, RSAT-RemoteAccess-PowerShell and Routing packages"
Install-WindowsFeature RemoteAccess
Install-WindowsFeature RSAT-RemoteAccess-PowerShell
Install-WindowsFeature Routing
echo "Forcing compilation of RemoteAccess WMI/CIM namespaces on Server 2025..."
mofcomp C:\Windows\System32\wbem\RAMgmtPSProvider.mof
Restart-Service winmgmt -Force
echo "Installing remoteAccess vpntype: routingOnly"
Install-RemoteAccess -VpnType RoutingOnly
