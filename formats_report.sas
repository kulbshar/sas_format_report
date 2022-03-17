/*
create reports from LDP's SAS formats catalog
    output list of LDP formats value/label pairs to HTML file
        for use by LDM or other customers of the LDP SAS formats catalog
*/

%let ldpfmt_rpt_name='ldp_format_dictionary.html';
%let ldpfmt_rpt_path='/trials/LabDataOps/common/sas_formats';

libname ldpfmt '/trials/LabDataOps/common/sas_formats';


proc format library=ldpfmt.formats cntlout=work.ldpfmt;
run;

data work.ldpfmt_report(drop=type);
    set work.ldpfmt(keep=fmtname type start end label
                    rename=(fmtname=format_name));
    format
        format_type $20.
        section_header $64.
        ;

    select(type);
        when ('C') format_type='Character';
        when ('N') format_type='Numeric';
        when ('P') format_type='Picture';
        when ('I') format_type='Numeric informat';
        when ('J') format_type='Character informat';
    end;

    section_header=trim(format_name) || " - " || trim(format_type);
run;


ods html path=&ldpfmt_rpt_path. body=&ldpfmt_rpt_name.;
    
proc report data=work.ldpfmt_report
    style(header)=[just=l fontsize=3];

    title bold height=7 'LDP Format Dictionary';
    column section_header start end label;

    define section_header / order noprint;
    define start / display;
    define end / display;
    define label / display;

    compute before section_header / style={just=l background=lightblue
                                        fontweight=bold fontsize=3};
        line section_header $52.;
    endcomp;
    
    compute after section_header;
        line '';
    endcomp;
run;

ods html close;
