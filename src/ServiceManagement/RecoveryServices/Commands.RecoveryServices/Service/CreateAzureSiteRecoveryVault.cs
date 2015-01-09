﻿// ----------------------------------------------------------------------------------
//
// Copyright Microsoft Corporation
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ----------------------------------------------------------------------------------

using System;
using System.Management.Automation;
using Microsoft.Azure.Commands.RecoveryServices.SiteRecovery;
using Microsoft.Azure.Portal.RecoveryServices.Models.Common;
using Microsoft.WindowsAzure.Management.RecoveryServices.Models;
using Microsoft.WindowsAzure.Management.SiteRecovery.Models;

namespace Microsoft.Azure.Commands.RecoveryServices
{
    /// <summary>
    /// Used to initiate a vault create operation.
    /// </summary>
    [Cmdlet(VerbsCommon.New, "AzureSiteRecoveryVault")]
    [OutputType(typeof(string))]
    public class CreateAzureSiteRecoveryVault : RecoveryServicesCmdletBase
    {
        #region Parameters

        /// <summary>
        /// Gets or sets the vault name
        /// </summary>
        [Parameter(ParameterSetName = ASRParameterSets.ByParam, HelpMessage = "Vault Name for which the cred file to be generated")]
        [ValidateNotNullOrEmpty]
        public string Name { get; set; }

        /// <summary>
        /// Gets or sets the location of the vault
        /// </summary>
        [Parameter(ParameterSetName = ASRParameterSets.ByParam, HelpMessage = "Geo Location Name")]
        [ValidateNotNullOrEmpty]
        public string Location { get; set; }

        #endregion

        /// <summary>
        /// ProcessRecord of the command.
        /// </summary>
        public override void ExecuteCmdlet()
        {
            try
            {
                string cloudServiceName = Utilities.GenerateCloudServiceName(this.Location);
                byte[] bytes = System.Text.Encoding.UTF8.GetBytes(cloudServiceName);
                string base64Label = Convert.ToBase64String(bytes);

                CloudServiceCreateArgs cloudServiceCreateArgs = new CloudServiceCreateArgs()
                {
                    GeoRegion = this.Location,
                    Label = base64Label,
                    Description = base64Label
                };

                RecoveryServicesClient.FindOrCreateCloudService(cloudServiceName, cloudServiceCreateArgs);

                VaultCreateArgs vaultCreateArgs = new VaultCreateArgs()
                {
                    Name = this.Name,
                    Plan = string.Empty,
                    ResourceProviderNamespace = "WAHyperVRecoveryManager", // TODO:devsri - do not hard code, find a good place to keep it.
                    Type = Constants.ASRVaulType,
                    ETag = Guid.NewGuid().ToString(),
                    SchemaVersion = Constants.RpSchemaVersion
                };

                Utilities.UpdateVaultSettings(new ASRVaultCreds()
                {
                    CloudServiceName = cloudServiceName,
                    ResourceName = this.Name
                });

                VaultCreateResponse response = RecoveryServicesClient.CreateVault(cloudServiceName, this.Name, vaultCreateArgs);

                this.WriteObject(response.RequestId, true);
            }
            catch (Exception exception)
            {
                this.HandleException(exception);
            }
        }
    }
}
