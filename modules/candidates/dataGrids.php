<?php

//TODO: License

include_once(LEGACY_ROOT . '/lib/Candidates.php');
include_once(LEGACY_ROOT . '/lib/Width.php');

class candidatesListByViewDataGrid extends CandidatesDataGrid
{
    public function __construct($siteID, $parameters, $misc)
    {
        /* Pager configuration. */
        $this->_tableWidth = new Width(100, '%');
        $this->_defaultAlphabeticalSortBy = 'lastName';
        $this->ajaxMode = false;
        $this->showExportCheckboxes = true; //BOXES WILL NOT APPEAR UNLESS SQL ROW exportID IS RETURNED!
        $this->showActionArea = true;
        $this->showChooseColumnsBox = true;
        $this->allowResizing = true;

        $this->defaultSortBy = 'dateModifiedSort';
        $this->defaultSortDirection = 'DESC';

        $this->_defaultColumns = array(
            array('name' => 'Anhänge', 'width' => 31),
            array('name' => 'Vorname', 'width' => 75),
            array('name' => 'Nachname', 'width' => 85),
            array('name' => 'Stadt', 'width' => 75),
            array('name' => 'Bundesland', 'width' => 50),
            array('name' => 'Schlüsselqualifikationen', 'width' => 215),
            array('name' => 'Verantwortlich', 'width' => 65),
            array('name' => 'Erstellt', 'width' => 60),
            array('name' => 'Geändert', 'width' => 60),
        );

         parent::__construct("candidates:candidatesListByViewDataGrid",
                             $siteID, $parameters, $misc
                        );
    }


    /**
     * Adds more options to the action area on the pager.  Overloads
     * DataGrid Inner Action Area function.
     *
     * @return html innerActionArea commands.
     */
    public function getInnerActionArea()
    {
        //TODO: Add items:
        //  - Add to List
        //  - Add to Job Order
        //  - Mass set rank (depends on each candidate having their own personal rank - are we going to do this?)
        $html = '';

        $html .= $this->getInnerActionAreaItemPopup('Zur Liste hinzufügen', CATSUtility::getIndexName().'?m=lists&amp;a=addToListFromDatagridModal&amp;dataItemType='.DATA_ITEM_CANDIDATE, 450, 350);
        
        if($_SESSION['CATS']->getAccessLevel('pipelines.addToPipeline') >= ACCESS_LEVEL_EDIT) 
        {
            $html .= $this->getInnerActionAreaItemPopup('Zu Auftrag hinzufügen', CATSUtility::getIndexName().'?m=candidates&amp;a=considerForJobSearch', 750, 460);
        }
        
        if(MAIL_MAILER != 0 && $_SESSION['CATS']->getAccessLevel('candidates.emailCandidates') >= ACCESS_LEVEL_SA)
        {
            $html .= $this->getInnerActionAreaItem('E-Mail senden', CATSUtility::getIndexName().'?m=candidates&amp;a=emailCandidates');
        }
        $html .= $this->getInnerActionAreaItem('Exportieren', CATSUtility::getIndexName().'?m=export&amp;a=exportByDataGrid');

        $html .= parent::getInnerActionArea();

        return $html;
    }
}

class candidatesSavedListByViewDataGrid extends CandidatesDataGrid
{
    public function __construct($siteID, $parameters, $misc)
    {
        $this->_tableWidth = new Width(100, '%');
        $this->_defaultAlphabeticalSortBy = 'lastName';
        $this->ajaxMode = false;
        $this->showExportCheckboxes = true; //BOXES WILL NOT APPEAR UNLESS SQL ROW exportID IS RETURNED!
        $this->showActionArea = true;
        $this->showChooseColumnsBox = true;
        $this->allowResizing = true;

        $this->defaultSortBy = 'dateModifiedSort';
        $this->defaultSortDirection = 'DESC';

        $this->_defaultColumns = array(
            array('name' => 'Anhänge', 'width' => 31),
            array('name' => 'Vorname', 'width' => 75),
            array('name' => 'Nachname', 'width' => 85),
            array('name' => 'Stadt', 'width' => 75),
            array('name' => 'Bundesland', 'width' => 50),
            array('name' => 'Schlüsselqualifikationen', 'width' => 200),
            array('name' => 'Verantwortlich', 'width' => 65),
            array('name' => 'Geändert', 'width' => 60),
            array('name' => 'Zur Liste hinzugefügt', 'width' => 75),
        );

         parent::__construct("candidates:candidatesSavedListByViewDataGrid",
                             $siteID, $parameters, $misc
                        );
    }

    /**
     * Adds more options to the action area on the pager.  Overloads
     * DataGrid Inner Action Area function.
     *
     * @return html innerActionArea commands.
     */
    public function getInnerActionArea()
    {
        //TODO: Add items:
        //  - Add to List
        //  - Add to Job Order
        //  - Mass set rank (depends on each candidate having their own personal rank - are we going to do this?)
        $html = '';

        $html .= $this->getInnerActionAreaItem('Aus dieser Liste entfernen', CATSUtility::getIndexName().'?m=lists&amp;a=removeFromListDatagrid&amp;dataItemType='.DATA_ITEM_CANDIDATE.'&amp;savedListID='.$this->getMiscArgument(), false);
        $html .= $this->getInnerActionAreaItemPopup('Zu Auftrag hinzufügen', CATSUtility::getIndexName().'?m=candidates&amp;a=considerForJobSearch', 750, 460);
        if(MAIL_MAILER != 0 && $_SESSION['CATS']->getAccessLevel('candidates.emailCandidates') >= ACCESS_LEVEL_SA)
        {
            $html .= $this->getInnerActionAreaItem('E-Mail senden', CATSUtility::getIndexName().'?m=candidates&amp;a=emailCandidates');
        }
        $html .= $this->getInnerActionAreaItem('Exportieren', CATSUtility::getIndexName().'?m=export&amp;a=exportByDataGrid');

        $html .= parent::getInnerActionArea();

        return $html;
    }
}


?>
