gemini
gmos

set rawdir=./
gmos.logfile="log.txt"

!echo N20160913S0145.fits > objectlPPM063347 

!sed -e 's=N2=gsN2=g'      objectlPPM063347 > listgsPPM063347
!sed -e 's=gsN2=tgsN2=g'   listgsPPM063347  > listtgsPPM063347
!sed -e 's=tgsN2=stgsN2=g' listtgsPPM063347 > listetgsPPM063347

gsflat N20160913S0147 N20160913S0147_flat \
order=23 rawpath="rawdir$" bias="rawdir$N20160926S0036_bias.fits" fl_over-

gsreduce @objectlPPM063347 rawpath="rawdir$" bias="rawdir$N20160926S0036_bias.fits" \
flat="N20160913S0147_flat" fl_over-

gsreduce N20160913S0146.fits rawpath="rawdir$"  \
bias="rawdir$N20160926S0036_bias.fits" fl_fixpix- fl_flat- fl_over- 

gswavelength gsN20160913S0146.fits fl_inte-

gstransform gsN20160913S0146.fits wavtran=gsN20160913S0146.fits

gstransform @listgsPPM063347 wavtran=gsN20160913S0146.fits

gsskysub @listtgsPPM063347

gsextract stgsN20160913S0145.fits fl_inte-

imcopy estgsN20160913S0145.fits[sci,1] PPM063347

splot PPM063347

#rm estgs*.fits g*fits log.txt list* N*_flat.fits stgs*.fits tgs*.fits PPM063347.fits objectlPPM063347
