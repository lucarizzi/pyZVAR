#!/bin/tcsh


## VARIABILI: fare un po' di setup qui
##
##
PARFILE=$1 # simulazione.par  ## metterci $1 per dare file in input
OUTPUT_FILE=$2 # antlia1.dat
DATABASE_DIR=/Users/lrizzi/Work/SIMUL_LINUX/girardi_zvar.170204.dir
BASSASEQ_DIR=/Users/lrizzi/Work/SIMUL_LINUX/new_girardi
COLORS_DIR=/Users/lrizzi/Work/SIMUL_LINUX/tab_col.dir
rm -f $OUTPUT_FILE >& /dev/null


ingreSRC=u18.src  # u18.src # tutti questi file .src sono temporanei,
                          # quindi si potrebbero anche creare on-line
                          # e cancellare subito dopo...
ingreTRUE=u18.1  # u18.1

U28SRC=u28.src
U28TRUE=ingre_zvar_leo.dat

U29SRC=u29.src  # u29.src
U29TRUE=u29leo.1  # u29.1

U33SRC=u33.src  # u33.src
U33TRUE=u33.94  # u33.1

U10SRC=u10.src  # u10.src
U10TRUE=u10leo.1  # u10.1

U8SRC=u8.src  # u8.src
U8TRUE=u8.1  # u8.1


SEDTMP=$0.sed


create_u10() {
echo "@DATABASE_DIR/isotrack_intermassz0001.dat" >$U10SRC
echo "@DATABASE_DIR/isotrack_intermassz0004.dat" >>$U10SRC
echo "@DATABASE_DIR/isotrack_intermassz001.dat" >>$U10SRC
echo "@DATABASE_DIR/isotrack_intermassz004.dat" >>$U10SRC
echo "@DATABASE_DIR/isotrack_intermassz008.dat" >>$U10SRC
echo "@DATABASE_DIR/isotrack_intermassz019.dat" >>$U10SRC
echo "@DATABASE_DIR/isotrack_intermassz03.dat" >>$U10SRC
}
actual_u10() {

## --- sostituzione valori variabili in file src
##

echo "           Le tracce per u10 si trovano in [$DATABASE_DIR]"
cat  $U10SRC \
 | sed "s!@DATABASE_DIR!$DATABASE_DIR!" > $U10TRUE

## --- rimozione file temporaneo
##
rm -f $U10SRC
}

## --- creazione di u29
##
create_u29() {

echo "@DATABASE_DIR/isotrack_low_z0001.dat" >> $U29SRC
echo "@DATABASE_DIR/isotrack_hb_z0001.dat" >> $U29SRC
echo "@DATABASE_DIR/isotrack_low_z0004.dat" >> $U29SRC
echo "@DATABASE_DIR/isotrack_hb_z0004.dat" >> $U29SRC
echo "@DATABASE_DIR/isotrack_low_z001.dat" >> $U29SRC
echo "@DATABASE_DIR/isotrack_hb_z001.dat" >> $U29SRC
echo "@DATABASE_DIR/isotrack_low_z004.dat" >> $U29SRC
echo "@DATABASE_DIR/isotrack_hb_z004.dat" >> $U29SRC
echo "@DATABASE_DIR/isotrack_low_z008.dat" >> $U29SRC
echo "@DATABASE_DIR/isotrack_hb_z008.dat" >> $U29SRC
echo "@DATABASE_DIR/isotrack_low_z019.dat" >> $U29SRC
echo "@DATABASE_DIR/isotrack_hb_z019.dat" >> $U29SRC
echo "@DATABASE_DIR/isotrack_low_z03.dat" >> $U29SRC
echo "@DATABASE_DIR/isotrack_hb_z03.dat" >> $U29SRC

}
actual_u29() {

## --- sostituzione valori variabili in file src
##

echo " Le tracce evolutive per u29 si trovano in [$DATABASE_DIR]"
cat  $U29SRC \
 | sed "s!@DATABASE_DIR!$DATABASE_DIR!" > $U29TRUE

## --- rimozione file temporaneo
##
rm -f $U29SRC
}

create_u33() {
# echo "7" >$U33SRC
# echo "0.00005 0.000166 0.000542 0.001774 0.00581  0.019  0.0622" >>$U33SRC
# echo "@COLORS_DIR/bc_m25.dat" >>$U33SRC
# echo "@COLORS_DIR/bc_m20.dat" >>$U33SRC
# echo "@COLORS_DIR/bc_m15.dat" >>$U33SRC
# echo "@COLORS_DIR/bc_m10.dat" >>$U33SRC
# echo "@COLORS_DIR/bc_m05.dat" >>$U33SRC
# echo "@COLORS_DIR/bc_p00.dat" >>$U33SRC
# echo "@COLORS_DIR/bc_p05.dat" >>$U33SRC
echo "7" > $U33SRC
echo "0.0001 0.0004 0.001 0.004 0.008   0.020  0.050" >> $U33SRC
echo "@COLORS_DIR/filez0001.bol" >> $U33SRC
echo "@COLORS_DIR/tabellaz0004.bol" >> $U33SRC
echo "@COLORS_DIR/tabellaz001.bol" >> $U33SRC
echo "@COLORS_DIR/tabellaz004.bol" >> $U33SRC
echo "@COLORS_DIR/tabellaz008.bol" >> $U33SRC
echo "@COLORS_DIR/tabellap00.bol" >> $U33SRC
echo "@COLORS_DIR/tabellaz05.bol" >> $U33SRC

}
actual_u33() {

## --- sostituzione valori variabili in file src
##

echo "Le tabelle di colore per u33 si trovano in [$COLORS_DIR]"
cat  $U33SRC \
 | sed "s!@COLORS_DIR!$COLORS_DIR!" > $U33TRUE

## --- rimozione file temporaneo
##
rm -f $U33SRC
}


