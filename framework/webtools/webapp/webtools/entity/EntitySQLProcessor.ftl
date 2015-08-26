<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->
    <form method="post" action="EntitySQLProcessor" name="EntitySQLCommand">
      <table class="basic-table" cellspacing="0">
        <tr>
            <td>
                ${uiLabelMap.CommonGroup}
            </td>
            <td>
                <select name="group">
                    <#list groups as group>
                        <option value="${group}" <#if selGroup??><#if group = selGroup>selected="selected"</#if></#if>>${group}</option>
                    </#list>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                ${uiLabelMap.WebtoolsSqlCommand}
            </td>
            <td>
                <textarea name="sqlCommand" cols="100" rows="5">${sqlCommand!}</textarea>
            </td>
        </tr>
        <tr>
            <td>
                ${uiLabelMap.WebtoolsLimitRowsTo}
            </td>
            <td>
                <input name="rowLimit" type="text" size="5" value="${rowLimit?default(200)}"/>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <input type="submit" name="submitButton" value="${uiLabelMap.CommonSubmit}"/>
            </td>
        </tr>
      </table>
    </form>

<@section title="${uiLabelMap.WebtoolsResults}">
    <#if resultMessage?has_content>
      <@resultMsg>${resultMessage}</@resultMsg>
    </#if>

    <#if columns?has_content>
        <table class="basic-table hover-bar" cellspacing="0">
          <thead>
            <tr class="header-row">
            <#list columns as column>
                <th>${column}</th>
            </#list>
            </tr>
           </thead>
            <#if records?has_content>
            <#assign alt_row = false>
            <#list records as record>
                <tr<@dataRowClassStr alt=alt_row /> >
                <#list record as field>
                    <td><#if field?has_content>${field}</#if></td>
                </#list>
                </tr>
                <#assign alt_row = !alt_row>
            </#list>
            </#if>
        </table>
    </#if>
</@section>
