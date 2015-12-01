
<% require themedCSS(filter) %>

<h1>OpenStack Foundation: Speaker Directory</h1>

<form id="search_form" action="/community/speakers/results" method="get" enctype="application/x-www-form-urlencoded">
    <fieldset>
        <label class="left" for="search_form_input">Search Speaker</label>
        <div class="middleColumn">
            <input id="search_form_input" class="text form-control acInput" name="search_query" placeholder="first name, last name, country, expertise" />
        </div>

        <input type="submit" class="action" value="Go" />
    </fieldset>
</form>


<p class="linkLetters">

<a href="{$Link}?letter=A">A</a><a href="{$Link}?letter=B">B</a><a href="{$Link}?letter=C">C</a><a href="{$Link}?letter=D">D</a><a href="{$Link}?letter=E">E</a><a href="{$Link}?letter=F">F</a><a href="{$Link}?letter=G">G</a><a href="{$Link}?letter=H">H</a><a href="{$Link}?letter=I">I</a><a href="{$Link}?letter=J">J</a><a href="{$Link}?letter=K">K</a><a href="{$Link}?letter=L">L</a><a href="{$Link}?letter=M">M</a><a href="{$Link}?letter=N">N</a><a href="{$Link}?letter=O">O</a><a href="{$Link}?letter=P">P</a><a href="{$Link}?letter=Q">Q</a><a href="{$Link}?letter=R">R</a><a href="{$Link}?letter=S">S</a><a href="{$Link}?letter=T">T</a><a href="{$Link}?letter=U">U</a><a href="{$Link}?letter=V">V</a><a href="{$Link}?letter=W">W</a><a href="{$Link}?letter=X">X</a><a href="{$Link}?letter=Y">Y</a><a href="{$Link}?letter=Z">Z</a><a class="intl" href="{$Link}?letter=intl">International Characters</a>
</p>

<% loop SpeakerList.GroupedBy(LastNameFirstLetter) %>
	<div class="filter">
    <h3 class="groupHeading" id="$LastNameFirstLetter">$LastNameFirstLetter</h3>
    <ul>
        <% loop Children %>
            <li><strong><a href="{$Top.Link}profile/{$ID}">$FirstName $LastName</strong></a><% if CurrentOrgName %> ($CurrentOrgName)<% end_if %></li>
        <% end_loop %>
    </ul>
	</div>
<% end_loop %>