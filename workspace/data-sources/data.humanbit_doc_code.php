<?php

class datasourcehumanbit_doc_code extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'humanbit-doc-code';
    public $dsParamORDER = 'desc';
    public $dsParamGROUP = '78';
    public $dsParamPAGINATERESULTS = 'no';
    public $dsParamLIMIT = '20';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamREQUIREDPARAM = '$ds-humanbit-doc.system-id';
    public $dsParamSORT = 'system:id';
    public $dsParamHTMLENCODE = 'no';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        '78' => '{$ds-humanbit-doc.system-id}',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'name',
        'documentazione',
        'language',
        'code: formatted'
    );

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array('$ds-humanbit-doc.system-id');
    }

    public function about()
    {
        return array(
            'name' => 'humanbit-doc-code',
            'author' => array(
                'name' => 'Andrea Borreca',
                'website' => 'https://ecom1.humanbit.com',
                'email' => 'borreca@humanbit.com'),
            'version' => 'Symphony 2.7.10',
            'release-date' => '2022-03-16T15:28:58+00:00'
        );
    }

    public function getSource()
    {
        return '17';
    }

    public function allowEditorToParse()
    {
        return true;
    }

    public function execute(array &$param_pool = null)
    {
        $result = new XMLElement($this->dsParamROOTELEMENT);

        try {
            $result = parent::execute($param_pool);
        } catch (FrontendPageNotFoundException $e) {
            // Work around. This ensures the 404 page is displayed and
            // is not picked up by the default catch() statement below
            FrontendPageNotFoundExceptionHandler::render($e);
        } catch (Exception $e) {
            $result->appendChild(new XMLElement('error',
                General::wrapInCDATA($e->getMessage() . ' on ' . $e->getLine() . ' of file ' . $e->getFile())
            ));
            return $result;
        }

        if ($this->_force_empty_result) {
            $result = $this->emptyXMLSet();
        }

        if ($this->_negate_result) {
            $result = $this->negateXMLSet();
        }

        return $result;
    }
}