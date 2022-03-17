/**
formats.sas
create/update the LDP SAS formats catalog at
    /trials/LabDataOps/common/code/sas/sas_formats/formats.sas7bcat

NOTE: Due to our limiting permissions on /trials/LabDataOps/,
we must manually copy the catalog to /trials/lab/data/public/sas_formats
**/

proc printto log='/trials/LabDataOps/common/logs/formats.log' new;
run;

/* declare labfmts library location */
libname labfmts '/trials/LabDataOps/common/sas_formats';

/* create LDP format catalog if it does not exist */
/* otherwise update existing formats as declared below */
proc format library = labfmts;

    /* Generic Checkbox */
    VALUE checkbox
        0 = ' '
        . = '.'
        1 = 'X'
        ;

    value noyesna
        0 = 'No'
        1 = 'Yes'
        other = 'N/A'
        ;

    /* yesno NUMERIC format from clinprog used by enrollment data sets */
    value yesno
        .N = 'Not Available'
        1 = 'Yes'
        2 = 'No'
        ;

    /* GENERIC/VPS-1 PTID format */
    PICTURE ptid
        010000010-989999999 = '999-99999-9'
        ;

    /* HIVNET PTID format */
    PICTURE hivptid
        low - high = '999-99999-9'
        ;

    /* HVTN PTID format */
    PICTURE ptidvtn
        low - high = '999-99-999-9'
        ;

    /* PTID format for studies with 2 cohort digits */
    PICTURE ptid10d
        low - high = '999-9999-9-99'
        ;

    /* PTID format for chase IIB or III trials */
    PICTURE ptid2b
        low - high = '999-9-9999-9'
        ;

    /* AERAS PTID format */
    PITCTURE aeras_ptid
        low - high = '999-99-99999'
        ;

    /* LDO Specimen aliquot codes */
    value alqtyp
        1 = "Plasma"
        2 = "Genital Lesion Swab"
        3 = "PBMC Cells - Viable"
        4 = "Serum"
        5 = "Whole Blood in EDTA"
        6 = "Female Genital Samples"
        7 = "Male Genital Secretions"
        8 = "Cervical Cytobrush with RPMI 1640 medium"
        9 = "Blood RNA Extract"
        10 = "Vaginal Slide"
        11 = "Vaginal Swab with Phosphate Buffered Saline"
        12 = "Cervical Swab"
        13 = "Urine"
        14 = "Cervicovaginal Lavage Supernatant"
        15 = "Cervicovaginal Lavage Cell Pellet"
        16 = "Cervical Cytobrush with Phosphate Buffered Saline"
        17 = "Vaginal Biopsy"
        18 = "Rectal Sponge"
        19 = "Rectal Biopsy with RNALater"
        20 = "Rectal Biopsy - Formalin Fixed"
        21 = "Vaginal Biopsy with RNALater"
        22 = "Vaginal Swab"
        23 = "Rectal Biopsy"
        24 = "PBMC Cells - Non-Viable"
        25 = "Vaginal Swab in PAC Culture Tube"
        26 = "Used Intravaginal Ring"
        27 = "Vaginal Swab with PBS cell pellet"
        28 = "Cervical Biopsy"
        29 = "Vaginal Swab with PBS supernatant"
        30 = "Used Intravaginal Ring Swab"
        31 = "Dried Blood Pellet"
        32 = "Dried Urine Cartridge"
        33 = "Dried Urine Filter Paper"
        34 = "Stool Swab"
        35 = "Saliva"
        36 = "Cervical Sponge"
        37 = "Dried Blood Spot"
        38 = "Hair"
        39 = "Rectal Swab in VTM"
        40 = "Plasma in SCI Media"
        41 = "Vaginal Fluid"
        42 = "Rectal Fluid"
        43 = "Vaginal Tissue in BTM"
        44 = "Cervical Tissue in BTM"
        45 = "Urine with GITC"
        46 = "Rectal Biopsy in BTM"
        47 = "Rectal Biopsy Culture Supernatant"
        48 = "Cervical Biopsy Culture Supernatant"
        49 = "Oropharyngeal Swab in VTM"
        50 = "Plasma with spray dried potassium EDTA"
        51 = "DNA Extracted from Blood"
        52 = "Cervical Biopsy Culture Tissue"
        53 = "Rectal Swab"
        54 = "Perianal DNA"
        55 = "Anal Swab"
        56 = "Rectal Tissue Culture"
        57 = "Plasma in ACD Media"
        58 = "Whole Blood in Heparin"
        59 = "Saliva in SPH"
        60 = "Oral Swab in SPH"
        61 = "Breast Milk"
        62 = "Cervicovaginal Fluid"
        63 = "Vaginal Swab in Culture Transport Kit"
        64 = "Whole Blood"
        65 = "Cervicovaginal Secretions"
        66 = "Rectal Secretions"
        67 = "QFT - Quantiferon TB Nil"
        68 = "QFT - Quantiferon TB Antigen"
        69 = "QFT - Quantiferon TB Mitogen"
        70 = "IGRA - TB Ag1"
        71 = "IGRA - TB Ag2"
        72 = "Rectal Enema Fluid"
        73 = "Rectal Enema Cells"
        74 = "Nasal Swab"
        75 = "Serum Cytokines"
        76 = "Cervical Biopsy for PK"
        77 = "Cervical biopsy for PD"
        78 = "Serum reaction"
        79 = "Serum post-product admin"
        80 = "Plasma for Storage"
        81 = 'Nasal Wash'
        82 = 'Nasopharyngeal Swab'
        83 = 'Stimulated Cord Blood - Negative Control'
        84 = 'Stimulated Cord Blood - Protein Antigen'
        85 = 'Stimulated Cord Blood - Antigen'
        86 = 'Stimulated Cord Blood - Complete Vaccine'
        87 = 'Stimulated Cord Blood - Positive Control 1 LPS'
        88 = 'Stimulated Cord Blood - Positive Control 2 R848'
        89 = 'NaHep for Systems Biology'
        90 = 'Breastmilk Cells'
        91 = 'Breastmilk Supernatant'
        92 = 'plasma in NaHep media'
        93 = 'CBMCs'
        94 = 'NaHep Plasma - cord blood'
        95 = 'Serum - cord blood'
        96 = 'Bulk Stool'
        97 = 'ACD for TruCount'
        98 = 'Lymph Node FNA'
        99 = 'Leukapheresis'
        100 = 'Bone Marrow Aspirate'
        101 = 'Systems Biology CBMC'
        102 = 'Whole Cord Blood Storage'
    ;


    /* Specimen purpose codes */
    value specpurp
        1 = "RNA"
        2 = "Virology"
        3 = "Serology"
        4 = "Pharmacokinetics"
        5 = "Pharmacodynamics"
        6 = "Proteomics"
        7 = "Genotyping"
        8 = "Clinic Collected"
        9 = "Self Collected"
        10 = "Enrollment"
        11 = "Storage"
        12 = "Confirmation"
        13 = "Seroconversion"
        14 = "Pharmacogenomics"
        15 = "Mucosal Immunology"
        16 = "Phenotyping"
        17 = "Gene Expression"
        18 = "Histology"
        19 = "Validation"
        20 = "DPV-Pharmacokinetics"
        21 = "LNG-Pharmacokinetics"
        22 = "Microflora"
        23 = "Infusion Reaction"
        24 = "mAB reaction"
        25 = "Anti HSV-2 Activity"
        26 = "Biomarkers"
        27 = "Sub Study"
    ;

    /* PK unit codes */
    value pkunits
        1 = "PRE"
        2 = "DAY"
        3 = "HRS"
        4 = "MIN"
        5 = "SEC"
        6 = "RAN"
        7 = "RPD"
        8 = "PST"
        9 = "FST"
        10 = "NFT"
        11 = "POL"
        12 = "PRD"
        13 = "PSD"
        14 = "TR"
        15 = "UNK"
        16 = 'PTI'
        17 = 'PTV'
        18 = 'MRN'
        19 = 'MO'
        ;

    /* LDMS equivalent codes for PK units */
    invalue $inpkunits
        "PRE" = 1
        "DAY" = 2
        "HRS" = 3
        "MIN" = 4
        "SEC" = 5
        "RAN" = 6
        "RPD" = 7
        "PST" = 8
        "FST" = 9
        "NFT" = 10
        "POL" = 11
        "PRD" = 12
        "PSD" = 13
        "TR" = 14
        "UNK" = 15
        "PTI" = 16
        "PTV" = 17
        "MRN" = 18
        'MO' = 19
        ;

    /* ldms visit type */
    invalue $ldmsvisittype
        "VST" = "Routine"
        "EXP" = "Recent Exposure"
        "RDW" = "Redraw"
        "EOS" = "End-Of-Study"
        "INF" = "Infected"
        "POS" = "Post-Study"
        "EOX" = "EOS & EXP combo"
        "UNK" = "Unknown"
    ;

    /* HIV algorithm format */
    value algrthm
        1 = 'IN-STUDY (first draw)'
        2 = 'IN-STUDY (repeat draw)'
        3 = 'END OF STUDY (first draw)'
        4 = 'END OF STUDY (repeat draw)'
        5 = 'RECENT EXPOSURE (first draw)'
        6 = 'RECENT EXPOSURE (repeat draw)'
        7 = 'END OF STUDY RECENT EXPOSURE (first draw)'
        8 = 'END OF STUDY RECENT EXPOSURE (repeat draw)'
        9 = 'POST STUDY TESTING (first draw)'
        10 = 'POST STUDY TESTING (repeat draw)'
        ;

    /* Correction format for the NAB cell types */
    value $ct_corr (default = 20)
        'TZM-Bl' = 'TZM-bl'
        'A3R5.7' = 'A3R5'
        ;

    /* DNA PCR */
    value $dpcrslt
        '1' = 'Positive'
        '2' = 'Negative'
        '3' = 'Indeterminate'
        '4' = 'QNS'
        '5' = 'Invalid'
        ;

    value $elprslt
        '1' = 'HIV-1 Reactive'
        '2' = 'HIV-1 Non-reactive'
        '4' = 'QNS'
        '5' = 'Invalid'
        '8' = 'HIV-2 Reactive'
        '9' = 'HIV-1/HIV-2 Reactive'
        ;

    value $fnrslt
        '1' = 'Infected, HIV-1'
        '2' = 'Uninfected, HIV-1'
        '3' = 'Further Tests'
        '4' = 'Inconclusive'
        '5' = 'Infected, HIV-2'
        '6' = 'Infected, HIV-1 and HIV-2'
        ;

    /* HSV Western Blot result mapping */
    value hsvwbf
        0 = 'HSV-1 Negative and HSV-2 Negative'
        1 = 'HSV-1 Positive and HSV-2 Negative'
        2 = 'HSV-1 Negative abd HSV-2 Positive'
        3 = 'HSV-1 Positive and HSV-2 Positive'
        4 = 'HSV-1 Atypical and HSV-2 Atypical'
        6 = 'HSV-1 Positive and HSV-2 Atypical'
        7 = 'HSV-1 Atypical and HSV-2 Positive'
        8 = 'HSV-1 Atypical and HSV-2 Negative'
        9 = 'HSV-1 Negative and HSV-2 Atypical'
        10 = 'HSV, cannot type'
        11 = 'Aliquot volume inadequate'
        88 = 'Uninterpretable'
        99 = 'No sample received'
        ;

    value wb1rsn
        0 = 'HSV-1 Negative'
        1 = 'HSV-1 Positive'
        2 = 'HSV-1 Negative'
        3 = 'HSV-1 Positive'
        4 = 'HSV-1 Atypical'
        6 = 'HSV-1 Positive'
        7 = 'HSV-1 Atypical'
        8 = 'HSV-1 Atypical'
        9 = 'HSV-1 Negative'
        10 = 'HSV, cannot type'
        11 = 'Aliquot volume inadequate'
        88 = 'uninterruptable'
        99 = 'no sample received'
        ;

     value wb2rsn
        0 = 'HSV-2 Negative'
        1 = 'HSV-2 Negative'
        2 = 'HSV-2 Positive'
        3 = 'HSV-2 Positive'
        4 = 'HSV-2 Atypical'
        6 = 'HSV-2 Atypical'
        7 = 'HSV-2 Positive'
        8 = 'HSV-2 Negative'
        9 = 'HSV-2 Atypical'
        10 = 'HSV, cannot type'
        11 = 'Aliquot volume inadequate'
        88 = 'uninterruptable'
        99 = 'no sample received'
        ;

    /* Specific format for assay NST - lab reason for run not successful */
    value labrsn
        1 = 'Specimen not received'
        2 = 'Specimen received, but unable to test due to insufficient plasma quanitity'
        3 = 'Specimen received, but unable to test due to low viral load'
        4 = 'Specimen received and tested, but did not yield result due to testing failure; will be re-tested'
        5 = 'Specimen received and tested, but did not yield result due to testing failure; will not be re-tested'
        6 = 'Other, specify in comments box'
        7 = 'Specimen scheduled for testing'
    ;

    /* Network abbreviations */
    value $nwfmt
        'CHV' = 'CHAVI'
        'CON' = 'CONTRACT'
        'CVD' = 'CAVD'
        'MTN' = 'MTN'
        'PAV' = 'PAVE'
        'PTN' = 'HPTN'
        'VTN' = 'HVTN'
        'USM' = 'USMHRP'
        'COV' = 'COVPN'
        'IDC' = 'IDCRC'
        ;

    value ptnexp
        1 = 'Expected                              '
        2 = 'Coll outside prot coll schedule       '
        3 = 'Spec NA per CRF, coll reqd by prot    '
        4 = 'Spec not coll per CRF, reqd by prot   '
        5 = 'CRF lost or dirty                     '
        6 = 'Spec not coll per CRF, coll NOT reqd  '
        7 = 'Expected, protocol exception          '
        8 = 'Expected, included per SRA review     '
        9 = 'Excluded per SRA review               '
        10 = 'Not expected per lab/site notification'
        100 = 'PTN024: Confirmatory (type  =  1)         '
        101 = 'PTN024: Off schedule (type  =  2)         '
        . = 'Result received, no matching CRF found'
        ;

    value ptnlab
        101 = 'UNC: University of North Carolina at Chapel Hill'
        102 = 'UAB: University of Alabama at Birmingham'
        103 = 'UW:  University of Washington'
        104 = 'JHU: Johns Hopkins University'
        105 = 'UP:  University of Pittsburgh'
        106 = 'MDS: MDS Pharma Services'
        ;

    value $reason
        '0' = ' '
        '1' = 'Tech Error'
        '2' = 'Contaminated'
        '3' = 'lack serum'
        '4' = 'Poor recvry'
        '5' = '# vials'
        '6' = 'Equipment'
        '7' = '>48 hrs'
        '8' = 'Stim died'
        '9' = 'BLCL died'
        '10' = 'No Mat BLCL'
        '11' = 'No EBV/BLCL'
        '12' = 'HotTarg dead'
        '13' = 'Low Viabil'
        '14' = 'Discontinued'
        '15' = 'No frz cells'
        '16' = 'lack cells'
        '20' = 'LOA Revision'
        '50' = 'No sample'
        '51' = 'Ordered'
        '52' = 'In-house'
        '53' = 'Assays Stopped'
        '90' = 'Missed'
        '91' = 'Seroconverted'
        '92' = 'Inappropriate Enrollment'
        '95' = 'Terminated'
        '99' = 'Other'
        ;

     /* RNA PCR */
     value $rpcrslt
        '1' = 'Positive'
        '2' = 'Negative'
        '4' = 'QNS'
        '5' = 'Invalid'
        '6' = 'Inhibited'
        '10' = 'Detected below limit of quantitation'
        '11' = 'Detected above limit of quantitation'
        ;

     value spcol
        0 = 'No'
        1 = 'Yes'
        other = 'N/A'
        ;

    value $ttype
        'ACD' = 'Yellow'
        'HEP' = 'Green'
        'SST' = 'Tiger'
        'PPT' = 'White'
        'EDT' = 'Lavender'
        'SER' = 'Red'
        ;

    value type
        1 = 'Confirmatory'
        2 = 'Off-Schedule'
        ;

    value visit
        .n = 'Next Specimen'
        .c = 'v9 Confirmatory (v911 or higher)'
        ;

    /* Western Blot */
    value $wbrslt
        '1' = 'Positive'
        '2' = 'Negative'
        '3' = 'Indeterminate'
        '4' = 'QNS'
        '5' = 'Invalid'
        '7' = 'Non-Specific'
    ;

    /* Display of LDO QCs */
    value ldoqc
        1 = "Invalid or new labid"
        2 = "Unexpected Primary/Additive codes"
        3 = "Unexpected Primary/Additive/Derivative/Sub-Additive-Derivative codes"
        4 = "Missing storage location"
        5 = "Lab Data - CRF Specimen Collection Visits Don't Match"
        6 = "Lab Data - CRF Specimen Collection Dates Don't Match"
        7 = "Lab Data Only - Participant not enrolled"
        8 = "Lab Data Only - No CRF Specimen Match"
        9 = "Lab Aliquot Generated - but CRF Notes Specimen was Not Stored"
        10 = "Lab Aliquot Generated - but CRF Specimen Collection Information is Incomplete"
        11 = "CRF Shows Specimen was Stored but No Match to Lab Data"
        12 = "CRF Shows Specimen was Stored but Lab Aliquot is Marked as Destroyed"
        13 = "CRF Shows Specimen was Stored but Lab Aliquot is Marked as Never Store"
        14 = "CRF Shows Specimen was Stored and Although it Matched to a Lab Primary Record it Did Not Match to an Aliquot"
        15 = "CRF Shows Specimen was Stored - No Match to Lab Data but Collected After Last Lab Export"
        16 = "CRF Shows Specimen was Stored - No Match to Lab Data - Processing Lab May Not have Exported Yet"
        17 = "Lab Data Only - Participant not enrolled (but within enrollment delay window)"
        18 = "Lab Data Only - No CRF Specimen Match (but within CRF delay window)"
        19 = "CRF Shows Specimen was Stored - No Match to Lab Data (but within Lab Data delay window)"
        20 = "Unexpected Primary, Additive, Derivative, Sub-Additive-Derivative, or Other Specimen ID Codes"
        21 = "CRF Shows Specimen was Stored but Lab Aliquot is Marked as Not Prepared"
        22 = "Unexpected Aliquot Volume Unit"
        23 = "Number of specimens stored does not agree between the CRF and Lab Data"
        24 = "Missing PBMC processing info"
        25 = "File header error"
        26 = "Data input error"
        27 = "Missing data in required field"
        28 = "Invalid data value"
        29 = "File does not exist"
        30 = "Wrong number of records in file"
        31 = "Code does not exist"
        32 = "Data is locked"
        33 = "Multiple files with same name submitted"
        34 = "Duplicate results received"
        35 = "Lab Data - CRF Specimen Collection Time-points Don't Match"
        36 = "Lab Data Not expected (collection not listed as 'stored' on CRF) but received"
        37 = "Lab Data Not expected (participant missed visit) but received"
        38 = "Lab Data Not expected (participant terminated) but received"
        39 = "Lab Data Not expected (DOA) but received"
        40 = "Unexpected visit unit"
        41 = "Lab Data Only - No CRF Specimen Match (bad LDMS codes entered)"
        42 = "Missing CRF specimen collection time"
        43 = "Invalid PTID"
        44 = "Unexpected Volume (outside of expected range)"
        45 = "Missing Volume"
        46 = "Volume below expected range"
        47 = "Volume above expected range"
        48 = "Lab Data - CRF Specimen Collection Times Don't Match"
        49 = "Missing LDMS specimen collection time"
        50 = "Clinic needs correction"
        51 = "Visit unit needs correction"
        52 = "Unsupported file type"
        53 = "Lab Data - CRF Specimen Collection Visits and Times Don't Match"
        54 = "Lab Data Only - No Link to CRF Specimen via External ID"
        other = "Unknown"
        ;

    /* Display of assay labids */
    value $assay_labid_name
        "A8" = "Wrthenstein Biopharma GmbH"
        "B4" = "UCT Division of Clinical Pharmacology"
        "BJ" = "BARC Johannesburg"
        "E3" = "Farmovs"
        "IM" = "MTN Mucosal Immunology"
        "J1" = "HPTN Virology Core"
        "J2" = "HPTN HIV Incidence Core"
        "J3" = "HPTN STD Core"
        "J4" = "HPTN Micro Core"
        "J5" = "HPTN Toxicology Core"
        "J6" = "HPTN Point of Care Core"
        "J7" = "JHU Clinical Pharmacology (CPAL)"
        "JH" = "Johns Hopkins"
        "M1" = "Blantyre Malawi Clinic"
        "M2" = "Lilongwe Malawi Clinic"
        "M4" = "MTN Microbiology"
        "M5" = "MTN Formulation Testing"
        "ML" = "MTN Virology"
        "MW" = "McGee Womens"
        "NH" = "NHLS - Cape Town"
        "PX" = "Parexel"
        "S1" = "CAPRISA eThekwini"
        "SF" = "UCSF Gandhi PK Group"
        "U1" = "Kampala MU-JHU"
        "UC" = "UC Denver Pharmacology (CAVP)"
        "UV" = "UW Virology"
        "UW" = "University of Washington"
        "XX" = "TBD"
        "Z1" = "Harare UZ-UCSF"
        "ZB" = "Zambart"
        ;

    /* Display of assays */
    value $assay_name
        "ARV" = "Antiretroviral"
        "BAV" = "BED HIV-1 Capture EIA, Avidity and Viral Load"
        "BED" = "BED HIV-1 Incidence EIA"
        "BMK" = "Biomarkers"
        "CFS" = "Carboxyfluorescein Succinimidyl Ester - Flow"
        "CGD" = "Chlamydia/Gonorrhea"
        "CNC" = "Concentration"
        "CVL" = "Cervical HIV Viral Load"
        "CYK" = "Cytokines and Chemokines"
        "DBS" = "Dried Blood Spots"
        "DXA" = "DXA Scan"
        "ECO" = "Ecoli"
        "ELX" = "HPTN ELISpot"
        "EPV" = "Single Point ELISA"
        "ESR" = "Epithelial Sloughing"
        "FCI" = "Flow Cytometry - Intracellular Staining Panel"
        "FCM" = "Flow Cytometry"
        "FCP" = "Fecal Calprotectin"
        "FCS" = "Flow Cytometry - Surface Panel"
        "FFN" = "Fetal Fibronectin Elisa"
        "GEM" = "Gene Expression Microarray"
        "GSC" = "Cervical Gram Stain Slides"
        "GSS" = "Gram Stain"
        "GTP" = "Genotyping"
        "GUD" = "Genital Ulcer Swab"
        "HBV" = "Hepatitis B Virus"
        "HCA" = "HIV Combo Antigen/Antibody"
        "HCB" = "HIV Biorad Assay"
        "HIS" = "Histology"
        "HQA" = "HIV Quality Assurance Testing"
        "HQM" = "Multi-Result HIV Quality Assurance Testing"
        "HS2" = "HSV PCR Viral Load"
        "HSE" = "HIV ELISA"
        "HSS" = "HIV Serostatus"
        "HST" = "Histology"
        "HSV" = "Herpes Simplex Virus"
        "ICS" = "Inter-Cellular Staining"
        "NGS" = "Next Generation Sequencing"
        "NGSM" = "Next Generation Sequencing Manifest"
        "NSR" = "Network Sensitive Genotyping"
        "NST" = "Network Standard Genotyping"
        "PDA" = "Pharmacodynamics - Antigen Response"
        "PDB" = "Pharmacodynamics - Biomarker Response"
        "PDC" = "PD Custom Cultured p24 Antigen Ex Vivo Challenge"
        "PDH" = "Pharmacodynamics Anti-HSV Activity"
        "PK" = "Pharmacokinetics"
        "PKH" = "Product Concentration in Hair"
        "POL" = "Polio, Tetanus, and Haemophilus Influenzae B Antibodies"
        "PRD" = "Product Concentration"
        "PRDL" = "Product Concentration - Lower Limit of Quantification"
        "PRO" = "Product Concentration"
        "PVR" = "Residual Ring Product Concentration"
        "RES" = "Viral Resistance"
        "RPH" = "Resistance Phenotyping"
        "RMC" = "Rectal Microflora Cultures"
        "RQC" = "RNA PCR Integrity Quality Checks"
        "RUB" = "Measles Antibodies"
        "SEM" = "Scanning Electron Microscopy"
        "VDA" = "Vitamin D Assay"
        "VGC" = "Quantitative Vaginal Culture"
        "VGQ" = "Vaginal Flora Q-PCR"
        "VLR" = "HIV Viral Load"
        "VRR" = "Viral Resistance Results"
        "VTP" = "Virus Typing"
        ;

    /* Standard missing value codes */
    value std_miss
        .A = 'Not Applicable'
        .D = 'Destroyed'
        .E = 'Not evaluable'
        .F = 'Failed testing'
        .G = 'Greater than the limit of detection'
        .I = 'Data not available due to instrument problems'
        .L = 'Less than the limit of detection'
        .N = 'Required field marked as Data Not Available'
        .Q = 'Data currently under Quality Control review'
        .S = 'Quantity Not Sufficient (QNS)'
        .T = 'Data not available due to other technical problem'
        ;

    /* RNA PCR missing value code display */
    value rna_pcr_miss
        .D = "Detected but Below the Limit of Detection"
        .G = "Above the Limit of Detection"
        .L = "Below the Limit of Detection"
        ;

    /* GSS missing value code display */
    value gss_miss
        .T = "Not Evaluable, Gel Present"
        .E = "Not Evaluable, No Epithelial Cells"
        .N = "Not Available"
        ;

    /* GSS missing value code display */
    value hsv_miss
        .E = "Uninterpretable"
        .N = "Not Available"
        .S = "Aliquot volume inadequate"
        ;

    /* VGC missing value code display */
    value vgc_miss
        .E = "Not Evaluable, Specimen Too Old"
        .N = "Not Available"
        .L = "Below the Limit of Detection"
        ;

    /* VGQ missing value code display */
    value vgq_miss
        .E = "Not Evaluable, Specimen Too Old"
        .N = "Not Available"
        .L = "Below the Limit of Detection"
        ;

    /* SEM missing value code display */
    value sem_miss
        .E = "Not Evaluable"
        .N = "Not Available"
        ;

    /* PKH missing value code display */
    value pkh_miss
        .A = "Not Applicable"
        .G = "Above the Limit of Detection"
        .L = "Below the Lower Limit of Quantification"
        .S = "Insufficient Sample Amount"
        .U = "Unacceptable Chromatogram"
        ;

    /* HQA missing value code display */
    value hqa_miss
        .D = "Detected but Below the Limit of Detection"
        .G = "Above the Limit of Detection"
        .L = "Below the Limit of Detection"
        ;

    /* HQM missing value code display */
    value hqm_miss
        .D = "Detected Less than the Cutoff"
        .G = "Greater than the Cutoff"
        .L = "Not Detected"
        ;

    value hqm02_miss
        .D = "Detected but Below the Limit of Detection"
        .G = "Above the Limit of Detection"
        .L = "Below the Limit of Detection"
        .S = "Quantity Not Sufficient (QNS)"
        ;

    /* rlstat - result status; used for SRA assay results datasets. */
    /* Compares assay results to specimen collection dataset (expectations).*/
    /* subset of values compared to rlstat in CLINPROG formats.sas */
    value rlstat
        21 = "Expected and received"
        22 = "Expected but not received"
        23 = "Expected but no result to be received - DOA, missed visit, terminated, excluded, or specimen not listed as 'stored' on CRF"
        26 = "Needs correction"
        32 = "Not expected but received"
        33 = "Not expected but received - DOA, missed visit, terminated, excluded, or specimen not listed as 'stored' on CRF"
        34 = "Received"
        ;

    /* ELISA results as reported on the HVTN EOS reports. */
    value $EosELISA
        '1' = 'R'
        '2' = 'NR'
        '3' = 'E'
        '9' = 'R'
        '12' = 'I'
        '13' = 'R'
        '14' = 'NR'
        ;

    /* Western Blot results as reported on the HVTN EOS reports */
    value $EosWB
        '1' = 'P'
        '2' = 'N'
        '3' = 'I'
        ;

    /* Assay data result types */
    value $result_type
        "E" = "Endpoint"
        "S" = "Ancillary"
        ;

   /* Endpoint type */
    value endpoint_type
        1 = "Primary"
        2 = "Secondary"
        3 = "Exploratory"
        ;

   /* How to display if an assay file is iterative or cumulative */
    value file_add_type
        1 = "Iterative"
        0 = "Cumulative"
        ;

   /* Simple PTID picture format (to assure no rounding when */
   /* including PTIDs in reports without other formatting */
    picture simple_ptid
        low-high = '0999999999'
        ;

    value doacodes
        1 = 'Tech Error'
        2 = 'Contaminated'
        3 = 'Lack Serum'
        4 = 'Poor Recovery'
        5 = '# Vials'
        6 = 'Equipment'
        7 = '> 48 Hours'
        8 = 'Stim Died'
        9 = 'BLCL Died'
        10 = 'No Mat BLCL'
        11 = 'No EBV/BLCL'
        12 = 'HotTarg Dead'
        13 = 'Low Viability'
        14 = 'Discontinued'
        15 = 'No Frz Cells'
        16 = 'Lack Cells'
        20 = 'LOA Revision'
        50 = 'No Sample'
        51 = 'Ordered'
        52 = 'In-house'
        53 = 'Assays Stopped'
        90 = 'Missed'
        91 = 'Seroconverted'
        92 = 'Inappropriate Enrollment'
        95 = 'Terminated'
        99 = 'Other'
        ;

    /* HIVNET Acronym to DataFax Study Number */
    value $DFnum
        'a014m' = '024'
        'a014w' = '025'
        'acasi' = '004'
        'adrp1' = '046'
        'adrpc' = '038'
        'appeal' = '009'
        'bit' = '026'
        'c001' = '122'
        'c002' = '127'
        'c003' = '128'
        'c005' = '126'
        'c008' = '145'
        'c009' = '141'
        'c012' = '142'
        'cipra1' = '231'
        'cipra2' = '232'
        'cipra3' = '233'
        'vvcf' = '244'
        'corela' = '070'
        'demo' = '248'
        'v505' = '137'
        'ebuc' = '021'
        'ebum' = '019'
        'ebuw' = '020'
        'expc' = '060'
        'expl' = '040'
        'expp' = '050'
        'gss' = '071'
        'h014am' = '032'
        'h014ap' = '041'
        'h014aw' = '031'
        'h014m' = '022'
        'h014w' = '023'
        'h020' = '039'
        'h020i' = '049'
        'h021' = '054'
        'h021s' = '053'
        'h023i' = '056'
        'h023m' = '055'
        'h024i' = '052'
        'h024m' = '051'
        'h025i' = '062'
        'h025m' = '061'
        'h026' = '044'
        'h028' = '048'
        'h028s' = '059'
        'heds' = '006'
        'hsvbv' = '076'
        'idum' = '027'
        'idun' = '095'
        'idus' = '105'
        'iduw' = '028'
        'ipc' = '015'
        'ipni' = '067'
        'ipnm' = '066'
        'ipp' = '016'
        'ltfu' = '080'
        'luwy' = '037'
        'm001' = '146'
        'm002' = '147'
        'm003' = '160'
        'm003b' = '160'
        'm003v' = '191'
        'm004' = '136'
        'm007' = '172'
        'm008' = '180'
        'm009' = '177'
        'm011' = '135'
        'm012' = '187'
        'm014' = '201'
        'm015' = '143'
        'm016m' = '164'
        'm016i' = '168'
        'm017' = '198'
        'm020' = '192'
        'm021' = '110'
        'm024' = '203'
        'm025' = '001'
        'm026' = '001'
        'm027' = '527'
        'm028' = '528'
        'm029' = '515'
        'm030' = '001'
        'm033' = '001'
        'm035' = '001'
        'm036' = '001'
        'm037' = '001'
        'm038' = '001'
        'm043' = '001'
        'm044' = '001'
        'n9cp' = '064'
        'n9p' = '042'
        'n9ps' = '043'
        'nvpi' = '003'
        'nvpm' = '002'
        'nzti' = '030'
        'nztm' = '029'
        'p027' = '111'
        'p032' = '074'
        'p035' = '013'
        'p039' = '093'
        'p039a' = '104'
        'p039b' = '149'
        'p039c' = '154'
        'p039d' = '155'
        'p046i' = '090'
        'p046m' = '089'
        'p047' = '086'
        'p049' = '081'
        'p050' = '082'
        'p052' = '096'
        'p055' = '092'
        'p057m' = '114'
        'p057i' = '115'
        'p058' = '123'
        'p059' = '113'
        'p061' = '162'
        'p062' = '173'
        'p063' = '163'
        'p064' = '156'
        'p066' = '181'
        'p067' = '182'
        'p068' = '183'
        'p069' = '109'
        'p073' = '202'
        'p074' = '574'
        'p075' = '570'
        'p076' = '214'
        'p077' = '215'
        'p078' = '578'
        'p082' = '583'
        'p083' = '001'
        'p084' = '001'
        'perup' = '085'
        'pic' = '045'
        'pmpa' = '035'
        'pps' = '011'
        'ppsx' = '012'
        't999' = '247'
        'rmpi' = '007'
        'rmpr' = '008'
        'std' = '005'
        'styles' = '250'
        'test' = '999'
        'trix' = '078'
        'trixc' = '084'
        'upc' = '010'
        'v000' = '000'
        'v014d' = '073'
        'v039' = '072'
        'v040' = '075'
        'v041' = '077'
        'v042' = '091'
        'v044' = '099'
        'v045' = '088'
        'v048' = '094'
        'v049' = '097'
        'v052' = '100'
        'v054' = '107'
        'v055' = '101'
        'v056' = '098'
        'v057' = '103'
        'v059' = '102'
        'v060' = '108'
        'v063' = '112'
        'v064' = '117'
        'v065' = '118'
        'v067' = '132'
        'v068' = '121'
        'v069' = '130'
        'v070' = '138'
        'v071' = '139'
        'v072' = '140'
        'v073' = '129'
        'v073e' = '129'
        'v076' = '174'
        'v077' = '153'
        'v078' = '167'
        'v079' = '170'
        'v080' = '171'
        'v082' = '175'
        'v083' = '178'
        'v084' = '179'
        'v085' = '120'
        'v086' = '185'
        'v087' = '193'
        'v088' = '189'
        'v090' = '165'
        'v092' = '197'
        'v094' = '194'
        'v096' = '196'
        'v097' = '199'
        'v099' = '204'
        'v098' = '509'
        'v100' = '510'
        'v101' = '206'
        'v104' = '213'
        'v105' = '208'
        'v106' = '606'
        'v107' = '617'
        'v108' = '518'
        'v110' = '610'
        'v111' = '511'
        'v112' = '512'
        'v114' = '640'
        'v120' = '520'
        'v121' = '621'
        'v122' = '622'
        'v124' = '624'
        'v049x' = '119'
        'v992' = '240'
        'v203' = '068'
        'v204' = '116'
        'v205' = '152'
        'v403' = '069'
        'v404' = '133'
        'v502' = '992'
        'v503' = '125'
        'v503s' = '205'
        'v504' = '161'
        'v702' = '001'
        'v703' = '573'
        'v704' = '670'
        'v705' = '001'
        'v903' = '079'
        'v803' = '087'
        'v802' = '134'
        'v805' = '001'
        'v905a' = '151'
        'v905b' = '157'
        'v906' = '158'
        'v907' = '159'
        'v908' = '169'
        'v909' = '166'
        'v910' = '190'
        'v914' = '184'
        'v915' = '209'
        'v996' = '996'
        'v997' = '997'
        'v998' = '998'
        'v999' = '999'
        'vcode' = '124'
        'vedc1' = '195'
        'vmpa' = '017'
        'vmpm' = '018'
        'vps' = '010'
        'vps2m' = '033'
        'vps2w' = '034'
        'vscr' = '106'
        'wfit' = '063'
        'prego' = '243'
        'cscr' = '131'
        'm005' = '148'
        'v802a' = '176'
        'rv144' = '0'
        'stju' = '0'
        'm013' = '150'
        's001' = '186'
        'grail' = '188'
        'u006' = '195'
        'm023' = '211'
        'cpn5001' = '001'
        'cpn5002' = '001'
        ;

    /* HIVNET Acronym to SAS Study Directory */
    invalue $sasdir
        'a014m' = '/trials/vaccine/p014/s024'
        'a014w' = '/trials/vaccine/p014/s025'
        'acasi' = '/trials/epi/p001/s004'
        'adrp1' = '/trials/aiedrp/protocol1/s046'
        'adrpc' = '/trials/aiedrp_core/s038'
        'anal' = '/trials/epi/p001/analysis'
        'appeal' = '/trials/phs/APPEAL'
        'aplnew' = '/trials/phs/APPEAL/s109'
        'bit' = '/trials/behav/p015/s026'
        'c001' = '/trials/chavi/p001/s122'
        'c002' = '/trials/chavi/p002/s127'
        'c003' = '/trials/chavi/p003/s128'
        'c005' = '/trials/chavi/p005/s126'
        'c008' = '/trials/chavi/p008/s145'
        'c009' = '/trials/chavi/p009/s141'
        'c012' = '/trials/chavi/p012/s142'
        'cipra1' = '/trials/cipra/s231'
        'cipra2' = '/trials/cipra/s232'
        'cipra3' = '/trials/cipra/s233'
        'cpn5001' = '/trials/covpn/p5001/s001'
        'cpn5002' = '/trials/covpn/p5002/s001'
        'cpn3502' = '/trials/covpn/p3502/s001'
        'vvcf' = '/trials/vaccine/pvcf/s244'
        'corela' = '/trials/aiedrp_core/s070_LA'
        'p911' = '/devel/lauri/p911/s248'
        'ebuc' = '/trials/epi/p001.3/s021'
        'ebum' = '/trials/epi/p001.3/s019'
        'ebuw' = '/trials/epi/p001.3/s020'
        'expc' = '/trials/behav/p015/s060'
        'expl' = '/trials/behav/p015/s040'
        'expp' = '/trials/behav/p015/s050'
        'gen' = '/trials/sas/SASformats'
        'gss' = '/trials/epi/p021/s071'
        'h014am' = '/trials/vaccine/p014.1/s032'
        'h014ap' = '/trials/vaccine/p014.2/s041'
        'h014aw' = '/trials/vaccine/p014.1/s031'
        'h014m' = '/trials/vaccine/p014/s022'
        'h014w' = '/trials/vaccine/p014/s023'
        'h020' = '/trials/microbe/p020/s039'
        'h020i' = '/trials/microbe/p020/s049'
        'h021' = '/trials/epi/p021/s054'
        'h021s' = '/trials/epi/p021/s053'
        'h023i' = '/trials/perinatal/p023/s056'
        'h023m' = '/trials/perinatal/p023/s055'
        'h024i' = '/trials/perinatal/p024/s052'
        'h024m' = '/trials/perinatal/p024/s051'
        'h025i' = '/trials/perinatal/p025/s062'
        'h025m' = '/trials/perinatal/p025/s061'
        'h026' = '/trials/vaccine/p026/s044'
        'h028' = '/trials/aiedrp/h028/s048'
        'h028s' = '/trials/aiedrp/h028/s059'
        'heds' = '/trials/epi/p001.2/s006'
        'hsvbv' = '/trials/epi/p021/s076'
        'idc002' = '/trials/idcrc/p002/s001'
        'idc003' = '/trials/idcrc/p003/s001'
        'idum' = '/trials/epi/p001.4/s027'
        'idun' = '/trials/idu/p037/s095'
        'idus' = '/trials/idu/p037/s105'
        'iduw' = '/trials/epi/p001.4/s028'
        'ipc' = '/trials/epi/p001/s015'
        'ipni' = '/trials/perinatal/p023/s067'
        'ipnm' = '/trials/perinatal/p023/s066'
        'ipp' = '/trials/epi/p001/s016'
        'lab' = '/trials/lab'
        'ltfu' = '/trials/vaccine/ltfu/s080'
        'luwy' = '/trials/aiedrp/luwy/s037'
        'm001' = '/trials/mtn/p001/s146'
        'm002' = '/trials/mtn/p002/s147'
        'm003' = '/trials/mtn/p003/s160'
        'm003b' = '/trials/mtn/p003/s160'
        'm003v' = '/trials/mtn/p003/s191'
        'm004' = '/trials/mtn/p004/s136'
        'm005' = '/trials/mtn/p005/s148'
        'm007' = '/trials/mtn/p007/s172'
        'm008' = '/trials/mtn/p008/s180'
        'm009' = '/trials/mtn/p009/s177'
        'm011' = '/trials/mtn/p011/s135'
        'm012' = '/trials/mtn/p012/s187'
        'm014' = '/trials/mtn/p014/s201'
        'm015' = '/trials/mtn/p015/s143'
        'm016m' = '/trials/mtn/p016/s164'
        'm016i' = '/trials/mtn/p016/s168'
        'm017' = '/trials/mtn/p017/s198'
        'm020' = '/trials/mtn/p020/s192'
        'm021' = '/trials/mtn/p021/s110'
        'm023' = '/trials/mtn/p023/s211'
        'm024' = '/trials/mtn/p024/s203'
        'm025' = '/trials/mtn/p025/s001'
        'm026' = '/trials/mtn/p026/s001'
        'm027' = '/trials/mtn/p027/s527'
        'm028' = '/trials/mtn/p028/s528'
        'm029' = '/trials/mtn/p029/s515'
        'm030' = '/trials/mtn/p030/s001'
        'm033' = '/trials/mtn/p033/s001'
        'm034' = '/trials/mtn/p034/s001'
        'm035' = '/trials/mtn/p035/s001'
        'm036' = '/trials/mtn/p036/s001'
        'm037' = '/trials/mtn/p037/s001'
        'm038' = '/trials/mtn/p038/s001'
        'm039' = '/trials/mtn/p039/s001'
        'm043' = '/trials/mtn/p043/s001'
        'm042' = '/trials/mtn/p042/s000'
        'm042_1' = '/trials/mtn/p042/s001'
        'm044' = '/trials/mtn/p044/s001'
        'n9cp' = '/trials/microbe/p016/s064'
        'n9p' = '/trials/microbe/p016/s042'
        'n9ps' = '/trials/microbe/p016/s043'
        'nvpi' = '/trials/perinatal/p006/s003'
        'nvpm' = '/trials/perinatal/p006/s002'
        'nzti' = '/trials/perinatal/p012/s030'
        'nztm' = '/trials/perinatal/p012/s029'
        'p027' = '/trials/perinatal/p027/s111'
        'p032' = '/trials/microbe/p032/s074'
        'p035' = '/trials/microbe/p035/s013'
        'p039' = '/trials/std/p039/s093'
        'p039a' = '/trials/std/p039/s104'
        'p039b' = '/trials/std/p039/s149'
        'p039c' = '/trials/std/p039/s154'
        'p039d' = '/trials/std/p039/s155'
        'p046i' = '/trials/perinatal/p046/s090'
        'p046m' = '/trials/perinatal/p046/s089'
        'p047' = '/trials/microbe/p047/s086'
        'p049' = '/trials/microbe/p049/s081'
        'p050' = '/trials/microbe/p050/s082'
        'p052' = '/trials/art/p052/s096'
        'p055' = '/trials/epi/p055/s092'
        'p057m' = '/trials/perinatal/p057/s114'
        'p057i' = '/trials/perinatal/p057/s115'
        'p058' = '/trials/idu/p058/s123'
        'p059' = '/trials/microbe/p059/s113'
        'p061' = '/trials/epi/p061/s162'
        'p062' = '/trials/epi/p062/s173'
        'p063' = '/trials/epi/p063/s163'
        'p064' = '/trials/epi/p064/s156'
        'p065' = '/trials/epi/p065'
        'p065s' = '/trials/epi/p065/surveillance'
        'p066' = '/trials/art/p066/s181'
        'p067' = '/trials/art/p067/s182'
        'p068' = '/trials/epi/p068/s183'
        'p069' = '/trials/hptn/p069/s109'
        'p071' = '/trials/hptn/p071/s001'
        'p073' = '/trials/hptn/p073/s202'
        'p074' = '/trials/hptn/p074/s574'
        'p075' = '/trials/hptn/p075/s570'
        'p076' = '/trials/hptn/p076/s214'
        'p077' = '/trials/hptn/p077/s215'
        'p078' = '/trials/hptn/p078/s578'
        'p082' = '/trials/hptn/p082/s583'
        'p083' = '/trials/hptn/p083/s001'
        'p083_1' = '/trials/hptn/p083-01/s001'
        'p084' = '/trials/hptn/p084/s001'
        'p084_1' = '/trials/hptn/p084-01/s001'
        'p091' = '/trials/hptn/p091/s001'
        'p094' = '/trials/hptn/p094/s001'
        'perup' = '/trials/epi/p036/s085'
        'pic' = '/trials/aiedrp/aiedrp_pic/s045'
        'pmpa' = '/trials/microbe/p018/s035'
        'pps' = '/trials/epi/p033/s011'
        'ppsx' = '/trials/epi/p033/s012'
        't999' = '/trials/testprog/p999/s247'
        'rmpi' = '/trials/microbe/p008/s007'
        'rmpr' = '/trials/microbe/p008/s008'
        'rpts' = '/trials/hivnet'
        'sasoq' = '/usr/local/apps/sas/scharp_oq'
        'styles' = '/trials/standards/p000/s250'
        'std' = '/trials/epi/p001.6/s005'
        'test' = '/trials/test'
        'trix' = '/trials/aiedrp/xxx078/s078'
        'trixc' = '/trials/aiedrp/xxx084/s084'
        'upc' = '/trials/epi/p001/s010'
        'v014d' = '/trials/vaccine/p014d/s073'
        'v039' = '/trials/vaccine/p039/s072'
        'v040' = '/trials/vaccine/p040/s075'
        'v041' = '/trials/vaccine/p041/s077'
        'v042' = '/trials/vaccine/p042/s091'
        'v044' = '/trials/vaccine/p044/s099'
        'v045' = '/trials/vaccine/p045/s088'
        'v048' = '/trials/vaccine/p048/s094'
        'v049' = '/trials/vaccine/p049/s097'
        'v052' = '/trials/vaccine/p052/s100'
        'v054' = '/trials/vaccine/p054/s107'
        'v055' = '/trials/vaccine/p055/s101'
        'v056' = '/trials/vaccine/p056/s098'
        'v057' = '/trials/vaccine/p057/s103'
        'v059' = '/trials/vaccine/p059/s102'
        'v060' = '/trials/vaccine/p060/s108'
        'v063' = '/trials/vaccine/p063/s112'
        'v064' = '/trials/vaccine/p064/s117'
        'v065' = '/trials/vaccine/p065/s118'
        'v067' = '/trials/vaccine/p067/s132'
        'v068' = '/trials/vaccine/p068/s121'
        'v069' = '/trials/vaccine/p069/s130'
        'v070' = '/trials/vaccine/p070/s138'
        'v071' = '/trials/vaccine/p071/s139'
        'v072' = '/trials/vaccine/p072/s140'
        'v073' = '/trials/vaccine/p073/s129'
        'v073e' = '/trials/vaccine/p073/s129'
        'v076' = '/trials/vaccine/p076/s174'
        'v077' = '/trials/vaccine/p077/s153'
        'v078' = '/trials/vaccine/p078/s167'
        'v080' = '/trials/vaccine/p080/s171'
        'v082' = '/trials/vaccine/p082/s175'
        'v083' = '/trials/vaccine/p083/s178'
        'v084' = '/trials/vaccine/p084/s179'
        'v085' = '/trials/vaccine/p085/s120'
        'v086' = '/trials/vaccine/p086/s185'
        'v087' = '/trials/vaccine/p087/s193'
        'v088' = '/trials/vaccine/p088/s189'
        'v090' = '/trials/vaccine/p090/s165'
        'v092' = '/trials/vaccine/p092/s197'
        'v094' = '/trials/vaccine/p094/s194'
        'v096' = '/trials/vaccine/p096/s196'
        'v097' = '/trials/vaccine/p097/s199'
        'v098' = '/trials/vaccine/p098/s509'
        'v099' = '/trials/vaccine/p099/s204'
        'v100' = '/trials/vaccine/p100/s510'
        'v101' = '/trials/vaccine/p101/s206'
        'v104' = '/trials/vaccine/p104/s213'
        'v105' = '/trials/vaccine/p105/s208'
        'v049x' = '/trials/vaccine/p049x/s119'
        'v106' = '/trials/vaccine/p106/s606'
        'v107' = '/trials/vaccine/p107/s617'
        'v108' = '/trials/vaccine/p108/s518'
        'v110' = '/trials/vaccine/p110/s610'
        'v111' = '/trials/vaccine/p111/s511'
        'v112' = '/trials/vaccine/p112/s512'
        'v114' = '/trials/vaccine/p114/s640'
        'v115' = '/trials/vaccine/p115/s001'
        'v115b' = '/trials/vaccine/p115/s002'
        'v116' = '/trials/vaccine/p116/s001'
        'v117' = '/trials/vaccine/p117/s001'
        'v118' = '/trials/vaccine/p118/s001'
        'v119' = '/trials/vaccine/p119/s001'
        'v120' = '/trials/vaccine/p120/s520'
        'v121' = '/trials/vaccine/p121/s621'
        'v122' = '/trials/vaccine/p122/s622'
        'v123' = '/trials/vaccine/p123/s001'
        'v124' = '/trials/vaccine/p124/s624'
        'v127' = '/trials/vaccine/p127/s001'
        'v128' = '/trials/vaccine/p128/s001'
        'v133' = '/trials/vaccine/p133/s001'
        'v130' = '/trials/vaccine/p130/s001'
        'v134' = '/trials/vaccine/p134/s001'
        'v132' = '/trials/vaccine/p132/s001'
        'v137' = '/trials/vaccine/p137/s001'
        'v136' = '/trials/vaccine/p136/s001'
        'v135' = '/trials/vaccine/p135/s001'
        'v139' = '/trials/vaccine/p139/s001'
        'v140' = '/trials/vaccine/p140/s001'
        'v999' = '/trials/vaccine/p999/s999'
        'v203' = '/trials/vaccine/p203/s068'
        'v204' = '/trials/vaccine/p204/s116'
        'v205' = '/trials/vaccine/p205/s152'
        'v300' = '/trials/vaccine/p300/s001'
        'v403' = '/trials/vaccine/p403/s069'
        'v404' = '/trials/vaccine/p404/s133'
        'v405' = '/trials/vaccine/p405/s001'
        'v502' = '/trials/vaccine/p502'
        'v503' = '/trials/vaccine/p503/s125'
        'v503s' = '/trials/vaccine/p503s/s205'
        'v504' = '/trials/vaccine/p504/s161'
        'v505' = '/trials/vaccine/p505/s137'
        'v601' = '/trials/vaccine/p601/s000'
        'v602' = '/trials/vaccine/p602/s001'
        'v702' = '/trials/vaccine/p702/s001'
        'v703' = '/trials/vaccine/p703/s573'
        'v704' = '/trials/vaccine/p704/s670'
        'v705' = '/trials/vaccine/p705/s001'
        'v706' = '/trials/vaccine/p706/s001'
        'v802' = '/trials/vaccine/p802/s134'
        'v802a' = '/trials/vaccine/p802/s176'
        'v803' = '/trials/vaccine/p803/s087'
        'v804' = '/trials/vaccine/p804/s001'
        'v805' = '/trials/vaccine/p805/s001'
        'v903' = '/trials/vaccine/p903/s079'
        'v905a' = '/trials/vaccine/p905/s151'
        'v905b' = '/trials/vaccine/p905/s157'
        'v906' = '/trials/vaccine/p906/s158'
        'v907' = '/trials/vaccine/p907/s159'
        'v908' = '/trials/vaccine/p908/s169'
        'v909' = '/trials/vaccine/p909/s166'
        'v910' = '/trials/vaccine/p910/s190'
        'v914' = '/trials/vaccine/p914/s184'
        'v915' = '/trials/vaccine/p915/s209'
        'vcode' = '/trials/vaccine/p204/s124'
        'vedc1' = '/trials/vaccine/edc1/s195'
        'vmpa' = '/trials/microbe/p009/s017'
        'vmpm' = '/trials/microbe/p009/s018'
        'vps' = '/trials/epi/p001/s010'
        'vps2anal' = '/trials/epi/p001.5/analysis'
        'vps2m' = '/trials/epi/p001.5/s033'
        'vps2w' = '/trials/epi/p001.5/s034'
        'vscr' = '/trials/vaccine/screen/s106'
        'wfit' = '/trials/behav/p029/s063'
        'prego' = '/trials/preg_outcome/s243'
        'cscr' = '/trials/chavi/cscr/s131'
        'rv144' = '/trials/vaccine/thai_trial_rv144'
        'stju' = '/trials/vaccine/contract_work/st_judes'
        'm013' = '/trials/mtn/p013/s150'
        's001' = '/trials/epi/shims001/s186'
        'grail' = '/trials/infect/grail/s188'
        'grail3' = '/trials/infect/grail3/s001'
        'u006' = '/trials/UPCID/p006/s195'
        'cvd264' = '/networks/cavd/studies/cvd264'
        ;

    /* assayqc format used by PAP */
    value assayqc
        1 = "Header error"
        2 = "Data input error"
        3 = "Missing data in required field"
        4 = "Invalid data value"
        5 = "File does not exist"
        6 = "Wrong number of records in file"
        7 = "Code does not exist"
        8 = "Assay dataset is already locked"
        9 = "Multiple files with same name submitted"
        10 = "Duplicate results received"
        11 = "Non-enrolled ptid"
        12 = "No match to CRF"
        13 = "Assay/CRF visits don't match"
        14 = "Assay/CRF collection dates don't match"
        15 = "Assay/CRF collection times don't match"
        16 = "Not expected (collection not listed as 'stored' on CRF) but received"
        17 = "Not expected (missed visit) but received"
        18 = "Not expected (terminated) but received"
        19 = "Not expected (DOA) but received"
        ;

    value VISP
        1 = 'Yes'
        0 = 'No'
        other = 'Unknown'
        ;

     value spectyp
        1 = 'Dried Blood Spot'
        2 = 'Cervical-vaginal swab'
        3 = 'FFN'
        4 = 'Gram Stain - Vaginal'
        5 = 'Plasma'
        6 = 'Repository Sample'
        7 = 'GUD Swab'
        8 = 'QA Sample'
        9 = 'Plasma for genotyping'
        10 = 'PBMC'
        11 = 'Plasma for Storage'
        12 = 'Serum for Storage'
        13 = 'Whole Blood'
        14 = 'Cervical Sample (Sno strip)'
        15 = 'Semen Sample HIV-1 RNA'
        16 = 'Semen'
        17 = 'Cervical Sample (Tear-flo strip)'
        18 = 'Serum'
        19 = 'Vaginal swab'
        20 = 'Gram Stain - Cervical'
        21 = 'Cervical swab'
        22 = 'Cord Blood'
        23 = 'Breast Milk (whole)'
        24 = 'Amniotic Fluid'
        25 = 'Urine'
        26 = 'Cervical - vaginal lavage'
        27 = 'Cell pellet'
        28 = 'Feces'
        29 = 'Saliva'
        30 = 'Placenta'
        31 = 'Plasma for PK'
        32 = 'Endometrial tissue'
        33 = 'Cervical Cytology Brush'
        34 = 'Vaginal Tissue Biopsy'
        35 = 'WBC from Leukapheresis'
        36 = 'Rectal Sponge'
        37 = 'PBMC from Leukapheresis'
        38 = 'Rectal Swab'
        39 = 'Rectal Lavage Fluid'
        40 = 'Anoscopy Rectal Biopsy ARB/RNL (cytokines)'
        41 = 'Anoscopy Rectal Biopsy ARB/RNL (gene expression)'
        42 = 'Anoscopy Rectal Biopsy ARB/RPM (phenotyping)'
        43 = 'Anoscopy Rectal Biopsy ARB/FOR (histology)'
        44 = 'Anoscopy Rectal Biopsy ARB/RPM'
        45 = 'Anoscopy Rectal Biopsy ARB/FOR'
        46 = 'Anoscopy Rectal Biopsy ARB/SNP'
        47 = 'Anoscopy Rectal Biopsy R10 media'
        48 = 'Sigmoidoscopy Rectal Biopsy FSR/RNL (cytokines)'
        49 = 'Sigmoidoscopy Rectal Biopsy FSR/RNL (gene expression)'
        50 = 'Sigmoidoscopy Rectal Biopsy FSR/RPM (phenotyping)'
        51 = 'Sigmoidoscopy Rectal Biopsy FSR/FOR (histology)'
        52 = 'Sigmoidoscopy Rectal Biopsy FSR/RPM'
        53 = 'Sigmoidoscopy Rectal Biopsy FSR/FOR'
        54 = 'Sigmoidoscopy Rectal Biopsy R10 media'
        55 = 'Sigmoidoscopy Colon Biopsy FSC/RPM'
        56 = 'Sigmoidoscopy Colon Biopsy FSC/FOR'
        57 = 'Sigmoidoscopy Colon Biopsy R10 media'
        58 = 'Blood CD4+ cells'
        59 = 'Sigmoidoscopy Rectal Biopsy total tissue'
        60 = 'Sigmoidoscopy Rectal Biopsy CD4+'
        61 = 'Vaginal biopsy, total tissue'
        62 = 'Vaginal biopsy, CD4+ cells'
        63 = 'Vaginal, luminal fluid'
        64 = 'Seminal plasma'
        65 = 'Seminal cells'
        66 = 'Rectal Biopsy'
        67 = 'Vaginal Swab (Microflora culture)'
        68 = 'Foreskin Outer'
        69 = 'Foreskin Inner'
        70 = 'Foreskin'
        71 = 'Sigmoidoscopy Rectal Biopsy FSR/SNP'
        72 = 'Sigmoidoscopy Colon Biopsy FSC/SNP'
        73 = 'Intravaginal Ring'
        74 = 'Intravaginal Ring Swab'
        75 = 'Cervical Sponge'
        76 = 'Cell Culture Supernatant'
        77 = 'Hair'
        78 = 'Cervical Biopsy for PK'
        79 = 'Cervical Biopsy'
        80 = 'Vaginal Sample (Tear-flo strip)'
        81 = 'Vaginal swab for PK validation'
        82 = 'Trucount'
        83 = 'Cells in Other (Solution) Non-Viable'
        84 = 'Serum - Chilled'
        85 = 'Plasma for HIV Confirmation'
        86 = 'Plasma for Seroconverter'
        87 = 'Oral Swab'
        88 = 'Tempus'
        89 = 'PBMC for PK'
        90 = 'Sigmoidoscopy Rectal Biopsy FSR/BTM'
        91 = 'Cervical Cytobrush'
        92 = 'Sigmoidoscopy Rectal Biopsy FSR/RNL'
        93 = 'Dried Blood Spot for PK'
        94 = 'Anal Swab'
        95 = 'Rectal Sponge for PK'
        96 = 'Rectal Sponge for PD'
        97 = 'Cultured Explant biopsies'
        98 = 'Cervical Vaginal Explant biopsies'
        99 = 'Cervical Vaginal Cell Culture Supernatnant'
        100 = 'Pre-Infusion SST'
        101 = 'Post-Infusion SST'
        102 = 'Aliquot excluded from specimen monitoring'
        103 = 'Vaginal swab self collected'
        104 = 'Dried Blood Spot from Finger Stick'
        105 = 'Dried Urine Cartridge'
        106 = 'Dried Urine Filter Paper'
        107 = 'Stool Swab Sample'
        108 = 'Vaginal Swab cell pellet'
        109 = 'Vaginal Swab supernatant'
        110 = 'Cervical Biopsy tissue'
        111 = 'Cervical Biopsy supernatant'
        112 = 'Rectal Swab for GC/CT Testing'
        113 = 'Perianal DNA'
        114 = 'Cervicovaginal Fluid'
        115 = 'Breast milk for PD'
        116 = 'Breast milk for PK'
        117 = 'Rectal Balloon'
        118 = 'Vaginal Swab for LNG-PK'
        119 = 'Vaginal Swab for DPV-PK'
        120 = 'QFT – QuantiFERON-TB Gold Nil'
        121 = 'QFT – QuantiFERON-TB Gold Antigen'
        122 = 'QFT – QuantiFERON-TB Gold Mitogen'
        123 = 'IGRA – Interferon-Gamma Release Assay Ag1'
        124 = 'IGRA – Interferon-Gamma Release Assay Ag2'
        125 = 'Rectal Swab for Microflora'
        126 = 'Rectal Swab for PK'
        127 = 'Rectal Enema for PD-Fluid'
        128 = 'Rectal Enema for PD-Cells'
        129 = 'Rectal Biopsies for PK'
        130 = 'Rectal Biopsies for PD'
        131 = 'Rectal Biopsy Supernatant (Culture Derivative)'
        132 = 'Rectal Biopsy for PCR (Culture Derivative)'
        133 = 'Rectal Biopsies for T cell Phenotyping'
        134 = 'Nasal Swab'
        135 = 'Infusion Reaction SST'
        136 = 'mAB reaction'
        137 = 'Plasma for Contraceptive Sub Study'
        138 = 'Nasal Wash'
        139 = 'Nasopharyngeal Swab'
        140 = 'NaHep tube'
        141 = 'Breastmilk Cells'
        142 = 'Breastmilk Supernatant'
        143 = 'Cord Blood SST'
        144 = 'Cord Blood NaHep'
        145 = 'CBMC'
        146 = 'Stimulated Cord Blood - Negative Control'
        147 = 'Stimulated Cord Blood - Protein Antigen'
        148 = 'Stimulated Cord Blood - Antigen'
        149 = 'Stimulated Cord Blood - Complete Vaccine'
        150 = 'Stimulated Cord Blood - Positive Control 1 LPS'
        151 = 'Stimulated Cord Blood - Positive Control 2 R848'
        152 = 'Bulk Stool'
        153 = 'Lymph Node FNA'
        154 = 'Leukapheresis'
        155 = 'Bone Marrow Aspirate'
        156 = 'Systems Biology CBMC'
        157 = 'Infant Plasma'
        ;

    /* VPS-1 Sites */
    value site
        010 = 'San Francisco'
        020 = 'Seattle'
        030 = 'Philadelphia'
        040 = 'Chicago'
        050 = 'Boston'
        060 = 'NY Blood Center'
        070 = 'Denver'
        080 = 'NYU Medical Center'
        090 = 'Los Angeles'
        100 = 'Bronx-Lebanon'
        110 = 'Johns Hopkins'
        ;

    /* map DataFax Study Number to study description */
    value study
        2 = 'NVP P1 Mothers'
        3 = 'NVP P1 Infants'
        4 = 'ACASI'
        5 = 'STD'
        6 = 'HEDS'
        7 = 'RMP P1 Insertive'
        8 = 'RMP P1 Receptive'
        9 = 'APPEAL - PHS/CPRP study'
        10 = 'UPC'
        11 = 'HPTN 033: Prevention Preparedness'
        12 = 'HPTN 033: Preventn.Preparedness Xinjiang'
        13 = 'HPTN 035: Phase II/IIb Safety and Effectiveness Microbicide Study'
        15 = 'IPC'
        16 = 'IPC Partner'
        17 = 'VMP P1 Abstinent'
        18 = 'VMP P1 Monogamous'
        19 = 'EBU-Case Men'
        20 = 'EBU-Case Women'
        21 = 'EBU-Control'
        22 = 'HIVNET 014-Men'
        23 = 'HIVNET 014-Women'
        24 = 'AVEG 202-Men'
        25 = 'AVEG 202-Women'
        26 = 'EXPLORE Pilot'
        27 = 'New IDU Men'
        28 = 'New IDU Women'
        29 = 'NVP/AZT Mothers'
        30 = 'NVP/AZT Infants'
        31 = 'HIVNET 014A-Women'
        32 = 'HIVNET 014A-Men'
        33 = 'VPS 2 Men'
        34 = 'VPS 2 Women'
        35 = 'PMPA Microbicide'
        37 = 'Mucosal'
        38 = 'AIEDRP Core'
        39 = 'PRO2000 Domestic'
        40 = 'EXPLORE Main-Trial'
        41 = 'HIVNET 014A-Partner'
        42 = 'N-9 Pilot Enrollment'
        43 = 'N-9 Pilot Screening'
        44 = 'HIVNET 026 Vaccine'
        45 = 'AIEDRP PIC'
        46 = 'AIEDRP Seattle Protocol 1'
        48 = 'HIVNET 028: South Africa'
        49 = 'PRO2000 International'
        50 = 'EXPLORE Pre-Screen'
        51 = 'HIVNET 024 Chorio Mom'
        52 = 'HIVNET 024 Chorio Infant'
        53 = 'HIVNET 021 Screening'
        54 = 'HIVNET 021 Main Trial'
        55 = 'HIVNET 023 Mom'
        56 = 'HIVNET 023 Infant'
        59 = 'HIVNET 028: S Africa Sero+'
        60 = 'EXPLORE CAPS'
        61 = 'HIVNET 025 Chlorhex Mom'
        62 = 'HIVNET 025 Chlorhex Infant'
        63 = 'HIVNET 029 WFIT'
        64 = 'N-9 Condom Promotion'
        66 = 'HIVNET 023 IPN Mom'
        67 = 'HIVNET 023 IPN Infant'
        68 = 'HVTN 203 Ph II Dom Vacc'
        69 = 'HVTN 403 Infected Participants'
        70 = 'AIEDRP Core - LA'
        71 = 'GS Ancillary - HCHIV'
        72 = 'HVTN 039 Ph I Dom Vacc'
        73 = 'HVTN 014D'
        74 = 'HPTN 032: Male P2000/Buff. Gel'
        75 = 'HVTN 040 Ph I VEE GagReplicon'
        76 = 'HC-HIV HSV2/BV Ancillaries'
        77 = 'HVTN 041 Ph I Dom Vacc'
        78 = 'AIN005 Triple-X'
        79 = 'HVTN 903 VPS'
        80 = 'VTN Long Term Follow Up'
        81 = 'HPTN 049: Cellulose Sulfate'
        82 = 'HPTN 050: PMPA'
        84 = 'AIN005 Triple-XControl'
        85 = 'HPTN 036: Peru Preparedness'
        86 = 'HPTN 047: PRO 2000/5 Gel'
        87 = 'HVTN 803: Human/Macaque'
        88 = 'HVTN 045 PH I DNA VACC'
        89 = 'HPTN 046: NVP Breastfeed-Moms'
        90 = 'HPTN 046: NVP Breastfeed-Infants'
        91 = 'HVTN 042: LIPO-5 / ALVAC'
        92 = 'HPTN 055: Prevention Preparedness'
        93 = 'HPTN 039: HSV-2 and Acyclovir'
        94 = 'HVTN 048 Ph I Epimmune'
        95 = 'HPTN 037: IDU Networks'
        96 = 'HPTN 052: ART in HIV Serodiscordant Couples'
        97 = 'HVTN 049: Chiron DNA/PLG'
        98 = 'HVTN 056: Ph I Wyeth Peptide'
        99 = 'HVTN 044 Ph I VRC'
        000 = 'HVTN 000: Domestic Site-Affiliated Lab Proficiency Testing (PTIDs 000-999)'
        100 = 'HVTN 052: VRC DNA Alone'
        101 = 'HVTN 055: Ph I Therion FPV/MVA'
        102 = 'HVTN 059: Alphavax'
        103 = 'HVTN 057: VRC Adenoviral Boost'
        104 = 'HPTN 039 Ancillary: Seroconverters'
        105 = 'HPTN 037: IDU Sessions'
        106 = 'HVTN Screening Protocol'
        107 = 'HVTN 054: Multiclade Recombinant Adenoviral'
        108 = 'HVTN 060: Wyeth DNA'
        109 = 'HPTN 069'
        110 = 'MTN 021: Safety & Acceptability Study of 1% Tenofovir Gel in Adolescent Females'
        111 = 'HPTN 027: ALVAC Infant'
        112 = 'HVTN 063: Wyeth IL-15'
        113 = 'HPTN 059: Ph II Tenofovir Gel'
        114 = 'HPTN 057: Ph I Tenofovir Mothers'
        115 = 'HPTN 057: Ph I Tenofovir Infants'
        116 = 'HVTN 204: VRC DNA/Adeno'
        117 = 'HVTN 064: Epimmune HTL/DNA'
        118 = 'HVTN 065: GeoVax DNA/MVA'
        119 = 'HVTN 049 group 5: Chiron GP140'
        121 = 'HVTN 068: VRC Kinetics'
        120 = 'HVTN 085'
        122 = 'CHAVI 001: Acute HIV-1 Infection'
        123 = 'HPTN 058: Buprenorphine/Naloxone for IDU'
        124 = 'EMMES AE Data'
        125 = 'HVTN 503: Phase IIb Merck Adeno'
        126 = 'CHAVI 005: Cross Reactivity-Autoimmune Disease with HIV Envelope'
        127 = 'CHAVI 002: Determinants of Host Resistance to HIV-1 Infection'
        128 = 'CHAVI 003: Immune Responses in EUM'
        129 = 'HVTN 073: SAAVI DNA-MVA'
        130 = 'HVTN 069: VRC Routes'
        131 = 'CHAVI Screening'
        132 = 'HVTN 067: Pharmexa DNA/MVA'
        133 = 'HVTN 404: Follow-up of HIV-1 Infection'
        134 = 'HVTN 802: Observational Study of effectiveness of ART in HIV infected persons in phase IIb trials'
        135 = 'MTN 011: Coital PK/PD of Tenofovir Gel'
        136 = 'MTN 004: Starpharma Ph I VivaGel'
        137 = 'HVTN 505'
        138 = 'HVTN 070: Phase I Pennvax'
        139 = 'HVTN 071: Phase Ib MRKAd5 Vaccine'
        140 = 'HVTN 072: Phase Ib VRC Ad35 Vaccine'
        141 = 'CHAVI 009: Transmission via Breast Milk'
        142 = 'CHAVI 012: Mucosal and Innate Immune Responses'
        143 = 'MTN 015: Microbicide Seroconverter'
        145 = 'CHAVI 008: Molecular Characterization'
        146 = 'MTN 001: Ph II Adherence & PK of Oral & Vaginal of Tenofovir'
        147 = 'MTN 002: Ph I Tenofovir Gel Maternal PK and Placental Transfer'
        148 = 'MTN 005: Expanded Safety and Acceptability Study of a Non-medicated Intravaginal Ring'
        149 = 'HPTN 039 Ancillary: Adherence'
        151 = 'HVTN 905 Project 01: Evaluation of Cellular Immune Responses at Mucosal Sites'
        152 = 'HVTN 205: Phase IIa GeoVax DNA/MVA'
        153 = 'HVTN 077: Phase Ib rAd35 and rAd5 HIV-1 Vaccines'
        154 = 'HPTN 039 Ancillary: PK'
        155 = 'HPTN 039 Ancillary: GUD'
        156 = 'HPTN 064: ISIS'
        157 = 'HVTN 905 Project 02: Collection of specimens from peripheral blood among male vaccinee responders'
        158 = 'HVTN 906: High Risk Women - U.S.'
        159 = 'HVTN 907: High Risk Women - Caribbean'
        160 = 'MTN 003: Phase IIb Vaginal and Oral Interventions to Control the Epidemic (VOICE)'
        161 = 'HVTN 504'
        162 = 'HPTN 061: Feasibility Study of a Community-level Intervention for Black MSM'
        163 = 'HPTN 063'
        164 = 'MTN 016 Mother: HIV Prevention Agent Pregnancy Exposure Registry - EMBRACE study'
        165 = 'HVTN 090'
        166 = 'HVTN LTFU: Continuing Safety Surveillance'
        167 = 'HVTN 078'
        168 = 'MTN 016 Infant: HIV Prevention Agent Pregnancy Exposure Registry - EMBRACE study'
        169 = 'HVTN 908: Innate Immune Response'
        170 = 'NOT YET REGISTERED BY PROTOCOL PROGRAMMER'
        171 = 'HVTN 080'
        172 = 'MTN 007'
        173 = 'HPTN 062: Behavioral Intervention for Individuals with Acute and Early HIV Infection'
        174 = 'HVTN 076: VRC Mucosal'
        175 = 'HVTN 082: VRC Twins'
        176 = 'HVTN 802 Part A'
        177 = 'MTN 009: HIV-1 Drug Resistance Study'
        178 = 'HVTN 083'
        179 = 'HVTN 084'
        180 = 'MTN 008'
        181 = 'HPTN 066: Truvada iPrEP-PK Study'
        182 = 'HPTN 067: Intermittent PrEP Study'
        183 = 'HPTN 068: Effects of cash transfer for the prevention of HIV in young South African women'
        184 = 'HVTN 914'
        185 = 'HVTN 086'
        187 = 'MTN 012'
        188 = 'GRAIL Study'
        189 = 'HVTN 088'
        190 = 'HVTN 910'
        191 = 'MTN 003B Version 2: Bone Mineral Substudy Ancillary to MTN 003 (VOICE)'
        192 = 'MTN 020: Aspire'
        193 = 'HVTN 087'
        194 = 'HVTN 094'
        195 = 'Uganda Program 006'
        196 = 'HVTN 096'
        197 = 'HVTN 092'
        198 = 'MTN 017'
        199 = 'HVTN 097'
        200 = 'NOT YET REGISTERED BY PROTOCOL PROGRAMMER'
        201 = 'MTN 014'
        202 = 'HPTN 073'
        203 = 'MTN 024'
        204 = 'HVTN 099'
        205 = 'HVTN 503s'
        206 = 'HVTN 101'
        208 = 'HVTN 105'
        209 = 'HVTN 915'
        211 = 'MTN 023'
        213 = 'HVTN 104'
        214 = 'HPTN 076'
        215 = 'HPTN 077'
        231 = 'CIPRA 231 - Lisa study'
        232 = 'CIPRA 232 - Kevin study'
        233 = 'CIPRA 233 - Ma study'
        240 = 'Test Study - 041 clone'
        243 = 'Pregnancy Outcomes'
        244 = 'VTN common forms'
        247 = 'Reports Programmer Testing'
        248 = 'DC Training Demo'
        250 = 'STYLES'
        255 = 'DataFax Test Validation'
        990 = 'DONE W/ VPS: SITE FOLLOWUP'
        150 = 'MTN 013'
        186 = 'SHIMS001'
        509 = 'HVTN 098'
        510 = 'HVTN 100'
        512 = 'HVTN 112'
        511 = 'HVTN 111'
        514 = 'MTN 026'
        515 = 'MTN 029'
        518 = 'HVTN 108'
        520 = 'HVTN 120'
        527 = 'MTN 027'
        528 = 'MTN 028'
        570 = 'HPTN 075'
        573 = 'HVTN 703'
        574 = 'HPTN 074'
        578 = 'HPTN 078'
        583 = 'HPTN 082'
        606 = 'HVTN 106'
        610 = 'HVTN 110'
        617 = 'HVTN 107'
        621 = 'HVTN 121'
        622 = 'HVTN 122'
        640 = 'HVTN 114'
        670 = 'HVTN 704'
        624 = 'HVTN 124'
        991 = 'OTHER: NOT ELIGIBLE'
        992 = 'HVTN 502: Merck'
        996 = "HVTN 996: LDMS Validation"
        997 = "HVTN 997: Int'l Site-Affiliated Lab QA Testing (PTIDs 500-999)"
        998 = "HVTN 998: Int'l Site-Affiliated Lab Proficiency Testing (PTIDs 000-499)"
        999 = 'HVTN 999: Dummy Protocol for Web Randomization Testing'
        ;

    /* HVTN site number, name */
    VALUE vtnsite
        121 = 'University of Alabama at Birmingham'
        122 = 'Johns Hopkins University'
        123 = 'University of Rochester Medical Center'
        124 = 'St. Louis University School of Medicine'
        125 = 'Vanderbilt University'
        126 = 'University of Washington/FHCRC'
        127 = 'San Francisco Dept. Public Health'
        128 = 'Harvard/Brigham & Womens Hospital'
        129 = 'Harvard/Fenway'
        130 = 'Harvard/Miriam'
        132 = 'Columbia University/Columbia U'
        133 = 'Columbia University/NYBC Union Square'
        134 = 'Columbia University/NYBC Bronx'
        135 = 'U Maryland/IHV'
        136 = 'U Maryland/Fairfax'
        137 = 'S Africa/Durban - MRC'
        138 = 'S Africa/Soweto - PHRU'
        102 = 'Sao Paulo - CRT - DST/AIDS'
        103 = 'University of Alabama at Birmingham'
        104 = 'Harvard/Brigham & Womens Hospital'
        105 = 'Harvard/Fenway'
        106 = 'Columbia University/Columbia U'
        107 = 'Columbia University/NYBC Union Square'
        108 = 'Columbia University/NYBC Bronx'
        109 = 'University of Washington/FHCRC'
        111 = 'Vanderbilt University'
        112 = 'Brazil - Rio HESFA'
        113 = 'San Francisco Dept. Public Health'
        114 = 'Philadelphia/University of Pennsylvania'
        115 = 'University of Rochester Medical Center'
        116 = 'Rwanda - Kigali' /* non-VTN (IAVI) site*/
        117 = 'Uganda - Entebbe' /* non-VTN (IAVI) site*/
        118 = 'Zambia - Lusaka' /* non-VTN (IAVI) site*/
        119 = 'Kenya - Kericho' /* non-VTN (USMHRP) site*/
        120 = 'Tanzania, Mbeya: NIMR'
        131 = 'Bethesda - VRC'
        139 = 'Peru - Impacta II' /*never used used for vtn 901*/
        140 = 'Peru - Iquitos'
        141 = 'Haiti'
        142 = 'Botswana - Gaborone'
        143 = 'Puerto Rico'
        144 = 'Dominican Republic'
        146 = 'Botswana - Jwaneng'
        154 = 'Jamaica'
        159 = 'S Africa/Soweto - PHRU'
        160 = 'S Africa/Cape Town'
        161 = 'S Africa/KOSH'
        162 = 'S Africa/eThekwini'
        163 = 'S Africa/Medunsa'
        164 = 'Peru - Lima'
        165 = 'Chicago/Illinois'
        169 = 'Uganda - Kampala' /* non-VTN (USMHRP) site*/
        170 = 'Kenya - Kisumu' /* non-VTN (CDC) site*/
        171 = 'Emory University'
        172 = 'Wake County Health & Human Services'
        173 = 'Kenya - Nairobi' /* non-VTN (IAVI) site*/
        174 = 'Kenya - Kilifi' /* non-VTN (IAVI) site*/
        177 = 'Denver' /*site IDs 177-189 are Merck 502,504 sites*/
        178 = 'Webster'
        179 = 'Houston'
        180 = 'Los Angeles'
        181 = 'Miami'
        182 = 'NYU/East Midtown'
        183 = 'Newark'
        184 = 'Australia - Sydney'
        185 = 'Peru - Cercado'
        186 = 'Dominican Republic - IDEV'
        187 = 'Canada - Toronto'
        188 = 'Canada - Vancouver'
        189 = 'Canada - Montreal'
        190 = 'St. Louis University School of Medicine'
        191 = 'Dallas'
        192 = 'Annandale'
        193 = 'Cleveland'
        194 = 'Orlando'
        195 = 'Baylor'
        196 = 'Lausanne/Centre Hospitalier Univ Vaudois'
        401 = 'Atlanta - Emory University'
        402 = 'University of Alabama at Birmingham'
        403 = 'Harvard/Brigham & Womens Hospital'
        404 = 'Columbia University/NYBC Bronx'
        405 = 'Chicago/Illinois'
        406 = 'Harvard/Fenway'
        407 = 'Columbia University/Columbia U'
        408 = 'Vanderbilt University'
        409 = 'Philadelphia/University of Pennsylvania'
        410 = 'Puerto Rico'
        411 = 'University of Washington/FHCRC'
        412 = 'University of Rochester Medical Center'
        413 = 'Columbia University/NYBC Union Square'
        414 = 'San Francisco Dept. Public Health'
        415 = 'Peru - Lima'
        416 = 'Dominican Republic'
        417 = 'S Africa/Cape Town'
        418 = 'Haiti'
        419 = 'Peru - Iquitos'
        420 = 'S Africa/KOSH'
        421 = 'Lausanne/Centre Hospitalier Univ Vaudois'
        422 = 'Sao Paulo - CRT - DST/AIDS'
        423 = 'S Africa/Soweto - PHRU'
        424 = 'S Africa/Durban - Isipingo'
        425 = 'S Africa/Durban - eThekwini-CAPRISA'
        426 = 'Malawi/Lilongwe - UNC'
        427 = 'Mozambique/Maputo - CISPOC'
        428 = 'Tanzania/Mbeya - NIMR'
        429 = 'Cleveland/Case Western CRS'
        430 = 'Kenya, Kericho: KEMRI/WRP'
        508 = 'South Africa, Durban: Isipingo - MRC'
        509 = 'Malawi, Lilongwe: UNC'
        513 = 'Mozambique, Maputo: CISPOC'
        525 = 'S Africa, Pietermaritzburg: MatCH'
        536 = 'S Africa, Soshanguve: Setshaba Research Centre'
        544 = 'S Africa, Tembisa: Aurum-Tembisa'
        547 = 'US, Los Angeles: UCLA Care Center'
        555 = 'S Africa, Kliptown'
        556 = 'S Africa, Verulam CRS'
        582 = 'Zambia, Lusaka: Matero'
        583 = 'Zimbabwe, Harare: Seke South'
        605 = 'Lima, San Marcos'
        607 = 'Durham'
        101 = 'Chicago/Illinois'
        145 = 'Botswana - Gaborone'
        147 = 'Blantyre - College of Medicine'
        148 = 'Chiang Mai - Chiang Mai University'
        149 = 'Sao Paulo - CRT - DST/AIDS'
        150 = 'Peru - Iquitos'
        151 = 'Botswana - Jwaneng'
        152 = 'Puerto Rico'
        153 = 'Dominican Republic'
        155 = 'Jamaica'
        156 = 'S Africa/Cape Town'
        157 = 'S Africa/KOSH'
        158 = 'Philadelphia/University of Pennsylvania'
        166 = 'Raleigh/Wake County Health & Human Serv'
        167 = 'Atlanta - Emory University'
        168 = 'Lausanne/Centre Hospitalier Univ Vaudois'
        175 = 'S Africa/Isipingo'
        176 = 'S Africa/Umbilo'
        197 = 'Rustenburg'
        198 = 'University of Pittsburgh'
        199 = 'South Africa, Durban: eThekwini-CAPRISA'
        200 = 'Malawi, Lilongwe: UNC'
        505 = 'Mozambique, Maputo: CISPOC'
        506 = 'Tanzania, Mbeya: NIMR'
        507 = 'US, Cleveland: Case Western CRS'
        514 = 'S Africa, Pietermaritzburg: MatCH'
        518 = 'S Africa, Soshanguve: Setshaba Research Centre'
        519 = 'S Africa, Tembisa: Aurum-Tembisa'
        545 = 'Zambia, Lusaka: Matero'
        546 = 'Zimbabwe, Harare: Seke South'
        548 = 'S Africa, Verulam CRS'
        549 = 'S Africa, Kliptown'
        557 = 'S Africa, Brits: Madibeng Centre for Research'
        558 = 'S Africa, Ladysmith: Qhakaza Mbokodo'
        559 = 'S Africa, Chatsworth'
        569 = 'Peru, Via Libre'
        269 = "Atlanta - Ponce de Leon"
        270 = "Boston - Fenway Health"
        271 = "Columbia - Harlem Prevention"
        272 = "Columbia - Bronx Prevention"
        273 = "Chapel Hill"
        274 = "New Jersey Medical School"
        275 = "George Washington University"
        276 = "Cape Town"
        277 = "Vulindlela"
        278 = "Johannesburg"
        279 = "Blantyre"
        280 = "Lilongwe"
        281 = "Harare-Parirenyatwa"
        282 = "Harare-Spilhaus"
        283 = "Gabarone"
        284 = "Kisumu-KEMRI"
        285 = "Iquitos"
        286 = "Lima - San Miguel"
        287 = "Rio de Janeiro"
        288 = "Los Angeles - UCLA"
        581 = 'Haiti - Les Centres GHESKIO'
        584 = 'S Africa, Botha Hill'
        586 = 'S Africa, Chatsworth'
        587 = 'Peru, Via Libre'
        588 = 'S Africa, Botha Hill'
        589 = 'US, Silver Spring' /* HVTN 117 Janssen study */
        591 = 'Brazil - Rio HESFA'
        601 = 'Trinidad and Tobago'
        603 = 'Rwanda' /* HVTN 117 Janssen study */
        604 = 'Boston, Beth Israel Deaconess Medical Center'
        621 = 'Peru - Lima ACISE'
        635 = 'S Africa, Rustenburg'
        636 = 'S Africa, Mamelodi'
        637 = 'S Africa, Durban - Tongaat'
        836 = 'Mthatha'
        865 = 'Lusaka ZEHRP'
        866 = 'Ndola'
        867 = 'Elansdoorrn'
        868 = 'Bloemfontein'
        869 = 'Masiphumelele'
        874 = 'Tembisa - Clinic 4'
        575 = 'Lusaka'
        704 = 'Cleveland'
        761 = 'Chatsworth'
        785 = 'eThekwini'
        816 = 'Groote Schuur'
        606 = 'Kericho'
        835 = 'Khayelitsha'
        832 = 'Ladysmith'
        870 = 'Mamelodi'
        823 = 'Maputo'
        754 = 'Seke South'
        829 = 'Soshanguve'
        834 = 'Soweto-Kliptown'
        830 = 'Tembisa'
        762 = "St. Mary's"
        894 = "Rosario"
        741 = "Belo Horizonte"
        781 = "Manaus"
        748 = "Nova Iguacu"
        883 = "Merida"
        876 = "Guadalajara"
        884 = "Mexico City"
        888 = "Sao Paulo - Pacaembu"
        895 = "Washington DC - Logan Circle"
        710 = "Curitiba"
        702 = "Pittsburgh"
        707 = "San Juan - CEMI"
        821 = 'Alabama'
        701 = 'Los Angeles - UCLA Care Center'
        899 = 'Los Angeles - UCLA Vine Street Clinic'
        864 = 'Oakland - East Bay AIDS Center'
        764 = 'San Francisco - Bridge HIV'
        846 = 'Colorado'
        801 = 'Washington DC - GWU'
        709 = 'Atlanta - Ponce de Leon Center'
        787 = 'Atlanta - Hope Clinic'
        844 = 'Chicago - AYAR at CORE'
        780 = 'Chicago - UIC Project WISH'
        855 = 'New Orleans'
        700 = 'Johns Hopkins'
        819 = 'Harvard - Fenway Health'
        861 = 'St. Louis - Washington University Therapeutics'
        820 = 'New Jersey'
        734 = 'New York - Bronx Prevention Research Center'
        745 = 'New York - Harlem Prevention Center'
        825 = 'New York - New York Blood Center'
        712 = 'New York - Weill Cornell Chelsea'
        706 = 'Chapel Hill'
        851 = 'Greensboro'
        847 = 'Cincinnati'
        856 = 'Ohio State University'
        863 = 'Philadelphia - Penn Prevention'
        857 = 'Memphis - St. Jude'
        853 = 'Houston'
        850 = 'Argentina - Fundacion Huesped'
        852 = 'Argentina - Hospital General de Agudos JM Ramos Mejia'
        722 = 'Brazil - Hospital Nossa Senhora de Conceicao'
        721 = 'Rio - IPEC'
        860 = 'Sao Paulo - Centro de Pesquisas CLinicas'
        845 = 'Sao Paulo - Centro de Referencia e Treinamento DST/AIDS'
        732 = 'Iquitos - ASCA'
        714 = 'Barranco'
        848 = 'Lima - CITBM'
        715 = 'Lima - San Miguel'
        813 = 'Bangkok - Silom'
        858 = 'Bangkok - TRC-ARC'
        791 = 'Chiang Mai'
        862 = 'Hanoi - Yen Hoa Health Clinic'
        723 = 'Botswana - Gaborone'
        792 = 'Kisumu'
        760 = 'Blantyre'
        720 = 'Lilongwe'
        789 = "Durban - Botha's Hill"
        818 = 'Cape Town - Desmond Tutu TB Centre'
        779 = 'Cape Town - Emavundleni'
        802 = 'Soweto'
        803 = 'Isipingo'
        837 = 'Ward 21'
        871 = 'Eswatini Prevention'
        872 = 'Baylor-Uganda'
        753 = 'Kampala - MUJHU'
        873 = 'UVRI-IAVI'
        770 = 'Parirenyatwa'
        771 = 'Spilhaus'
        774 = 'Zengeza'
        831 = 'Via Libre'
        728 = "Houston - Central"
        796 = "Orlando"
        776 = "Miami"
        ;

    /* Central lab HIV kit codes */
    VALUE $kitcode
        '000' = 'Richmond In-House kit'
        '001' = 'HIV1 RNA Real-Time RTPCR'
        '002' = 'HIV-1 Total Nucleic Acid Assay'
        '003' = 'Generic Discretionary Test'
        '101' = 'Roche Amplicor Monitor HIV-1 Standard Ver 1.0'
        '102' = 'Roche Amplicor Monitor HIV-1 Standard Ver 1.5'
        '103' = 'Roche Amplicor Monitor HIV-1 Ultra-sensitive Ver 1.0'
        '104' = 'Roche Amplicor Monitor HIV-1 Ultra-sensitive Ver 1.5'
        '105' = 'Roche Amplicor HIV-1'
        '106' = 'Roche COBAS Amplicor Monitor HIV-1 Standard Ver 1.5'
        '107' = 'Roche COBAS Amplicor Monitor HIV-1 Ultra-sensitive Ver 1.5'
        '108' = 'Roche COBAS AmpliPrep/COBAS Taqman HIV-1'
        '109' = 'Roche COBAS Taqman HIV-1 DNA'
        '110' = 'Roche COBAS AmpliPrep/COBAS Taqman HIV-1, Ver 2'
        '111' = 'Roche COBAS AmpliPrep/Taqman HIV-1 Qualitative'
        '201' = 'BioRad HIV 1/2 Genetic Systems'
        '202' = 'BioRad Genetic Systems HIV-1'
        '203' = 'BioRad New LAV Blot-1'
        '204' = 'BioRad Genetic Systems HIV 1/2 Plus O EIA'
        '205' = 'BioRad Genetic Systems 3rd Generation HIV-1'
        '206' = 'BioRad Genscreen HIV 1/2'
        '207' = 'BioRad Multispot HIV-1/HIV-2 Rapid Test'
        '208' = 'BioRad Genetic Systems rLAV'
        '209' = 'BioRad GenScreen Ultra HIV Ag-Ab HIV 1/2'
        '210' = 'BioRad GS HIV Combo Ag/Ab EIA'
        '211' = 'BioRad Geenius HIV 1/2 Confirmatory Assay'
        '301' = 'bioMerieux Vironostika HIV-1'
        '302' = 'bioMerieux NucliSens HIV-1 QT'
        '303' = 'bioMerieux Vironostika HIV Uniform II plus O'
        '304' = 'bioMerieux Vironostika HIV Uniform II Ag/Ab'
        '305' = 'bioMerieux NucliSens EasyQ HIV-1'
        '306' = 'bioMerieux Vironostika HIV Ag/Ab HIV 1/2'
        '401' = 'Abbott Axsym HIV 1/2 gO'
        '402' = 'Abbott Murex HIV-1.2.0'
        '403' = 'Abbott HIVAB HIV 1/2 (rDNA)'
        '404' = 'Abbott Axsym 4th Gen HIV Ab/Ag Combo'
        '406' = 'Abbott m2000 RealTime PCR HIV-1'
        '407' = 'Abbott Axsym HIV Ag/Ab Combo'
        '408' = 'Abbott Architect HIV Ag/Ab Combo'
        '409' = 'Abbott Prism'
        '410' = 'SD Bioline EIA test'
        '501' = 'Ortho HIV-1/HIV-2 Antibody Capture'
        '601' = 'GeneLabs HIV Blot 2.2'
        '701' = 'Dade Behring Enzygnost anti HIV 1/2 plus ELISA'
        '801' = 'Calypte Cambridge Biotech HIV-1'
        '901' = 'Bayer VERSANT HIV-1 RNA 3.0 (bDNA)'
        '1001' = 'MBI Cambridge Biotech HIV-1'
        '1101' = 'Gen-Probe Aptima HIV-1 RNA Qualitative'
        '1102' = 'Gen-Probe Procleix HIV-1/HCV Assay'
        '1201' = 'Becton-Dickinson Tritest/Multicount'
        '1301' = 'Trinity biotech Uni-Gold Recombigen HIV'
        '1401' = 'Alere Determine HIV-1/2 Ag/Ab Combo'
        '1402' = 'Alere HIV Combo'
        '1403' = 'Determine HIV Early Detect'
        '1404' = 'Determine HIV Early Detect (non-CE)'
        '1501' = 'OraQuick Rapid HIV-1 Antibody Test'
    ;

run;

proc printto;
run;