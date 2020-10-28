#
# Module manifest for module 'Az'
#
# Generated by: Microsoft Corporation
#
# Generated on: 10/28/2020
#

@{

# Script module or binary module file associated with this manifest.
# RootModule = ''

# Version number of this module.
ModuleVersion = '53.0.0'

# Supported PSEditions
CompatiblePSEditions = 'Core', 'Desktop'

# ID used to uniquely identify this module
GUID = 'd48d710e-85cb-46a1-990f-22dae76f6b5f'

# Author of this module
Author = 'Microsoft Corporation'

# Company or vendor of this module
CompanyName = 'Microsoft Corporation'

# Copyright statement for this module
Copyright = 'Microsoft Corporation. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Microsoft Azure PowerShell - Cmdlets to manage resources in Azure. This module is compatible with WindowsPowerShell and PowerShell Core.
For more information about the Az module, please visit the following: https://docs.microsoft.com/en-us/powershell/azure/'

# Minimum version of the PowerShell engine required by this module
PowerShellVersion = '5.1'

# Name of the PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
DotNetFrameworkVersion = '4.7.2'

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# ClrVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @(@{ModuleName = 'Az.Accounts'; ModuleVersion = '0.1.0'; }, 
               @{ModuleName = 'Az.Advisor'; RequiredVersion = '1.1.1'; }, 
               @{ModuleName = 'Az.Aks'; RequiredVersion = '0.1.0'; }, 
               @{ModuleName = 'Az.AnalysisServices'; RequiredVersion = '1.1.4'; }, 
               @{ModuleName = 'Az.ApiManagement'; RequiredVersion = '2.1.0'; }, 
               @{ModuleName = 'Az.ApplicationInsights'; RequiredVersion = '1.1.0'; }, 
               @{ModuleName = 'Az.Automation'; RequiredVersion = '1.4.0'; }, 
               @{ModuleName = 'Az.Batch'; RequiredVersion = '3.1.0'; }, 
               @{ModuleName = 'Az.Billing'; RequiredVersion = '0.1.0'; }, 
               @{ModuleName = 'Az.Cdn'; RequiredVersion = '0.1.0'; }, 
               @{ModuleName = 'Az.CognitiveServices'; RequiredVersion = '0.1.0'; }, 
               @{ModuleName = 'Az.Compute'; RequiredVersion = '0.1.0'; }, 
               @{ModuleName = 'Az.ContainerInstance'; RequiredVersion = '1.0.3'; }, 
               @{ModuleName = 'Az.ContainerRegistry'; RequiredVersion = '1.1.1'; }, 
               @{ModuleName = 'Az.DataBoxEdge'; RequiredVersion = '1.1.0'; }, 
               @{ModuleName = 'Az.Databricks'; RequiredVersion = '1.0.1'; }, 
               @{ModuleName = 'Az.DataFactory'; RequiredVersion = '0.1.0'; }, 
               @{ModuleName = 'Az.DataLakeAnalytics'; RequiredVersion = '1.0.2'; }, 
               @{ModuleName = 'Az.DataLakeStore'; RequiredVersion = '1.2.8'; }, 
               @{ModuleName = 'Az.DataShare'; RequiredVersion = '1.0.0'; }, 
               @{ModuleName = 'Az.DesktopVirtualization'; RequiredVersion = '1.0.0'; }, 
               @{ModuleName = 'Az.DeploymentManager'; RequiredVersion = '1.1.0'; }, 
               @{ModuleName = 'Az.DevTestLabs'; RequiredVersion = '1.0.2'; }, 
               @{ModuleName = 'Az.Dns'; RequiredVersion = '1.1.2'; }, 
               @{ModuleName = 'Az.EventGrid'; RequiredVersion = '1.3.0'; }, 
               @{ModuleName = 'Az.EventHub'; RequiredVersion = '1.7.0'; }, 
               @{ModuleName = 'Az.FrontDoor'; RequiredVersion = '1.6.1'; }, 
               @{ModuleName = 'Az.Functions'; RequiredVersion = '1.0.2'; }, 
               @{ModuleName = 'Az.HDInsight'; RequiredVersion = '0.1.0'; }, 
               @{ModuleName = 'Az.HealthcareApis'; RequiredVersion = '1.1.0'; }, 
               @{ModuleName = 'Az.IotHub'; RequiredVersion = '2.6.0'; }, 
               @{ModuleName = 'Az.KeyVault'; RequiredVersion = '0.1.0'; }, 
               @{ModuleName = 'Az.Kusto'; RequiredVersion = '1.0.0'; }, 
               @{ModuleName = 'Az.LogicApp'; RequiredVersion = '1.3.2'; }, 
               @{ModuleName = 'Az.MachineLearning'; RequiredVersion = '1.1.3'; }, 
               @{ModuleName = 'Az.Maintenance'; RequiredVersion = '1.1.0'; }, 
               @{ModuleName = 'Az.ManagedServices'; RequiredVersion = '0.1.0'; }, 
               @{ModuleName = 'Az.MarketplaceOrdering'; RequiredVersion = '1.0.2'; }, 
               @{ModuleName = 'Az.Media'; RequiredVersion = '1.1.1'; }, 
               @{ModuleName = 'Az.Monitor'; RequiredVersion = '2.2.0'; }, 
               @{ModuleName = 'Az.Network'; RequiredVersion = '0.1.0'; }, 
               @{ModuleName = 'Az.NotificationHubs'; RequiredVersion = '1.1.1'; }, 
               @{ModuleName = 'Az.OperationalInsights'; RequiredVersion = '2.3.0'; }, 
               @{ModuleName = 'Az.PolicyInsights'; RequiredVersion = '1.3.1'; }, 
               @{ModuleName = 'Az.PowerBIEmbedded'; RequiredVersion = '1.1.2'; }, 
               @{ModuleName = 'Az.PrivateDns'; RequiredVersion = '1.0.3'; }, 
               @{ModuleName = 'Az.RecoveryServices'; RequiredVersion = '0.1.0'; }, 
               @{ModuleName = 'Az.RedisCache'; RequiredVersion = '1.4.0'; }, 
               @{ModuleName = 'Az.Relay'; RequiredVersion = '1.0.3'; }, 
               @{ModuleName = 'Az.Resources'; RequiredVersion = '0.1.0'; }, 
               @{ModuleName = 'Az.ServiceBus'; RequiredVersion = '1.4.1'; }, 
               @{ModuleName = 'Az.ServiceFabric'; RequiredVersion = '2.2.0'; }, 
               @{ModuleName = 'Az.SignalR'; RequiredVersion = '1.2.0'; }, 
               @{ModuleName = 'Az.Sql'; RequiredVersion = '0.1.0'; }, 
               @{ModuleName = 'Az.SqlVirtualMachine'; RequiredVersion = '1.1.0'; }, 
               @{ModuleName = 'Az.Storage'; RequiredVersion = '0.1.0'; }, 
               @{ModuleName = 'Az.StorageSync'; RequiredVersion = '1.3.0'; }, 
               @{ModuleName = 'Az.StreamAnalytics'; RequiredVersion = '1.0.1'; }, 
               @{ModuleName = 'Az.Support'; RequiredVersion = '1.0.0'; }, 
               @{ModuleName = 'Az.TrafficManager'; RequiredVersion = '1.0.4'; }, 
               @{ModuleName = 'Az.Websites'; RequiredVersion = '0.1.0'; })

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @()

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'Azure','ARM','ResourceManager','Linux','AzureAutomationNotSupported'

        # A URL to the license for this module.
        LicenseUri = 'https://aka.ms/azps-license'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/Azure/azure-powershell'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '53.0.0 - August 2020
