# MatRocket Single-Stage-Rocket Example
This is an example of how one might organize and get started with MatRocket. Clone this repo and run the ```setup.m```-script to automatically install all dependencies (Windows).

**NOTE!** This is just an example. You organize your projects however you want. This is just a guide to get you started.

## Summary:

* ```setup.m``` : [REQUIRES pip] Makes sure the proper dependencies are installed.
* ```main.m``` : This is where you run your simulations from.
* ```plots.m``` : Plots the results.
* ```latest_sim.mat``` : Autosave of your latest simulation.
* ```\lib``` : This is where you put your own functions and code.
* ```\Models``` : This is where you put your custom models.
* ```\Output``` : This is where the ```main.m```-script puts the output-files.
* ```\Rocket_source``` : All the startup-scripts and source-files/config-files for the rocket and its parts are found here.

```\Rocket_source\```

* ```reference_rocket.m``` : Rocket-initiation-script called upon by ```main.m```. Contains data on rocket.

* ```reference_rocket.csv``` : csv-file that can be queried by ```reference_rocket.m``` based on how it's set up. Usually used as a link between MATLAB and Blender, see https://github.com/spiggen/MatlabBlenderIO.

* ```reference_rocket.stl``` : stl-file containing mesh-information used by ```reference_rocket.m```

* ```source.blend``` : Blender-file that can be used to generate the ```reference_rocket.csv```-file if that approach is used *(convenient when handling rockets with subcomponents with their own coordinate-systems, etc)*. See see https://github.com/spiggen/MatlabBlenderIO.

```\Output\```

* ```flight.csv``` : csv-file for importing the simulation-results into Blender.

* ```launch_scenario.blend``` : A Blender-file where you might set up a scene for actually rendering the flight. See see https://github.com/spiggen/MatlabBlenderIO.

* ```reference_rocket.stl``` : A copy of the mesh *(has to be in the same directory as the flight.csv-file so that Blender can reach it)*.


## Extended:


### ```setup.m```

**NOTE!** Running ```setup.m``` requires **pip**, installation guide can be found here: https://pip.pypa.io/en/stable/installation/.

```setup.m``` checks if the proper libraries are installed, and if not, installs them. After that, it adds their filepaths to MATLAB so that the simulation can find all the proper files. It also adds any filepaths inside the project as well. **Modify to add additional folders to the MATLAB search-path**.


```setup.m``` is called inside ```main.m```, but can also be run on its own.



### ```main.m```

This is where you run your main simulation from, and the file that you run to perform your simulation. Customize this to change the simulation-profile.



