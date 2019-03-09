<aura:application >
 
    <!-- Include the SLDS static resource (adjust to match package version) -->

    <ltng:require styles="/resource/slds201/assets/styles/salesforce-lightning-design-system.min.css"/>
    <div class="slds">
        <div class="slds-page-header">
          <div class="slds-grid">
            <div class="slds-col slds-has-flexi-truncate">
              <p class="slds-text-heading--label">Camping</p>
              <div class="slds-grid">
                <div class="slds-grid slds-type-focus slds-no-space">
                  <h1 class="slds-text-heading--medium slds-truncate" title="Camping List">Camping List</h1>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="slds-col--padded slds-p-top--large">
            <c:campingList />
        </div>
    </div>     

    <c:helloPlayground />
</aura:application>