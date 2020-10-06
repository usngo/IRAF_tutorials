---
# Gemini/IRAF data reduction

This repository contains IRAF scripts for data reduction of the Gemini Observatory instruments. The procedures were written using standard Gemini/IRAF tasks.

## Before you try the scripts:

- [x] Install Gemini/IRAF. Instructions and links to the various options can be found at the [US NGO Gemini Data Reduction Overview](http://ast.noao.edu/csdc/usngo/overview) webpage.

- [x] Each script comes with a `.list` file, which includes the url of all the `.fits` files needed for the reduction. You can copy/paste the urls on your browser or you can do a bulk download to the current directory using the `wget` package on your terminal:

   ```
   wget --input-file [name].list
   ```
   Note: `wget` comes pre-installed on most Linux distributions. It can be installed on macOS using [homebrew](https://brew.sh/):
   ```
   brew install wget
   ```
   
---
## Current scripts available:

### GMOS_LS_e2v.cl

GMOS longslit B600 spectroscopy of a star [PPM063347](http://simbad.u-strasbg.fr/simbad/sim-id?Ident=PPM063347). This dataset was observed in 2016 with GMOS North. At that point, GMOS still had the e2v CCD's. Dataset includes Bias, Flat, Arc Lamp, and Science frames (see [GMOS_LS_e2v.list](GMOS_LS_e2v.list)). Link to the [IRAF script](GMOS_LS_e2v.cl) or [direct download](https://raw.githubusercontent.com/usngo/IRAF/main/GMOS_LS_e2v.cl).

### GMOS_LS_hamamatsu.cl

GMOS longslit B600 spectroscopy of a star [HD166379](http://simbad.u-strasbg.fr/simbad/sim-id?Ident=HD166379). This dataset was observed in 2019 with GMOS North. At that point, GMOS already had the current Hamamatsu CCD's. Dataset includes Bias, Flat, Arc Lamp, and Science frames (see [GMOS_LS_hamamatsu.list](GMOS_LS_hamamatsu.list)). Link to the [IRAF script](GMOS_LS_hamamatsu.cl) or [direct download](https://raw.githubusercontent.com/usngo/IRAF/main/GMOS_LS_hamamatsu.cl).

---
## Additional resources

Data reduction with IRAF and Gemini/IRAF have been extensively covered over the years. The [US NGO Portal](http://ast.noao.edu/csdc/usngo) has documentation and links to several tutorials and cookbooks (including the [US NGO GMOS Cookbook](http://ast.noao.edu/sites/default/files/GMOS_Cookbook/)) on the instrument pages.

---
## Need help?

Problems, comments, suggestions, and/or need help with any of the above? You can contact the US NGO members via our [Portal](http://ast.noao.edu/csdc/usngo), [Twitter](https://twitter.com/usngo), or submit a pull request on github.

Follow us on Twitter! <a href="https://twitter.com/usngo" target="_blank"><img src="https://badgen.net/twitter/follow/usngo"></a>

---
