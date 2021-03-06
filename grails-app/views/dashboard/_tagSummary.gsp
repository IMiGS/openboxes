
<div class="box">

    <h2>
        <g:isUserAdmin>

            <div class="action-menu" style="position:absolute;top:5px;right:5px">
                <button class="action-btn">
                    <img src="${resource(dir: 'images/icons/silk', file: 'cog.png')}" style="vertical-align: middle"/>
                </button>
                <div class="actions">
                    <div class="action-menu-item">

                        <g:if test="${!params.editTags}">
                            <g:link controller="dashboard" action="index" params="[editTags:true]">
                                <img src="${createLinkTo(dir:'images/icons/silk',file:'pencil.png')}" style="vertical-align: middle" />
                                <warehouse:message code="tag.editTags.label" default="Edit tags"></warehouse:message>
                            </g:link>
                        </g:if>
                        <g:else>
                            <g:link controller="dashboard" action="index">
                                <img src="${createLinkTo(dir:'images/icons/silk',file:'control_end.png')}" style="vertical-align: middle" />
                                <warehouse:message code="tag.doneEditing.label" default="Done editing"></warehouse:message>
                            </g:link>
                        </g:else>
                    </div>
                </div>
            </div>
        </g:isUserAdmin>


        <warehouse:message code="tags.label" default="Tags"/>
    </h2>

	<div class="widget-content" style="max-height: 300px; overflow: auto;" >
        <div id="tag-summary" >
            <g:if test="${params.editTags}">
                <g:isUserAdmin>
                    <table>
                        <thead>
                            <tr>
                                <th><warehouse:message code="tag.name.label" default="Tag"/></th>
                                <th><warehouse:message code="tag.count.label" default="Count"/></th>
                                <th><warehouse:message code="tag.active.label" default="Active"/></th>
                                <th><warehouse:message code="default.actions.label"/></th>
                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${tags }" var="tag" status="i">
                                <tr class="${i%2?'odd':'even'}">
                                    <td>
                                        ${tag.key.tag?:"Empty tag"}
                                    </td>
                                    <td>
                                        ${tag?.value}
                                    </td>
                                    <td>
                                        ${tag.key.isActive}
                                    </td>
                                    <td>
                                        <g:link controller="dashboard" action="hideTag" id="${tag.key}" params="[editTags:true]">
                                            <img src="${createLinkTo(dir:'images/icons/silk',file:'bullet_cross.png')}"/></g:link>
                                    </td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                </g:isUserAdmin>
            </g:if>
            <g:else>
                <g:if test="${tags}">
                    <div id="tagcloud">
                        <g:each in="${tags }" var="tag">
                            <g:if test="${tag.value > 1}">
                                <g:link controller="inventory" action="browse" params="['tag':tag.key]" rel="${tag.value }">
                                    ${tag.key.tag?:"Empty tag" } (${tag?.value })</g:link>
                            </g:if>
                        </g:each>
                        <%--
                        <g:each in="${tags }" var="tag">
                            <g:if test="${tag?.products?.size() > 1}">
                                <g:link controller="inventory" action="browse" params="['tags':tag.id]" rel="${tag?.products?.size() }">
                                    ${tag.tag?:"Empty tag" } (${tag?.products?.size() })</g:link>
                            </g:if>
                        </g:each>
                        --%>

                    </div>
                </g:if>
                <g:else>
                    <div style="margin:10px;" class="center">
                        <span class="fade"><warehouse:message code="tag.noTags.label"/></span>
                    </div>
                </g:else>
            </g:else>
        </div>

    <%--
    <div id="tagSummary">
        <g:isUserAdmin>
            <div style="float: right">
                <g:if test="${!params.editTags}">
                    <g:link controller="dashboard" action="index" params="[editTags:true]">
                        <warehouse:message code="tag.editTags.label" default="Edit tags"></warehouse:message>
                    </g:link>
                </g:if>
                <g:else>
                    <g:link controller="dashboard" action="index">
                        <warehouse:message code="tag.doneEditing.label" default="Done editing"></warehouse:message>
                    </g:link>
                </g:else>
            </div>
        </g:isUserAdmin>
        <g:each in="${tags }" var="tag">
            <span class="tag">
                <g:link controller="inventory" action="browse" params="['tag':tag.tag]">
                    ${tag.tag } (${tag?.products?.size() })
                </g:link>

                <g:if test="${params.editTags}">
                    <g:isUserAdmin>
                        <g:link controller="dashboard" action="hideTag" id="${tag.id}">
                            <img src="${createLinkTo(dir:'images/icons/silk',file:'bullet_cross.png')}"/>
                        </g:link>
                    </g:isUserAdmin>
                </g:if>
            </span>
        </g:each>
    </div>
    --%>
		<div class="clear"></div>
	</div>
</div>
<script src="${createLinkTo(dir:'js/jquery.tagcloud', file:'jquery.tagcloud.js')}" type="text/javascript" ></script>

<script>

    $(window).load(function(){
        $("#tagcloud a").tagcloud({
            size: {
                start:1.0,
                end: 2.0,
                unit: 'em'
            },
            color: {
                start: "#aaa", // "#CDE"
                end: "#F52"//"#FS2"
            }
        });
    });

</script>