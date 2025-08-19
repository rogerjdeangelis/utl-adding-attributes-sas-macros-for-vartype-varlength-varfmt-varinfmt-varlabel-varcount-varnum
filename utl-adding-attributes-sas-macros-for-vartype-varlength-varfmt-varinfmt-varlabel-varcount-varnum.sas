%let pgm=utl-adding-attributes-sas-macros-for-vartype-varlength-varfmt-varinfmt-varlabel-varcount-varnum;

%stop_submission;

Adding sas macros for vartype varlength varfmt varinfmt varlabel varcount varnum

correction removed comma in utl_varcount macro rjd 2015-08-19

github
https://tinyurl.com/3axaxt8s
https://github.com/rogerjdeangelis/utl-adding-attributes-sas-macros-for-vartype-varlength-varfmt-varinfmt-varlabel-varcount-varnum

Moves the datastep functions to macro time.
Like what Bart does with his oneliner macros;

/**************************************************************************************************************************/
/* INPUT                                   | PROCESS (see macros package below)                |OUTPUT                    */
/* =====                                   | =======                                           |======                    */
/* WORK.HAVE                               | %include "c:/oto/utl_metamacs.sas";               |Number of vars= 3         */
/*                                         |                                                   |ymd position  = 3         */
/* Variables                3              | %utlnopts;                                        |ymd type      = N         */
/*                                         | %put Number of vars   = %utl_varcount (have);     |ymd length    = 8         */
/* Variables in Creation Order             | %put ymd position     = %utl_varnum   (have,ymd); |ymd informat  = E8601DA10.*/
/*                                         | %put ymd type         = %utl_vartype  (have,ymd); |ymd label     = Sales Yr  */
/* Var   Typ Len Format Informat   Label   | %put ymd lengt hbytes = %utl_varlen   (have,ymd); |ymd format    = DATE9.    */
/*                                         | %put ymd format       = %utl_varfmt   (have,ymd); |                          */
/* SALES Num   8 8.     DOLLAR7.   Day Sale| %put ymd informat     = %utl_varinfmt (have,ymd); |                          */
/* QTR   Num   8 YYQ6.  YYQ6.      Quarter | %put ymd label        = %utl_varlabel (have,ymd); |                          */
/* YMD   Num   8 DATE9. E8601DA10. Sales Yr| %utlopts;                                         |                          */
/*                                         |                                                   |                          */
/*                                         |                                                   |                          */
/* data have ;                             |                                                   |                          */
/*   label                                 |                                                   |                          */
/*     SALES = "Day Sales"                 |                                                   |                          */
/*     QTR   = "Quarter"                   |                                                   |                          */
/*     YMD   = "Sales Yr"                  |                                                   |                          */
/*   ;                                     |                                                   |                          */
/*                                         |                                                   |                          */
/*   informat                              |                                                   |                          */
/*     sales dollar7.                      |                                                   |                          */
/*     qtr   yyq6.                         |                                                   |                          */
/*     ymd   e8601da10.                    |                                                   |                          */
/*     ;                                   |                                                   |                          */
/*   format                                |                                                   |                          */
/*     sales 8.                            |                                                   |                          */
/*     qtr   yyq6.                         |                                                   |                          */
/*     ymd   date9.                        |                                                   |                          */
/*   ;                                     |                                                   |                          */
/*   input                                 |                                                   |                          */
/*   sales qtr  ymd;                       |                                                   |                          */
/*                                         |                                                   |                          */
/* cards4;                                 |                                                   |                          */
/* $2,202 1997q1 1997-01-07                |                                                   |                          */
/* $2,573 1997q2 1997-04-09                |                                                   |                          */
/* $2,584 1997q3 1997-07-11                |                                                   |                          */
/* $2,956 1997q4 1997-10-13                |                                                   |                          */
/* ;;;;                                    |                                                   |                          */
/* run;quit;                               |                                                   |                          */
/**************************************************************************************************************************/

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

data have ;
  label
    SALES = "Day Sales"
    QTR   = "Quarter"
    YMD   = "Sales Yr"
  ;

  informat
    sales dollar7.
    qtr   yyq6.
    ymd   e8601da10.
    ;
  format
    sales 8.
    qtr   yyq6.
    ymd   date9.
  ;
  input
  sales qtr  ymd;

cards4;
$2,202 1997q1 1997-01-07
$2,573 1997q2 1997-04-09
$2,584 1997q3 1997-07-11
$2,956 1997q4 1997-10-13
;;;;
run;quit;

