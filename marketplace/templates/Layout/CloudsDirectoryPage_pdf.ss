<div class="grey-bar">
    <h1>$Name</h1>
</div>
<div class="container marketplace-content">
    <table width="540px">
        <tr>
            <td rowspan="5" valign="top" style="width:140px;padding-right:15px">
                $Company.SmallLogoPreview(150)
                <h2 style="color: {$Company.CompanyColorRGB} !important;">About $Company.Name</h2>
                <p>$Company.Overview</p>
                <hr>
                <div class="pullquote">
                    <h2 style="color: {$Company.CompanyColorRGB} !important;">$Company.Name Commitment</h2>
                    <div <% if Company.CommitmentAuthor %>class="commitment"<% end_if %>>$Company.Commitment</div>
                    <% if Company.CommitmentAuthor %>
                    <p class="author">&mdash;$Company.CommitmentAuthor, $Company.Name</p>
                    <% end_if %>
                </div>
            </td>
            <td colspan="2" valign="top" style="width:400px;padding-left:15px;">
                <div class="info-area">
                    <h1 style="color: {$Company.CompanyColorRGB} !important;">
                        $Name
                    </h1>
                    <p>$Overview</p>
                </div>
            </td>
        </tr>
        <tr>
            <td valign="top" style="width:200px;padding-left:15px;">
                <div class="info-area">
                    <% if HyperVisors %>
                        <h3 style="color: {$Company.CompanyColorRGB} !important;">Supported Hypervisors</h3>
                        <p>
                        <% loop HyperVisors %>
                            <% if First == 0  %>,<% end_if %>
                            $Type
                        <% end_loop %>
                        </p>
                    <% end_if %>
                    <% if Guests %>
                        <h3 style="color: {$Company.CompanyColorRGB} !important;">Supported Guests</h3>
                        <p>
                        <% loop Guests %>
                            <% if First == 0  %>,<% end_if %>
                            $Type
                        <% end_loop %>
                        </p>
                    <% end_if %>
                    <% if DataCenterRegions %>
                        <hr>
                        <h3 style="color: {$Company.CompanyColorRGB} !important;">Regions</h3>
                        <table class="regions">
                            <tbody>
                            <% loop DataCenterRegions %>
                            <tr>
                                <td class="region-key">
                                    <span style="background-color: #{$Color}"></span>
                                </td>
                                <td>$Name</td>
                            </tr>
                            <% end_loop %>
                            </tbody>
                        </table>
                    <% end_if %>
                    <% if DataCenters %>
                        <hr>
                        <h3 style="color: {$Company.CompanyColorRGB} !important;" >Data Center Locations</h3>
                        <p>
                            <% loop DataCenters %>
                                <% if First == 0  %>,<% end_if %>
                                $City
                            <% end_loop %>
                        </p>
                        <div style="width: 300px; height: 200px; position: relative;" tabindex="0">
                            <% if IsDraft  %>
                                <img src="$Top.CurrentDataCenterStaticMapDraftForPDF" />
                            <% else %>
                                <img src="$Top.CurrentDataCenterStaticMapForPDF" />
                            <% end_if %>
                        </div>
                        <p>Click any location to see availability zones and API endpoints</p>
                    <% end_if %>
                    <% if RegionalSupports %>
                        <hr>
                        <h3 style="color: {$Company.CompanyColorRGB} !important;">Regions where support is offered</h3>
                        <table class="regions">
                            <tbody>
                                <% loop RegionalSupports %>
                                <tr>
                                    <% loop Region %>
                                        <td>$Name</td>
                                    <% end_loop %>
                                </tr>
                                <% end_loop %>
                            </tbody>
                        </table>
                    <% end_if %>
                    <% if Capabilities %>
                        <hr>
                        <h3 style="color: {$Company.CompanyColorRGB} !important;">OpenStack API Coverage</h3>
                        <table class="api-coverage">
                            <tbody>
                                <% loop Capabilities %>
                                    <% if SupportsVersioning %>
                                        <% loop ReleaseSupportedApiVersion %>
                                            <% if ApiVersion %>
                                                <% loop OpenStackComponent %>
                                                    <tr>
                                                        <td>
                                                            $Name API
                                                            <% if SupportsExtensions %> & Extensions<% end_if %>
                                                        </td>
                                                        <td>
                                                            $CodeName
                                                <% end_loop %>
                                                            <% loop ApiVersion %> $Version<% end_loop %>
                                                        </td>

                                            <% end_if %>
                                        <% end_loop %>
                                        <td class="coverage">
                                            <span>$CoveragePercent %</span>
                                        </td>
                                    </tr>
                                    <% end_if %>
                                <% end_loop %>
                            </tbody>
                        </table>
                    <% end_if %>
                </div>
            </td>
            <td valign="top" style="width:200px;padding-left:15px;padding-right:15px">
                <% if Capabilities %>
                    <h3 style="color: {$Company.CompanyColorRGB} !important;">OpenStack Services Offered</h3>
                    <table>
                        <tbody>
                        <tr>
                            <th width="50%">Service</th>
                            <th>OpenStack Version</th>
                        </tr>
                            <% loop Capabilities %>
                            <tr>
                                <td>
                                    <% loop ReleaseSupportedApiVersion %>
                                        <% loop OpenStackComponent %>
                                            $Name
                                        <% end_loop %>
                                    <% end_loop %>
                                </td>
                                <td>
                                    <% loop ReleaseSupportedApiVersion %>
                                        <% loop Release %>
                                            $Name
                                        <% end_loop %>
                                    <% end_loop %>
                                </td>
                            </tr>
                            <% end_loop %>
                        </tbody>
                    </table>
                    <hr>
                <% end_if %>
                <% if Top.PricingSchemas %>
                    <h3 style="color: {$Company.CompanyColorRGB} !important;">Pricing Options</h3>
                    <table class="pricing">
                        <tbody>
                        <% if IsDraft  %>
                            <% loop Top.PricingSchemasDraftForPDF %>
                                <tr>
                                    <td>$Type</td>
                                    <td id="enabled_{$ID}"><% if Enabled==1 %>Yes<% else %>No<% end_if %></td>
                                </tr>
                            <% end_loop %>
                        <% else %>
                            <% loop Top.PricingSchemasForPDF %>
                                <tr>
                                    <td>$Type</td>
                                    <td id="enabled_{$ID}"><% if Enabled==1 %>Yes<% else %>No<% end_if %></td>
                                </tr>
                            <% end_loop %>
                        <% end_if %>

                        </tbody>
                    </table>
                    <hr>
                <% end_if %>
                <div id="reviews" style="min-height: 400px;">
                    <h3 style="color: {$Company.CompanyColorRGB} !important;">Reviews</h3>
                    <p>* No Reviews available on preview mode.</p>
                    <!--This script should be places anywhere on a page you want to see rating box-->
                    <div style='font-size:10px'>Powered by Rating-System.com</div>
                    <!-- DO NOT REMOVE THE LAST LINE, please contact us first if you need to do it -->
                </div>
                <% if Videos %>
                    <hr>
                    <div id="videos">
                    <% loop Videos %>
                        <h3 style="color: {$Top.Company.CompanyColorRGB} !important;" class="video-title">$Name<span class="video-duration">($FormattedLength)</span></h3>
                        <a href="//www.youtube.com/embed/{$YouTubeId}"> Video </a>
                    <% end_loop %>
                   </div>
                <% end_if %>
                <% if Resources %>
                    <hr>
                    <div id="more-resources">
                        <h3 style="color: {$Company.CompanyColorRGB} !important;">More Resources</h3>
                        <ul>
                            <% loop Resources %>
                                <li style="color: {$Company.CompanyColorRGB}>$Name</li>
                            <% end_loop %>
                        </ul>
                    </div>
                <% end_if %>
            </td>
        </tr>
        <tr><td></td><td></td></tr>
        <tr><td></td><td></td></tr>
        <tr><td></td><td></td></tr>
        <tr><td></td><td></td></tr>
    </table>
</div>