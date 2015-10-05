# 551inclass
_IJulia notebooks for EECS 453/551_

There are three ways to interact with the notebooks in this repository.

## 1. Use [Binder](http://mybinder.org/)

The time has come to push the button.

[![Binder](http://mybinder.org/badge.svg)](http://mybinder.org/repo/kersulis/551inclass)

Two things to keep in mind:

1. When you click `launch`, Binder spawns a new container for you. This container has access to all binaries and Julia packages required for the notebooks.

2. *Your Binder container will be deleted roughly one hour after you stop using it.* To save your work, download the current notebook with `File -> Download as -> IPython Notebook`. Later you can upload this notebook to continue working on it by going to `File -> Open` and clicking the `Upload` button to the upper-right.

## 2. Connect to [JuliaBox](http://juliabox.org/)

JuliaBox is a free service that allows you to interact with IJulia notebooks from Github, Google Drive, and your own computer. JuliaBox takes a few more steps to set up than Binder, but because it uses Google authentication, you can save your work and return later without needing to download and re-upload in-progress notebooks. Here's how to connect the EECS 551 notebooks with JuliaBox:

1. Visit [juliabox.org](https://juliabox.org/).

2. Select the **Sync** tab at the top of the page.

3. Paste https://github.com/kersulis/551inclass into the **Git Clone URL** field.

4. Leaving the **Branch** field alone, enter "551inclass" into the **JuliaBox Folder** field, then click **+** to load the repository into a folder named `551inclass`.

5. Now click on the **IJulia** tab at the top of the page. If you don't see a new folder called `551inclass`, refresh your browser (don't worry, no files will be lost).

6. Enter the `551inclass` folder and the `1-background-subtract` sub-folder, and click the notebook to open it in a new tab. The notebook is editable, and any Julia code cell should execute and show appropriate output.

Any notebook changes you make will be saved on your JuliaBox account; they will have no effect on the repository.

## 3. Install Jupyter on your own computer

Cloud computing is cool, but there are great advantages to having your own Jupyter installation.

* You don't need an internet connection to get work done.
* You don't need to worry about Binder and JuliaBox being unavailable. (They are public services and sometimes get overwhelmed.)
* You can customize to your liking. For instance, you can add a [MATLAB kernel](https://github.com/calysto/matlab_kernel) and use the notebook for all your Julia, Python, and MATLAB work.

To install Jupyter on your own machine:

1. Go [here](http://jupyter.readthedocs.org/en/latest/install.html) and follow the instructions. This will take roughly half an hour.

2. Go [here](http://julialang.org/downloads/) and download the most recent Julia 0.4 release candidate (rc4 at the time of this writing).

3. Now that Julia is installed, run it and issue the command `Pkg.install("IJulia")`. This will connect Jupyter to Julia and allow you to run the code in our IJulia notebooks.

4. To download the EECS 551 notebooks, go [here](https://github.com/kersulis/551inclass) and click `Download ZIP` on the right. Extract anywhere you like, then open a command prompt in that directory (Windows users: hold Shift and right-click the directory, then choose `Open command window here`) and run `jupyter notebook`.