Az.Accounts
* Fixed DateTime parse issue in common libraries [#13045]

Az.Aks
* Added client side parameter validation logic for ''New-AzAksCluster'', ''Set-AzAksCluster'' and ''New-AzAksNodePool''. [#12372]
* Added support for add-ons in ''New-AzAksCluster''. [#11239]
* Added cmdlets ''Enable-AzAksAddOn'' and ''Disable-AzAksAddOn'' for add-ons. [#11239]
* Added parameter ''GenerateSshKey'' for ''New-AzAksCluster''. [#12371]
* Updated api version to 2020-06-01.

Az.Billing
* Updated assembly version of consumption cmdlets

Az.Cdn
* Fixed ChinaCDN related pricing SKU display

Az.CognitiveServices
* Added ''New-AzCognitiveServicesAccountApiProperty'' cmdlet.
* Supported ''ApiProperty'' parameter for ''New-AzCognitiveServicesAccount'' and ''Set-AzCognitiveServicesAccount''

Az.Compute
* Fixed issue in ''Update-ASRRecoveryPlan'' by populating FailoverTypes
* Added the ''-Top'' and ''-OrderBy'' optional parameters to the ''Get-AzVmImage'' cmdlet. 

Az.ContainerRegistry
* Update references in .psd1 to use relative path

Az.DataFactory
* Fixed typo in output messages

Az.DesktopVirtualization
* Require Location property for creating top level arm objects.
        * Made `ApplicationGroupType` required for `New-AzWvdApplicationGroup`.
        * Made `HostPoolArmPath` required for `New-AzWvdApplicationGroup`.
        * Added `PreferredAppGroupType` for `New-AzWvdHostPool`.

Az.Functions
* Removed the ability to create v2 Functions in regions that do not support it.
* Deprecated PowerShell 6.2. Added a warning for when a user creates a PowerShell 6.2 function app that advises them to create a PowerShell 7.0 function app instead.

Az.HDInsight
* Added warning message for planning to deprecate the parameters ''PublicNetworkAccessType'' and ''OutboundPublicNetworkAccessType''
* Added warning message for planning to replace the parameter ''DefaultStorageAccountName'' with ''StorageAccountResourceId''
* Added warning message for planning to replace the parameter ''DefaultStorageAccountKey'' with ''StorageAccountKey''
* Added warning message for planning to replace the parameter ''DefaultStorageAccountType'' with ''StorageAccountType''
* Added warning message for planning to replace the parameter ''DefaultStorageContainer'' with ''StorageContainer''
* Added warning message for planning to replace the parameter ''DefaultStorageRootPath'' with ''StorageRootPath''

Az.KeyVault
* Provided the detailed date of removing property SecretValueText

Az.ManagedServices
* Updated breaking change warnings on cmdlets of managed services assignment and definition

Az.Network
* Added Office365 Policy to VPNSite Resource
    - ''New-AzO365PolicyProperty''

Az.RecoveryServices
* Added container name validation for workload backup.

Az.Resources
* Added missing check for Set-AzRoleAssignment
* Added breaking change attribute to ''SubscriptionId'' parameter of ''Get-AzResourceGroupDeploymentOperation''
* Updated ARM template What-If cmdlets to show ''Ignore'' resource changes last
* Fixed secure and array parameter serialization issues for deployment cmdlets [#12773]

Az.Sql
* Added BackupStorageRedundancy to the following: 
    - ''Restore-AzureRmSqlDatabase''
    - ''New-AzSqlDatabaseCopy''
    - ''New-AzSqlDatabaseSecondary''
* Removed case sensitivity for BackupStorageRedundancy parameter for all SQL DB references 
* Updated BackupStorageRedundancy warning message names

Az.Storage
* Supported enable/disable/get share soft delete properties on file Service of a Storage account
    - ''Update-AzStorageFileServiceProperty''
    - ''Get-AzStorageFileServiceProperty''
* Supported list file shares include the deleted ones of a Storage account, and Get single file share usage
    - ''Get-AzRmStorageShare''
* Supported restore a deleted file share
    - ''Restore-AzRmStorageShare''
* Changed the cmdlets for modify blob service properties, won''t get the original properties from server, but only set the modified properties to server.
    - ''Enable-AzStorageBlobDeleteRetentionPolicy''
    - ''Disable-AzStorageBlobDeleteRetentionPolicy''  
    - ''Enable-AzStorageBlobRestorePolicy''
    - ''Disable-AzStorageBlobRestorePolicy''
    - ''Update-AzStorageBlobServiceProperty''
* Fixed help issue for New-AzStorageAccount parameter -Kind default value [#12189]
* Fixed issue by add example to show how to set correct ContentType in blob upload [#12989]

Az.Websites
* Added support to perform operations for Slots not in the same resource group as the App Service Plan
'

        # Prerelease string of this module
        # Prerelease = ''

        # Flag to indicate whether the module requires explicit user acceptance for install/update/save
        # RequireLicenseAcceptance = $false

        # External dependent modules of this module
        # ExternalModuleDependencies = @()

    } # End of PSData hashtable

 } # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

