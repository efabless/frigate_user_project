To update user project wrapper template def, do the modification to [user_project_wrapper.gds](user_project_wrapper.gds) and then generate the def by running in this directory:
```
python3 ../../../scripts/gen_def_template.py -p "vdda1" -p "vdda2" -g "vssa1" -g "vssa2" --gds user_project_wrapper.gds -o user_project_wrapper.def --pdk_root $PDK_ROOT
```

`PDK_ROOT` should be set to the PDK root directory path