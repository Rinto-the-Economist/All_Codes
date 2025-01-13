This folder contains the codes to my answers to the Macroeconomics section of the Advanced Empirical Research Methods exam, as described in exam_MT_2024.pdf. The model follows Ayagari (1994) by solving a heterogenous agent model with uninsurable idiosyncratic income risks, with assets entering a non-homothetic utility function as an extention. The files are as follows:
- AERM_Macro.ipynb: a Jupyter notebook producing all plots and figures with the interpretations
- params.jl: the set of default parameters
- rouwenhorst.jl: an implementation of the Rouwenhorst (1995) method to discretise shocks from an AR(1) process
- sim_distn.jl: computes the stationary distribution of households per income-asset grid point
- solve.jl: the value function iteration solver
- results: a folder containing all graphs and figures