create_u8() {
cp $BASSASEQ_DIR/bassaseqleo.dat .
echo "bassaseqleo.dat " > $U8SRC

}
actual_u8() {

echo " u8.1 rimane come l'originale"
cp $U8SRC $U8TRUE
rm -f $U8SRC
}







## --- creazione di u28.src
##
create_ingre() {
echo "  @ILOS ILOS ! SE<5 TUTTO NORM,SE =5 NO MASLOS LUNGO RG,SE =7 NO MASLOSS" >> $U28SRC
echo "  @RGBLOSS @RGBETA imaslos   ETAREN" >> $U28SRC
echo "  @AGBLOSS @AGBETA imaslosAGB etalossAGB" >> $U28SRC
echo "  @IHBOLD @IMDOT   itefl (in mdothbold) itefh(in mdot) 1=old  2=(Tef-L)Wood" >> $U28SRC
echo "  @MLENGTH         ALPH(MIXXINGLENGHT)     " >> $U28SRC
echo "  @ISHIFT              ! iscift=0 niente iscift=1 scift solo 0.7 m iscift=2 scift tutte        " >> $U28SRC
echo "      7            NZMAX           " >> $U28SRC
echo "      0.0001 0.230   0.6 120  1.75  0.075 ! ZETA  XHE   M1  M2 MHeflash                            "  >> $U28SRC
echo "      0.0004 0.230   0.6 120  1.7   0.075 ! ZETA XHE M1 M2 Mflash ALFA=COEF ANG AGB (IBEN=0.0643)  "  >> $U28SRC
echo "      0.001  0.230   0.6  30  1.7   0.12  ! ZETA  XHE   M1  M2 MHeflash ALFA                       "  >> $U28SRC
echo "      0.004  0.240   0.6 120  1.7   0.12  ! ZETA  XHE   M1  M2 MHeflash ALFA                       "  >> $U28SRC
echo "      0.008  0.250   0.6 120  1.85  0.15  ! ZETA  XHE   M1  M2 MHeflash ALFA                       "  >> $U28SRC
echo "      0.019  0.273   0.6 120  1.95  0.15  ! ZETA  XHE   M1  M2 MHeflash ALFA                       "  >> $U28SRC
echo "      0.03   0.300   0.6 120  1.9   0.15  ! ZETA  XHE   M1  M2 MHeflash ALFA "  >> $U28SRC
#echo " " >> $U28SRC
#echo " " >> $U28SRC
#echo " " >> $U28SRC
#echo "  \$FILEINGRESSO " >> $U28SRC
#echo "  u8='u8.1' u26='u26_pb.5' u10='u10leo.1' u29='u29leo.1' \$END " >> $U28SRC
#echo " " >> $U28SRC
#echo " " >> $U28SRC
#echo " " >> $U28SRC
cat $BASSASEQ_DIR/file_ausiliari >> $U28SRC
echo " \$TIPOSFR " >> $U28SRC
echo "               IISTARFORM=@tipoSF                       \$END " >> $U28SRC
echo " \$TSHARPI6      " >> $U28SRC
echo "            TTTT=@Tssp                                \$END " >> $U28SRC
echo " \$TBURSTI1  " >> $U28SRC
echo "           TMAX=@TburstMax,  TMIN=@TburstMin                    \$END " >> $U28SRC
echo " \$TCOSTI0 " >> $U28SRC
echo "           TMAX=@TCOSTMAX                                 \$END " >> $U28SRC
echo " \$T_INCRIS_LINI3 " >> $U28SRC
echo "          TMAX=@TINCMAX, TMIN=@TINCMIN, AAYMAX=@AAYMAX,  AAYMIN=@AAYMIN     \$END " >> $U28SRC
echo " \$SFR_COST_PIU_BURSTI4 " >> $U28SRC
echo "          TMAX=@TCBMAX, TINTE=@TCBINTE, TMIN=@TCBMIN, RAP=@TCRAP     " >> $U28SRC
echo "          AAYYMAX=@AAYYMAX, DPASSO=@DPASSO, rapup=@RAPUP , drap=@DRAP        \$END " >> $U28SRC
echo " \$SFR_COST_PIU_BURST_PIU_AREAI5   " >> $U28SRC
echo "          TMAX=@TCBAMAX, TINTE=@TCBAINTE, TMIN=@TCBAMIN, RAREE=@RAREE    \$END " >> $U28SRC
echo " \$SFR_ESPONI2 " >> $U28SRC
echo "          TMAX=@TEMAX, TMIN=@TEMIN, BBETA=@EBBETA                \$END " >> $U28SRC
echo " \$SFR_ESPON_BURSTI8 " >> $U28SRC
echo "          TMAX=@TEBMAX, TMIN=@TEBMIN, BBETA=@EBBBETA                " >> $U28SRC
echo "          TBURSTMAX=@TEBBMAX TBURSTMIN=@TEBBMIN FORZA_DEL_BURST=@FBURST  \$END " >> $U28SRC
echo " \$SFR_COST_PIU_BURST_QUALUNQUE9 " >> $U28SRC
echo "          TMAX=@TCBQMAX, TMIN=@TCBQMIN, TBMAX=@TCBQBMAX, TBMIN=@TCBQBMIN, " >> $U28SRC
echo "          FORZAB=@FORZAB,                                  \$END  " >> $U28SRC
echo " " >> $U28SRC
echo " " >> $U28SRC
echo " \$SFR_DUEESP_DECREI11 " >> $U28SRC
echo "     TMAX=@TDEDMAX, TMIN=@TDEDMIN, BBETA=@DEDBETA                " >> $U28SRC
echo "     TBURSTMAX=@TDEDBMAX TBURSTMIN=@TDEDBMIN  " >> $U28SRC
echo "     FORZA_DEL_BURST=@DEDFBURST  BETABURST=@DEDBBURST " >> $U28SRC
echo "          AAYYMAX=@DEDAAYYMAX, DPASSO=@DEDDPASSO, rapup=@DEDRAPUP, drap=@DEDDRAP        \$END " >> $U28SRC
echo " " >> $U28SRC
echo " " >> $U28SRC
echo " \$SFR_DUEESP_DECREI12 " >> $U28SRC
echo "     TMAX=@TDDMAX, TMIN=@TDDMIN, BBETA=@DDBBETA               " >> $U28SRC
echo "     TBURSTMAX=@TDDBMAX TBURSTMIN=@TDDBMIN  " >> $U28SRC
echo "     FORZA_DEL_BURST=@DDFBURST  BETABURST=@DDBETABURST " >> $U28SRC
echo "          AAYYMAX=@DDAAYYMAX, DPASSO=@DDDPASSO, rapup=@DDRAPUP, drap=@DDDRAP        \$END " >> $U28SRC
echo " " >> $U28SRC
echo " " >> $U28SRC
echo " \$LEGGEDIZETA " >> $U28SRC
echo "     ITIPO=@LEGGEDIZETA LINZ='@LINZ'   ZB1=@ZB1      ZB2=@ZB2 " >> $U28SRC
echo "        NPUNTI=@NPLDIZETA  ZNOD=@ZNOD1,@ZNOD2,@ZNOD3 " >> $U28SRC
echo "                  TNOD=@TNOD1,@TNOD2,@TNOD3            \$END " >> $U28SRC
echo " " >> $U28SRC
echo " " >> $U28SRC
echo " \$SALPETER " >> $U28SRC
echo "    IFUNM=@IFUNM " >> $U28SRC
echo "           ALF=@ALF_,   " >> $U28SRC
echo "    alfa0=@ALFA0,         ALFA1=@ALFA1,    ALFA2=@ALFA2,    " >> $U28SRC
echo "    am0=@_AM0, aamm1=@AAMM1,   AMX=@_AMX " >> $U28SRC
echo "                                               \$END " >> $U28SRC
echo " " >> $U28SRC
echo " " >> $U28SRC
echo " \$BINARIE  " >> $U28SRC
echo "     DOUBLE='@FLAG_DOUBLE', NFASCEBINV=@NFASCEBINV, " >> $U28SRC
echo "      VBINV=@VBINV " >> $U28SRC
echo "      PERCBIN=@PERCBIN " >> $U28SRC
echo "      NFASCEQ=@NFASCEQ, " >> $U28SRC
echo "      FRAQ=@FRAQ " >> $U28SRC
echo "      XQ=@XQ " >> $U28SRC
echo "      \$END " >> $U28SRC
#echo "     ASCRI='@ASCRI', FILEINGRE='@OUTPUT_FILE' " >> $U28SRC
#echo "     BBV1=@BBV1, AMV1=@_AMV1, BBV2=@BBV2, AMV2=@_AMV2 " >> $U28SRC
#echo "     ISSEP=@ISSEP " >> $U28SRC
#echo "     QDISTR='@QDISTR', DISMVMI=@DISMVMI, DISMVMA=@DISMVMA, DISDIV=@DISDIV        " >> $U28SRC
#echo "     KR=@KR, VINFRED=@VINFRED                                 \$END " >> $U28SRC
echo " " >> $U28SRC
echo " " >> $U28SRC
echo " \$CONTROLLO " >> $U28SRC
echo " ISEED=@ISEED " >> $U28SRC
echo " QNTOT='@QNTOT'    NTOTSTARMAX=@NTOTSTARMAX " >> $U28SRC
echo " QNINTE='@QNINTE'   NBLUMAX=@NBLUMAX NREDMAX=@NREDMAX AMINF=@AMINF AMSUP=@AMSUP " >> $U28SRC
echo " QN_BOX='@QN_BOX'   NBOX_MAX=@NBoxMax    JZONE=@NzonaNorm " >> $U28SRC
echo " BBV1=@BBV1, AMV1=@_AMV1, BBV2=@BBV2, AMV2=@_AMV2   \$END " >> $U28SRC
echo " " >> $U28SRC
echo " " >> $U28SRC
echo " \$LIMITI " >> $U28SRC
echo "     AQAM1='@AQAM1'    AM1CAMBIATO=@_AM1CAMBIATO " >> $U28SRC
echo "     AQAM2='@AQAM2'    AM2CAMBIATO=@_AM2CAMBIATO " >> $U28SRC
echo "     QVLIM='@QVLIM'    MAG_LIMITE=@LimMag " >> $U28SRC
echo "     AMLOW=@AMLOW \$END" >> $U28SRC
echo " " >> $U28SRC
echo " " >> $U28SRC
}