/**************************************************************************************************************************/
/* WORK.HAVE                                                                                                              */
/*                                                                                                                        */
/* Variables                3                                                                                             */
/*                                                                                                                        */
/* Variables in Creation Order                                                                                            */
/* Var   Typ Len Format Informat   Label                                                                                  */
/*                                                                                                                        */
/* SALES Num   8 8.     DOLLAR7.   Day Sale                                                                               */
/* QTR   Num   8 YYQ6.  YYQ6.      Quarter                                                                                */
/* YMD   Num   8 DATE9. E8601DA10. Sales Yr                                                                               */
/**************************************************************************************************************************/

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

%include "c:/oto/utl_metamacs.sas";

%utlnopts;
%put Number of vars   = %utl_varcount (have);
%put ymd position     = %utl_varnum   (have,ymd);
%put ymd type         = %utl_vartype  (have,ymd);
%put ymd lengt hbytes = %utl_varlen   (have,ymd);
%put ymd format       = %utl_varfmt   (have,ymd);
%put ymd informat     = %utl_varinfmt (have,ymd);
%put ymd label        = %utl_varlabel (have,ymd);
%utlopts;

/**************************************************************************************************************************/
/* Number of vars= 3                                                                                                      */
/* ymd position  = 3                                                                                                      */
/* ymd type      = N                                                                                                      */
/* ymd length    = 8                                                                                                      */
/* ymd informat  = E8601DA10.                                                                                             */
/* ymd label     = Sales Yr                                                                                               */
/* ymd format    = DATE9.                                                                                                 */
/**************************************************************************************************************************/

/*
 _ __ ___   __ _  ___ _ __ ___  ___
| `_ ` _ \ / _` |/ __| `__/ _ \/ __|
| | | | | | (_| | (__| | | (_) \__ \
|_| |_| |_|\__,_|\___|_|  \___/|___/

*/

filename ft15f001 "c:/oto/utl_metamacs.sas";
parmcards4;
%macro utl_varnum(dsn,var)/des="Variable position mnumber in pdv";
  %local dsid posv rc;
   %let dsid = %sysfunc(open(&dsn,i));
   %let posv = %sysfunc(varnum(&dsid,&var));
   %sysfunc(varnum(&dsid,&var));
   %let rc = %sysfunc(close(&dsid));
%mend utl_varnum;

%macro utl_vartype(dsn,var)/des="Variable type returns N or C";
  %local dsid posv rc;
   %let dsid = %sysfunc(open(&dsn,i));
   %let posv = %sysfunc(varnum(&dsid,&var));
   %sysfunc(vartype(&dsid,&posv))
   %let rc = %sysfunc(close(&dsid));
%mend utl_vartype;

%macro utl_varlen(dsn,var)/des="Variable length";
  %local dsid posv rc;
   %let dsid = %sysfunc(open(&dsn,i));
   %let posv = %sysfunc(varnum(&dsid,&var));
   %sysfunc(varlen(&dsid,&posv))
   %let rc = %sysfunc(close(&dsid));
%mend utl_varlen;

%macro utl_varfmt(dsn,var)/des="Variable format";
  %local dsid posv rc;
   %let dsid = %sysfunc(open(&dsn,i));
   %let posv = %sysfunc(varnum(&dsid,&var));
   %sysfunc(varfmt(&dsid,&posv))
   %let rc = %sysfunc(close(&dsid));
%mend utl_varfmt;

%macro utl_varinfmt(dsn,var)/des="Variable informat";
  %local dsid posv rc;
   %let dsid = %sysfunc(open(&dsn,i));
   %let posv = %sysfunc(varnum(&dsid,&var));
   %sysfunc(varinfmt(&dsid,&posv))
   %let rc = %sysfunc(close(&dsid));
%mend utl_varinfmt;

%macro utl_varlabel(dsn,var)/des="Variable label";
  %local dsid posv rc;
   %let dsid = %sysfunc(open(&dsn,i));
   %let posv = %sysfunc(varnum(&dsid,&var));
   %sysfunc(varlabel(&dsid,&posv))
   %let rc = %sysfunc(close(&dsid));
%mend utl_varlabel;

%macro utl_varcount(dsn)/des="Number of variables";
  %local dsid posv rc;
    %let dsid = %sysfunc(open(&dsn,i));
    %sysfunc(attrn(&dsid,NVARS))
    %let rc = %sysfunc(close(&dsid));
%mend utl_varcount;
;;;;
run;quit;

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
