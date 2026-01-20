<?php 
/**
* Candidates link duplicity template
* @package OpenCATS
* @subpackage modules/candidates
* @copyright (C) OpenCats
* @license GNU/GPL, see license.txt
* OpenCATS is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public License 2
* as published by the Free Software Foundation.
*/
?>
<?php TemplateUtility::printModalHeader('Candidates', array(), 'Duplikat für diesen Kandidaten auswählen'); ?>

    <?php if (!$this->isFinishedMode): ?>
        <p>Suchen Sie unten nach einem Kandidaten und klicken Sie dann auf den Namen,
        um diesen Kandidaten als Duplikat zu verknüpfen.</p>

        <table class="searchTable">
            <form id="searchByCandidateNameForm" name="searchByJobTitleForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=candidates&amp;a=linkDuplicate" method="post">
                <input type="hidden" name="postback" id="postback" value="postback" />
                <input type="hidden" id="mode_candidateName" name="mode" value="searchByCandidateName" />
                <input type="hidden" id="candidateID" name="candidateID" value=<?php echo($this->duplicateCandidateID)?> />
                <input type="hidden" id="candidateID_jobtitle" name="candidateIDArrayStored" value="<?php echo($this->candidateIDArrayStored); ?>" />

                <tr>
                    <td>Nach Kandidatename suchen:&nbsp;</td>
                    <td><input type="text" class="inputbox" id="wildCardString_candidateName" name="wildCardString"style="width:200px;" />&nbsp;*</td>
                </tr>
                <tr>
                    <td><input type="submit" class="button" id="searchByCandidateName" name="searchByCandidateName" value="Nach Kandidatename suchen" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </form>
        </table>

        <?php if (empty($_POST['mode']) || $_POST['mode'] == 'searchByCandidateName'): ?>
            <script type="text/javascript">
                document.searchByCandidateNameForm.wildCardString.focus();
            </script>
        <?php endif; ?>

        <?php if ($this->isResultsMode): ?>
            <br />
            <p class="noteUnsized">Suchergebnisse</p>

            <?php if (!empty($this->rs)): ?>
                <table class="sortable" width="100%">
                    <tr>
                        <th align="left">Vorname</th>
                        <th align="left">Nachname</th>
                        <th align="left">E-Mail</th>
                        <th align="left">Mobiltelefon</th>
                        <th align="left">Stadt</th>
                        <th align="left">Bundesland</th>
                        <th align="left">Verantwortlich</th>
                        <th align="center">Aktion</th>
                    </tr>

                    <?php foreach ($this->rs as $rowNumber => $data): ?>
                        <tr class="<?php TemplateUtility::printAlternatingRowClass($rowNumber); ?>">
                            <td align="left" valign="top">
                                <?php if (!$data['linked']): ?>
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=candidates&amp;a=addDuplicates&amp;getback=getback&amp;candidateID=<?php $this->_($data['candidateID']); ?>&amp;duplicateCandidateID=<?php $this->_($data['duplicateCandidateID']); ?>" class="<?php $this->_($data['linkClass']); ?>">
                                        <?php $this->_($data['firstName']); ?>
                                    </a>
                                <?php else: ?>
                                    <span class="<?php $this->_($data['linkClass']); ?>"><?php $this->_($data['firstName']); ?></span>
                                <?php endif; ?>
                            </td>
                            <td align="left" valign="top">
                                <?php if (!$data['linked']): ?>
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=candidates&amp;a=addDuplicates&amp;getback=getback&amp;candidateID=<?php $this->_($data['candidateID']); ?>&amp;duplicateCandidateID=<?php $this->_($data['duplicateCandidateID']); ?>" class="<?php $this->_($data['linkClass']); ?>">
                                        <?php $this->_($data['lastName']); ?>
                                    </a>
                                <?php else: ?>
                                    <span class="<?php $this->_($data['linkClass']); ?>"><?php $this->_($data['lastName']); ?></span>
                                <?php endif; ?>
                            </td>
                            <td align="left" valign="top"><?php $this->_($data['email1']); ?></td>
                            <td align="left" valign="top"><?php $this->_($data['phoneCell']); ?></td>
                            <td align="left" valign="top"><?php $this->_($data['city']); ?></td>
                            <td align="left" valign="top"><?php $this->_($data['state']); ?></td>
                            <td align="left" valign="top" nowrap="nowrap"><?php $this->_($data['ownerFirstName'])." ".$this->_($data['ownerLastName']); ?></td>
                            <td align="center" nowrap="nowrap">
                                <a href="#" title="Kandidat anzeigen" onclick="javascript:openCenteredPopup('<?php echo(CATSUtility::getIndexName()); ?>?m=candidates&amp;a=show&amp;display=popup&amp;candidateID=<?php $this->_($data['candidateID']); ?>', 'viewCandidateDetails', 1000, 675, true); return false;">
                                    <img src="images/new_browser_inline.gif" alt="consider" width="16" height="16" border="0" class="absmiddle" />
                                </a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </table>
            <?php else: ?>
                <p>Keine passenden Einträge gefunden.</p>
            <?php endif; ?>
        <?php else: ?>
            <br />
            <p class="noteUnsized">Alle Kandidaten</p>

            <?php if (!empty($this->rs)): ?>
                <table class="sortable" width="100%">
                    <tr>
                        <th align="left">Vorname</th>
                        <th align="left">Nachname</th>
                        <th align="left">E-Mail</th>
                        <th align="left">Mobiltelefon</th>
                        <th align="left">Stadt</th>
                        <th align="left">Bundesland</th>
                        <th align="left">Verantwortlich</th>
                        <th align="center">Aktion</th>
                    </tr>

                    <?php foreach ($this->rs as $rowNumber => $data): ?>
                        <tr class="<?php TemplateUtility::printAlternatingRowClass($rowNumber); ?>">
                            <td align="left" valign="top">
                                <?php if (!$data['linked']): ?>
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=candidates&amp;a=addDuplicates&amp;getback=getback&amp;candidateID=<?php $this->_($data['candidateID']); ?>&amp;duplicateCandidateID=<?php $this->_($data['duplicateCandidateID']); ?>" class="<?php $this->_($data['linkClass']); ?>">
                                        <?php $this->_($data['firstName']); ?>
                                    </a>
                                <?php else: ?>
                                    <span class="<?php $this->_($data['linkClass']); ?>"><?php $this->_($data['firstName']); ?></span>
                                <?php endif; ?>
                            </td>
                            <td align="left" valign="top">
                                <?php if (!$data['linked']): ?>
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=candidates&amp;a=addDuplicates&amp;getback=getback&amp;candidateID=<?php $this->_($data['candidateID']); ?>&amp;duplicateCandidateID=<?php $this->_($data['duplicateCandidateID']); ?>" class="<?php $this->_($data['linkClass']); ?>">
                                        <?php $this->_($data['lastName']); ?>
                                    </a>
                                <?php else: ?>
                                    <span class="<?php $this->_($data['linkClass']); ?>"><?php $this->_($data['lastName']); ?></span>
                                <?php endif; ?>
                            </td>
                            <td align="left" valign="top"><?php $this->_($data['email1']); ?></td>
                            <td align="left" valign="top"><?php $this->_($data['phoneCell']); ?></td>
                            <td align="left" valign="top"><?php $this->_($data['city']); ?></td>
                            <td align="left" valign="top"><?php $this->_($data['state']); ?></td>
                            <td align="left" valign="top" nowrap="nowrap"><?php $this->_($data['ownerFirstName'])." ".$this->_($data['ownerLastName']); ?></td>
                            <td align="center" nowrap="nowrap">
                                <a href="#" title="Kandidat anzeigen" onclick="javascript:openCenteredPopup('<?php echo(CATSUtility::getIndexName()); ?>?m=candidates&amp;a=show&amp;display=popup&amp;candidateID=<?php $this->_($data['candidateID']); ?>', 'viewCandidateDetails', 1000, 675, true); return false;">
                                    <img src="images/new_browser_inline.gif" alt="consider" width="16" height="16" border="0" class="absmiddle" />
                                </a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </table>
            <?php else: ?>
                <p>Keine Kandidaten gefunden.</p>
            <?php endif; ?>
        <?php endif; ?>
    <?php else: ?>
        <p>Dieser Kandidat wurde erfolgreich als Duplikat für den ausgewählten Kandidaten hinzugefügt.</p>

        <form method="get" action="<?php echo(CATSUtility::getIndexName()); ?>">
            <input type="button" name="close" value="Schließen" onclick="parentHidePopWinRefresh();" />
        </form>
    <?php endif; ?>

    </body>
</html>