actual_ingre() {

## --- estrazione variabili dal parfile
##
             ILOS=`grep @ILOS              $PARFILE | cut -d: -f2`
          RGBLOSS=`grep @RGBLOSS           $PARFILE | cut -d: -f2`
           RGBETA=`grep @RGBETA            $PARFILE | cut -d: -f2`
          AGBLOSS=`grep @AGBLOSS           $PARFILE | cut -d: -f2`
           AGBETA=`grep @AGBETA            $PARFILE | cut -d: -f2`
           IHBOLD=`grep @IHBOLD            $PARFILE | cut -d: -f2`
            IMDOT=`grep @IMDOT             $PARFILE | cut -d: -f2`
          MLENGTH=`grep @MLENGTH           $PARFILE | cut -d: -f2`
           ISHIFT=`grep @ISHIFT            $PARFILE | cut -d: -f2`
           tipoSF=`grep @tipoSF            $PARFILE | cut -d: -f2`
             Tssp=`grep @Tssp              $PARFILE | cut -d: -f2`
        TburstMax=`grep @TburstMax         $PARFILE | cut -d: -f2`
        TburstMin=`grep @TburstMin         $PARFILE | cut -d: -f2`
         TCOSTMAX=`grep @TCOSTMAX          $PARFILE | cut -d: -f2`
          TINCMAX=`grep @TINCMAX           $PARFILE | cut -d: -f2`
          TINCMIN=`grep @TINCMIN           $PARFILE | cut -d: -f2`
           AAYMAX=`grep @AAYMAX            $PARFILE | cut -d: -f2`
           AAYMIN=`grep @AAYMIN            $PARFILE | cut -d: -f2`
           TCBMAX=`grep @TCBMAX            $PARFILE | cut -d: -f2`
          TCBINTE=`grep @TCBINTE           $PARFILE | cut -d: -f2`
           TCBMIN=`grep @TCBMIN            $PARFILE | cut -d: -f2`
            TCRAP=`grep @TCRAP             $PARFILE | cut -d: -f2`
          AAYYMAX=`grep @AAYYMAX           $PARFILE | cut -d: -f2`
           DPASSO=`grep @DPASSO            $PARFILE | cut -d: -f2`
            RAPUP=`grep @RAPUP             $PARFILE | cut -d: -f2`
             DRAP=`grep @DRAP              $PARFILE | cut -d: -f2`
          TCBAMAX=`grep @TCBAMAX           $PARFILE | cut -d: -f2`
         TCBAINTE=`grep @TCBAINTE          $PARFILE | cut -d: -f2`
          TCBAMIN=`grep @TCBAMIN           $PARFILE | cut -d: -f2`
            RAREE=`grep @RAREE             $PARFILE | cut -d: -f2`
            TEMAX=`grep @TEMAX             $PARFILE | cut -d: -f2`
            TEMIN=`grep @TEMIN             $PARFILE | cut -d: -f2`
           EBBETA=`grep @EBBETA            $PARFILE | cut -d: -f2`
           TEBMAX=`grep @TEBMAX            $PARFILE | cut -d: -f2`
           TEBMIN=`grep @TEBMIN            $PARFILE | cut -d: -f2`
          EBBBETA=`grep @EBBBETA           $PARFILE | cut -d: -f2`
          TEBBMAX=`grep @TEBBMAX           $PARFILE | cut -d: -f2`
          TEBBMIN=`grep @TEBBMIN           $PARFILE | cut -d: -f2`
           FBURST=`grep @FBURST            $PARFILE | cut -d: -f2`
          TCBQMAX=`grep @TCBQMAX           $PARFILE | cut -d: -f2`
          TCBQMIN=`grep @TCBQMIN           $PARFILE | cut -d: -f2`
         TCBQBMAX=`grep @TCBQBMAX          $PARFILE | cut -d: -f2`
         TCBQBMIN=`grep @TCBQBMIN          $PARFILE | cut -d: -f2`
           FORZAB=`grep @FORZAB            $PARFILE | cut -d: -f2`
          TDEDMAX=`grep @TDEDMAX           $PARFILE | cut -d: -f2`
          TDEDMIN=`grep @TDEDMIN           $PARFILE | cut -d: -f2`
          DEDBETA=`grep @DEDBETA           $PARFILE | cut -d: -f2`
         TDEDBMAX=`grep @TDEDBMAX          $PARFILE | cut -d: -f2`
         TDEDBMIN=`grep @TDEDBMIN          $PARFILE | cut -d: -f2`
        DEDFBURST=`grep @DEDFBURST         $PARFILE | cut -d: -f2`
        DEDBBURST=`grep @DEDBBURST         $PARFILE | cut -d: -f2`
       DEDAAYYMAX=`grep @DEDAAYYMAX        $PARFILE | cut -d: -f2`
        DEDDPASSO=`grep @DEDDPASSO         $PARFILE | cut -d: -f2`
         DEDRAPUP=`grep @DEDRAPUP          $PARFILE | cut -d: -f2`
          DEDDRAP=`grep @DEDDRAP           $PARFILE | cut -d: -f2`
           TDDMAX=`grep @TDDMAX            $PARFILE | cut -d: -f2`
           TDDMIN=`grep @TDDMIN            $PARFILE | cut -d: -f2`
          DDBBETA=`grep @DDBBETA           $PARFILE | cut -d: -f2`
          TDDBMAX=`grep @TDDBMAX           $PARFILE | cut -d: -f2`
          TDDBMIN=`grep @TDDBMIN           $PARFILE | cut -d: -f2`
         DDFBURST=`grep @DDFBURST          $PARFILE | cut -d: -f2`
      DDBETABURST=`grep @DDBETABURST       $PARFILE | cut -d: -f2`
        DDAAYYMAX=`grep @DDAAYYMAX         $PARFILE | cut -d: -f2`
         DDDPASSO=`grep @DDDPASSO          $PARFILE | cut -d: -f2`
          DDRAPUP=`grep @DDRAPUP           $PARFILE | cut -d: -f2`
           DDDRAP=`grep @DDDRAP            $PARFILE | cut -d: -f2`
      LEGGEDIZETA=`grep @LEGGEDIZETA       $PARFILE | cut -d: -f2`
             LINZ=`grep @LINZ              $PARFILE | cut -d: -f2`
              ZB1=`grep @ZB1               $PARFILE | cut -d: -f2`
              ZB2=`grep @ZB2               $PARFILE | cut -d: -f2`
        NPLDIZETA=`grep @NPLDIZETA         $PARFILE | cut -d: -f2`
            ZNOD1=`grep @ZNOD1             $PARFILE | cut -d: -f2`
            ZNOD2=`grep @ZNOD2             $PARFILE | cut -d: -f2`
            ZNOD3=`grep @ZNOD3             $PARFILE | cut -d: -f2`
            TNOD1=`grep @TNOD1             $PARFILE | cut -d: -f2`
            TNOD2=`grep @TNOD2             $PARFILE | cut -d: -f2`
            TNOD3=`grep @TNOD3             $PARFILE | cut -d: -f2`
            IFUNM=`grep @IFUNM             $PARFILE | cut -d: -f2`
             ALF_=`grep @ALF_              $PARFILE | cut -d: -f2`
            ALFA0=`grep @ALFA0             $PARFILE | cut -d: -f2`
            ALFA1=`grep @ALFA1             $PARFILE | cut -d: -f2`
            ALFA2=`grep @ALFA2             $PARFILE | cut -d: -f2`
              AM0=`grep @_AM0               $PARFILE | cut -d: -f2`
            AAMM1=`grep @AAMM1             $PARFILE | cut -d: -f2`
              AMX=`grep @_AMX               $PARFILE | cut -d: -f2`
      FLAG_DOUBLE=`grep @FLAG_DOUBLE       $PARFILE | cut -d: -f2`
             BBV1=`grep @BBV1              $PARFILE | cut -d: -f2`
             AMV1=`grep @_AMV1              $PARFILE | cut -d: -f2`
             BBV2=`grep @BBV2              $PARFILE | cut -d: -f2`
             AMV2=`grep @_AMV2              $PARFILE | cut -d: -f2`
            ISSEP=`grep @ISSEP             $PARFILE | cut -d: -f2`
           QDISTR=`grep @QDISTR            $PARFILE | cut -d: -f2`
          DISMVMI=`grep @DISMVMI           $PARFILE | cut -d: -f2`
          DISMVMA=`grep @DISMVMA           $PARFILE | cut -d: -f2`
           DISDIV=`grep @DISDIV            $PARFILE | cut -d: -f2`
               KR=`grep @KR                $PARFILE | cut -d: -f2`
          VINFRED=`grep @VINFRED           $PARFILE | cut -d: -f2`
            ISEED=`grep @ISEED             $PARFILE | cut -d: -f2`
            QNTOT=`grep @QNTOT             $PARFILE | cut -d: -f2`
           QNINTE=`grep @QNINTE            $PARFILE | cut -d: -f2`
            ATIPO=`grep @ATIPO             $PARFILE | cut -d: -f2`
           AMINF=`grep @_AMINF              $PARFILE | cut -d: -f2`
           AMSUP=`grep @_AMSUP              $PARFILE | cut -d: -f2`
           QNRED=`grep @QNRED              $PARFILE | cut -d: -f2`
         NREDMAX=`grep @NREDMAX            $PARFILE | cut -d: -f2`
          QN_BOX=`grep @QN_BOX             $PARFILE | cut -d: -f2`
       NzonaNorm=`grep @NzonaNorm          $PARFILE | cut -d: -f2`
          QNCEPH=`grep @QNCEPH             $PARFILE | cut -d: -f2`
          CONTWR=`grep @CONTWR             $PARFILE | cut -d: -f2`
           AQAM1=`grep @AQAM1              $PARFILE | cut -d: -f2`
     AM1CAMBIATO=`grep @_AM1CAMBIATO        $PARFILE | cut -d: -f2`
           AQAM2=`grep @AQAM2              $PARFILE | cut -d: -f2`
           QVLIM=`grep @QVLIM              $PARFILE | cut -d: -f2`
     AM2CAMBIATO=`grep @_AM2CAMBIATO        $PARFILE | cut -d: -f2`
          LimMag=`grep @LimMag             $PARFILE | cut -d: -f2`
           QMSEP=`grep @QMSEP              $PARFILE | cut -d: -f2`
           AMLOW=`grep @AMLOW              $PARFILE | cut -d: -f2`

NTOTSTARMAX=`grep @NTOTSTARMAX $PARFILE | cut -d: -f2`
NBLUMAX=`grep @NBLUMAX $PARFILE | cut -d: -f2`
NREDMAX=`grep @NREDMAX $PARFILE | cut -d: -f2`
AMINF=`grep @AMINF $PARFILE | cut -d: -f2`
AMSUP=`grep @AMSUP $PARFILE | cut -d: -f2`
NBoxMax=`grep @NBoxMax $PARFILE | cut -d: -f2`

NFASCEBINV=`grep @NFASCEBINV              $PARFILE | cut -d: -f2`
VBINV=`grep @VBINV              $PARFILE | cut -d: -f2`
PERCBIN=`grep @PERCBIN              $PARFILE | cut -d: -f2`
NFASCEQ=`grep @NFASCEQ              $PARFILE | cut -d: -f2`
FRAQ=`grep @FRAQ              $PARFILE | cut -d: -f2`
XQ=`grep @XQ              $PARFILE | cut -d: -f2`
## --- creazione dello script sed temporaneo. Dopo aver tentato con
##     il sed concatenato, ho scoperto che vengono generati troppi
##     child processes, talche' l'OS si lamenta e non viene creato
##     nessun file. Invece cosi' creo prima lo script e poi lo
##     applico
##
echo "s/@ILOS/$ILOS/g" > $SEDTMP
echo "s/@RGBLOSS /$RGBLOSS /g" >> $SEDTMP
echo "s/@RGBETA/$RGBETA/g" >> $SEDTMP
echo "s/@AGBLOSS/$AGBLOSS/g" >> $SEDTMP
echo "s/@AGBETA/$AGBETA/g" >> $SEDTMP
echo "s/@IHBOLD/$IHBOLD/g" >> $SEDTMP
echo "s/@IMDOT/$IMDOT/g" >> $SEDTMP
echo "s/@MLENGTH/$MLENGTH/g" >> $SEDTMP
echo "s/@ISHIFT/$ISHIFT/g" >> $SEDTMP
echo "s/@STIPO_COMPLETEZZA/$STIPO_COMPLETEZZA/g" >> $SEDTMP
echo "s/@DMODULE/$DMODULE/g" >> $SEDTMP
echo "s/@ASSORBIMENTO/$ASSORBIMENTO/g" >> $SEDTMP
echo "s/@REDDENING/$REDDENING/g" >> $SEDTMP
echo "s/@tipoSF/$tipoSF/g" >> $SEDTMP
echo "s/@Tssp/$Tssp/g" >> $SEDTMP
echo "s/@TburstMax/$TburstMax/g" >> $SEDTMP
echo "s/@TburstMin/$TburstMin/g" >> $SEDTMP
echo "s/@TCOSTMAX/$TCOSTMAX/g" >> $SEDTMP
echo "s/@TINCMAX/$TINCMAX/g" >> $SEDTMP
echo "s/@TINCMIN/$TINCMIN/g" >> $SEDTMP
echo "s/@AAYMAX/$AAYMAX/g" >> $SEDTMP
echo "s/@AAYMIN/$AAYMIN/g" >> $SEDTMP
echo "s/@TCBMAX/$TCBMAX/g" >> $SEDTMP
echo "s/@TCBINTE/$TCBINTE/g" >> $SEDTMP
echo "s/@TCBMIN/$TCBMIN/g" >> $SEDTMP
echo "s/@TCRAP/$TCRAP/g" >> $SEDTMP
echo "s/@AAYYMAX/$AAYYMAX/g" >> $SEDTMP
echo "s/@DPASSO/$DPASSO/g" >> $SEDTMP
echo "s/@RAPUP/$RAPUP/g" >> $SEDTMP
echo "s/@DRAP/$DRAP/g" >> $SEDTMP
echo "s/@TCBAMAX/$TCBAMAX/g" >> $SEDTMP
echo "s/@TCBAINTE/$TCBAINTE/g" >> $SEDTMP
echo "s/@TCBAMIN/$TCBAMIN/g" >> $SEDTMP
echo "s/@RAREE/$RAREE/g" >> $SEDTMP
echo "s/@TEMAX/$TEMAX/g" >> $SEDTMP
echo "s/@TEMIN/$TEMIN/g" >> $SEDTMP
echo "s/@EBBETA/$EBBETA/g" >> $SEDTMP
echo "s/@TEBMAX/$TEBMAX/g" >> $SEDTMP
echo "s/@TEBMIN/$TEBMIN/g" >> $SEDTMP
echo "s/@EBBBETA/$EBBBETA/g" >> $SEDTMP
echo "s/@TEBBMAX/$TEBBMAX/g" >> $SEDTMP
echo "s/@TEBBMIN/$TEBBMIN/g" >> $SEDTMP
echo "s/@FBURST/$FBURST/g" >> $SEDTMP
echo "s/@TCBQMAX/$TCBQMAX/g" >> $SEDTMP
echo "s/@TCBQMIN/$TCBQMIN/g" >> $SEDTMP
echo "s/@TCBQBMAX/$TCBQBMAX/g" >> $SEDTMP
echo "s/@TCBQBMIN/$TCBQBMIN/g" >> $SEDTMP
echo "s/@FORZAB/$FORZAB/g" >> $SEDTMP
echo "s/@TDEDMAX/$TDEDMAX/g" >> $SEDTMP
echo "s/@TDEDMIN/$TDEDMIN/g" >> $SEDTMP
echo "s/@DEDBETA/$DEDBETA/g" >> $SEDTMP
echo "s/@TDEDBMAX/$TDEDBMAX/g" >> $SEDTMP
echo "s/@TDEDBMIN/$TDEDBMIN/g" >> $SEDTMP
echo "s/@DEDFBURST/$DEDFBURST/g" >> $SEDTMP
echo "s/@DEDBBURST/$DEDBBURST/g" >> $SEDTMP
echo "s/@DEDAAYYMAX/$DEDAAYYMAX/g" >> $SEDTMP
echo "s/@DEDDPASSO/$DEDDPASSO/g" >> $SEDTMP
echo "s/@DEDRAPUP/$DEDRAPUP/g" >> $SEDTMP
echo "s/@DEDDRAP/$DEDDRAP/g" >> $SEDTMP
echo "s/@TDDMAX/$TDDMAX/g" >> $SEDTMP
echo "s/@TDDMIN/$TDDMIN/g" >> $SEDTMP
echo "s/@DDBBETA/$DDBBETA/g" >> $SEDTMP
echo "s/@TDDBMAX/$TDDBMAX/g" >> $SEDTMP
echo "s/@TDDBMIN/$TDDBMIN/g" >> $SEDTMP
echo "s/@DDFBURST/$DDFBURST/g" >> $SEDTMP
echo "s/@DDBETABURST/$DDBETABURST/g" >> $SEDTMP
echo "s/@DDAAYYMAX/$DDAAYYMAX/g" >> $SEDTMP
echo "s/@DDDPASSO/$DDDPASSO/g" >> $SEDTMP
echo "s/@DDRAPUP/$DDRAPUP/g" >> $SEDTMP
echo "s/@DDDRAP/$DDDRAP/g" >> $SEDTMP
echo "s/@LEGGEDIZETA/$LEGGEDIZETA/g" >> $SEDTMP
echo "s/@LINZ/$LINZ/g" >> $SEDTMP
echo "s/@ZB1/$ZB1/g" >> $SEDTMP
echo "s/@ZB2/$ZB2/g" >> $SEDTMP
echo "s/@NPLDIZETA/$NPLDIZETA/g" >> $SEDTMP
echo "s/@ZNOD1/$ZNOD1/g" >> $SEDTMP
echo "s/@ZNOD2/$ZNOD2/g" >> $SEDTMP
echo "s/@ZNOD3/$ZNOD3/g" >> $SEDTMP
echo "s/@TNOD1/$TNOD1/g" >> $SEDTMP
echo "s/@TNOD2/$TNOD2/g" >> $SEDTMP
echo "s/@TNOD3/$TNOD3/g" >> $SEDTMP
echo "s/@IFUNM/$IFUNM/g" >> $SEDTMP
echo "s/@ALF_/$ALF_/g" >> $SEDTMP
echo "s/@ALFA0/$ALFA0/g" >> $SEDTMP
echo "s/@ALFA1/$ALFA1/g" >> $SEDTMP
echo "s/@ALFA2/$ALFA2/g" >> $SEDTMP
echo "s/@_AM0/$AM0/g" >> $SEDTMP
echo "s/@AAMM1/$AAMM1/g" >> $SEDTMP
echo "s/@_AMX/$AMX/g" >> $SEDTMP
echo "s/@FLAG_DOUBLE/$FLAG_DOUBLE/g" >> $SEDTMP
#echo "s/@OUTPUT_FILE/$OUTPUT_FILE/g" >> $SEDTMP
echo "s/@BBV1/$BBV1/g" >> $SEDTMP
echo "s/@_AMV1/$AMV1/g" >> $SEDTMP
echo "s/@BBV2/$BBV2/g" >> $SEDTMP
echo "s/@_AMV2/$AMV2/g" >> $SEDTMP
echo "s/@ISSEP/$ISSEP/g" >> $SEDTMP
echo "s/@QDISTR/$QDISTR/g" >> $SEDTMP
echo "s/@DISMVMI/$DISMVMI/g" >> $SEDTMP
echo "s/@DISMVMA/$DISMVMA/g" >> $SEDTMP
echo "s/@DISDIV/$DISDIV/g" >> $SEDTMP
echo "s/@KR/$KR/g" >> $SEDTMP
echo "s/@VINFRED/$VINFRED/g" >> $SEDTMP
echo "s/@ISEED/$ISEED/g" >> $SEDTMP
echo "s/@QNTOT/$QNTOT/g" >> $SEDTMP
echo "s/@QNINTE/$QNINTE/g" >> $SEDTMP
echo "s/@ATIPO/$ATIPO/g" >> $SEDTMP
echo "s/@_AMINF/$AMINF/g" >> $SEDTMP
echo "s/@_AMSUP/$AMSUP/g" >> $SEDTMP
echo "s/@QNRED/$QNRED/g" >> $SEDTMP
echo "s/@NREDMAX/$NREDMAX/g" >> $SEDTMP
echo "s/@QN_BOX/$QN_BOX/g" >> $SEDTMP
echo "s/@NzonaNorm/$NzonaNorm/g" >> $SEDTMP
echo "s/@CONTWR/$CONTWR/g" >> $SEDTMP
echo "s/@AQAM1/$AQAM1/g" >> $SEDTMP
echo "s/@_AM1CAMBIATO/$AM1CAMBIATO/g" >> $SEDTMP
echo "s/@AQAM2/$AQAM2/g" >> $SEDTMP
echo "s/@QVLIM/$QVLIM/g" >> $SEDTMP
echo "s/@_AM2CAMBIATO/$AM2CAMBIATO/g" >> $SEDTMP
echo "s/@LimMag/$LimMag/g" >> $SEDTMP
echo "s/@QMSEP/$QMSEP/g" >> $SEDTMP
echo "s/@AMLOW/$AMLOW/g" >> $SEDTMP
echo "s/@NFASCEBINV/$NFASCEBINV/g" >> $SEDTMP
echo "s/@PERCBIN/$PERCBIN/g" >> $SEDTMP
echo "s/@VBINV/$VBINV/g" >> $SEDTMP
echo "s/@NFASCEQ/$NFASCEQ/g" >> $SEDTMP
echo "s/@FRAQ/$FRAQ/g" >> $SEDTMP
echo "s/@XQ/$XQ/g" >> $SEDTMP
echo "s/@NTOTSTARMAX/$NTOTSTARMAX/g" >> $SEDTMP
echo "s/@NBLUMAX/$NBLUMAX/g" >> $SEDTMP
echo "s/@NREDMAX/$NREDMAX/g" >> $SEDTMP
echo "s/@AMINF/$AMINF/g" >> $SEDTMP
echo "s/@AMSUP/$AMSUP/g" >> $SEDTMP
echo "s/@NBoxMax/$NBoxMax/g" >> $SEDTMP


## --- applicazione dello script sed sul file source e generazione
##     del file vero e proprio
##
cat $U28SRC | sed -f $SEDTMP > $U28TRUE

## --- rimozione file temporanei
##
rm -f $U28SRC $SEDTMP
}




rm -f U28TRUE

echo "CREAZIONE FILE DI INGRESSO..."

create_ingre
actual_ingre

echo "CREAZIONE FILE AUSILIARI..."
create_u10 
create_u29 
create_u33 
create_u8 
actual_u10 
actual_u29 
actual_u33 
actual_u8 

echo "ESECUZIONE ZVAR..."
echo $U28TRUE > nome_file_ingre.dat
rm -f cesare.dat >& \dev/null
/Users/lrizzi/Work/SIMUL_LINUX/zvar_linux/zvar02_evh.exe
mv cesare.dat $2

