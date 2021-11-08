<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
        <div id="kc-login" class="fr-grid-row fr-grid-row--gutters">
      <div id="kc-form-wrapper" class="fr-col">
        <#if realm.password>
          <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
              <div class="fr-mb-3w fr-input-group">
                  <label for="username" class="fr-label"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>

                  <#if usernameEditDisabled??>
                      <input id="username" class="fr-input" name="username" value="${(login.username!'')}" type="text" disabled />
                  <#else>
                      <input id="username" class="fr-input" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off" />
                  </#if>
              </div>

              <div class="fr-mb-3w fr-input-group">
                  <label for="password" class="fr-label">${msg("password")}</label>
                  <input id="password" class="fr-input" name="password" type="password" autocomplete="off" />
              </div>

              <div>
                  <div id="kc-form-options">
                      <#if realm.rememberMe && !usernameEditDisabled??>
                          <div class="checkbox">
                              <label>
                                  <#if login.rememberMe??>
                                      <input id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                  <#else>
                                      <input id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                  </#if>
                              </label>
                          </div>
                      </#if>
                      </div>
                      <div class="${properties.kcFormOptionsWrapperClass!}">
                          <#if realm.resetPasswordAllowed>
                              <span><a href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                          </#if>
                      </div>

                </div>

                <div id="kc-form-buttons" class="fr-input-group">
                    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                    <button class="fr-btn fr-btn--primary" name="login" id="kc-login" type="submit">${msg("doLogIn")}</button>
                </div>
          </form>
        </#if>
      </div>
      <#if realm.password && social.providers??>
          <div id="kc-social-providers"  class="fr-col">
            <h3>${properties.kcFormSocialAccountTitle!}</h3>
              <ul class="fr-tag-list">
                  <#list social.providers as p>
                      <li ><a href="${p.loginUrl}" id="zocial-${p.alias}" class="fr-tag ${p.providerId}"> <span>${p.displayName}</span></a></li>
                  </#list>
              </ul>
          </div>
      </#if>
      </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration">
                <span>${msg("noAccount")} <a tabindex="6" class="fr-link" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
