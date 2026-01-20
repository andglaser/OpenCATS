<?php /* $Id: MyProfile.tpl 2452 2007-05-11 17:47:55Z brian $ */ ?>
<?php TemplateUtility::printHeader('Einstellungen', array('modules/settings/validator.js', 'js/sorttable.js')); ?>
<?php TemplateUtility::printHeaderBlock(); ?>
<?php TemplateUtility::printTabs($this->active, $this->subActive); ?>
    <div id="main">
        <?php TemplateUtility::printQuickSearch(); ?>

        <div id="contents">
            <table>
                <tr>
                    <td width="3%">
                        <img src="images/settings.gif" width="24" height="24" border="0" alt="Einstellungen" style="margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2>Einstellungen: Mein Profil</h2></td>
                </tr>
            </table>

            <p class="note">Profil</p>

            <?php if ($this->isDemoUser): ?>
                Hinweis: Als Demo-Benutzer haben Sie keine Berechtigung, Einstellungen zu ändern.
                <br /><br />
            <?php endif; ?>

            <table width="100%">
                <tr>
                    <td width="100%">
                        <table class="searchTable" width="100%">
                            <tr>
                                <td width="230">
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=showUser&amp;userID=<?php echo($this->userID); ?>&amp;privledged=false">
                                        <img src="images/bullet_black.gif" alt="" border="0" />Profil anzeigen
                                    </a>
                                </td>
                                <td>
                                    Sehen Sie Ihr aktuelles Profil an, um zu prüfen, ob Ihre Informationen korrekt sind.
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=myProfile&amp;s=changePassword">
                                        <img src="images/bullet_black.gif" alt="" border="0" />Passwort ändern
                                    </a>
                                </td>
                                <td>
                                    Ändern Sie Ihr CATS-Anmeldepasswort.
                                </td>
                            </tr>
                            <!--<tr>
                                <td>
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=myProfile&amp;s=notificationOptions">
                                        <img src="images/bullet_black.gif" alt="" border="0" />Change Notification Options
                                    </a>
                                </td>
                                <td>
                                    Change how CATS notifies you of new events.
                                </td>
                            </tr>-->
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </div>
<?php TemplateUtility::printFooter(); ?>
