gemini
gmos

set rawdir=./
gmos.logfile="log.txt"

!echo N20190302S0248.fits > objectlHD166379 

!sed -e 's=N2=gsN2=g'      objectlHD166379 > listgsHD166379
!sed -e 's=N2=qgsN2=g'     objectlHD166379 > listqgsHD166379
!sed -e 's=N2=gsqgsN2=g'   objectlHD166379 > listgsqgsHD166379
!sed -e 's=N2=tgsqgsN2=g'  objectlHD166379 > listtgsqgsHD166379
!sed -e 's=N2=stgsqgsN2=g' objectlHD166379 > listetgsqgsHD166379

gsreduce N20190302S0250 rawpath="rawdir$" fl_flat- fl_gmosaic- fl_fixpix- \
         fl_gsappwave- fl_cut-  bias="rawdir$N20190304S0204_bias.fits"
gsreduce @objectlHD166379 rawpath="rawdir$" fl_flat- fl_gmosaic- fl_fixpix- \
         fl_gsappwave- fl_cut-  bias="rawdir$N20190304S0204_bias.fits"
gsreduce N20190302S0249 rawpath="rawdir$" fl_flat- fl_gmosaic- fl_fixpix- \
         fl_gsappwave- fl_over+ bias="rawdir$N20190304S0204_bias.fits"

gswavelength gsN20190302S0249.fits fl_inte-

gstransform gsN20190302S0249.fits wavtran=gsN20190302S0249.fits

gqe @listgsHD166379          ref=gsN20190302S0249.fits
gqe gsN20190302S0250.fits ref=gsN20190302S0249.fits

gmosaic qgsN20190302S0250.fits fl_fixpix+

gsflat mqgsN20190302S0250.fits N20190302S0250_flat.fits order=23 fl_over+

gsreduce @listqgsHD166379 flat="N20190302S0250_flat" fl_over- fl_bias- fl_trim-

gstransform @listgsqgsHD166379 wavtran=gsN20190302S0249.fits

gsskysub @listtgsqgsHD166379

gsex stgsqgsN20190302S0248.fits

imcopy estgsqgsN20190302S0248.fits[sci,1] HD166379

splot HD166379

#rm estgsqgs*.fits g*fits log.txt list* mqgs*.fits N*_flat.fits qgs*.fits stgs*.fits tgs*.fits HD166379.fits objectlHD166379 
