rocket_historians = {rocket_historian};

notick = false;
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
set(groot, 'defaultLegendInterpreter','latex');
fonts   = {'defaultUicontrolFontName', ...
           'defaultUitableFontName',   ...
           'defaultAxesFontName',      ...
           'defaultTextFontName',      ...
           'defaultUipanelFontName'
           };

for index = 1:numel(fonts)
set(groot,fonts{index}, "Times New Roman")
end



mag = @(v) sqrt(v(1,:).^2 + v(2,:).^2 + v(3,:).^2);


color = [0.5 0 1];
figlist = {};
figlist{end+1} = figure("name", "trajectory");
ax0 = axes();
ax0.NextPlot = "add";
title(ax0, "Trajectory");
xlabel(ax0, "x [m]"); ylabel(ax0, "y [m]"); zlabel(ax0, "z [m]");
grid(ax0, "on");
zlim(ax0, [0,14000])
xlim(ax0, [-1000,1000])
ylim(ax0, [-1000,1000])
axis(ax0, "equal");
view(ax0, 45,45)
if notick; xticks(ax0, []); yticks(ax0, []); zticks(ax0, []); end
drawnow

figlist{end+1} = figure("name", "trajectory subplots");


ax1 = subplot(2,2,1);
ax1.NextPlot = "add";
title(ax1, "Trajectory");
xlabel(ax1, "x [m]"); ylabel(ax1, "y [m]"); zlabel(ax1, "z [m]");
grid(ax1, "on");
zlim(ax1, [0,14000])
xlim(ax1, [-1000,1000])
ylim(ax1, [-1000,1000])
axis(ax1, "equal");
view(ax1, 45,45)
if notick; xticks(ax1, []); yticks(ax1, []); zticks(ax1, []); end
drawnow

ax2 = subplot(2,2,3);
ax2.NextPlot = "add";
title(ax2, "Wind-direction");
xlabel(ax2, "x [m/s]"); ylabel(ax2, "y [m/s]");
axis(ax2, "equal");

ax1xz = subplot(3,2,2);
ax1xz.NextPlot = "add";
title(ax1xz, "Trajectory");
xlabel(ax1xz, "x [m]"); ylabel(ax1xz, "z [m]");
grid(ax1xz, "on");
if notick; xticks(ax1xz, []); yticks(ax1xz, []); end

ax1yz = subplot(3,2,4);
ax1yz.NextPlot = "add";
title(ax1yz, "Trajectory");
xlabel(ax1yz, "y [m]"); ylabel(ax1yz, "z [m]");
grid(ax1yz, "on");
if notick; xticks(ax1yz, []); yticks(ax1yz, []); end

ax1xy = subplot(3,2,6);
ax1xy.NextPlot = "add";
title(ax1xy, "Trajectory");
xlabel(ax1xy, "x [m]"); ylabel(ax1xy, "y [m]");
grid(ax1xy, "on");
if notick; xticks(ax1xy, []); yticks(ax1xy, []); end

figlist{end+1} = figure("name", "altitude");

ax4 = subplot(1,2,2);
ax4.NextPlot = "add";
if notick; xticks(ax4, []); yticks(ax4, []); end
title(ax4, "air-density over time")
xlabel(ax4, "time [s]"); ylabel(ax4, "air-density kg/m^3")
grid(ax4, "on")


ax5 = subplot(1,2,1);
ax5.NextPlot = "add";
if notick; xticks(ax5, []); yticks(ax5, []); end
title(ax5, "altitude over time")
xlabel(ax5, "time [s]"); ylabel(ax5, "altitude [m]")
grid(ax5, "on")


figlist{end+1} = figure("name", "velocity");

ax6 = subplot(2,2,1);
ax6.NextPlot = "add";
if notick; xticks(ax6, []); yticks(ax6, []); end
title(ax6, "velocity over time")
xlabel(ax6, "time [s]"); ylabel(ax6, "velocity [m/s]")
grid(ax6, "on");
drawnow
ax6 = subplot(2,2,1);
ax6.NextPlot = "add";
if notick; xticks(ax6, []); yticks(ax6, []); end
title(ax6, "velocity over time")
xlabel(ax6, "time [s]"); ylabel(ax6, "velocity [m/s]")
grid(ax6, "on");
drawnow
ax6 = subplot(2,2,1);
ax6.NextPlot = "add";
if notick; xticks(ax6, []); yticks(ax6, []); end
title(ax6, "velocity over time")
xlabel(ax6, "time [s]"); ylabel(ax6, "velocity [m/s]")
grid(ax6, "on");
drawnow
ax6 = subplot(2,2,1);
ax6.NextPlot = "add";
if notick; xticks(ax6, []); yticks(ax6, []); end
title(ax6, "velocity over time")
xlabel(ax6, "time [s]"); ylabel(ax6, "velocity [m/s]")
grid(ax6, "on");
drawnow


ax7 = subplot(1,2,2);
ax7.NextPlot = "add";
if notick; xticks(ax7, []); yticks(ax7, []); end
title(ax7, "Mach over time")
xlabel(ax7, "time [s]"); ylabel(ax7, "Mach")
grid(ax7, "on");


figlist{end+1} = figure("name", "mass");

ax8 = subplot(1,2,1);
ax8.NextPlot = "add";
title(ax8, "Mass over time")
legend(ax8, "Total mass", "Tank mass", "Oxidizer mass")
xlabel(ax8, "time [s]"); ylabel(ax8, "mass [kg]")
grid(ax8, "on");

ax9 = subplot(1,2,2);
ax9.NextPlot = "add";

mesh     = stlread(my_rocket.mesh);
mesh_tri = triangulation(mesh.ConnectivityList, mesh.Points);
plt=trisurf(mesh_tri);
plt.EdgeColor = 'none';
plt.FaceColor = [0 0.4 0.4];
plt.FaceAlpha = 0.1;
material('dull');


light(ax9)


figlist{end+1} = figure("name", "forces");

ax10abs = subplot(4,2,1);
ax10abs.NextPlot = "add";
ax10eng = subplot(4,2,3);
ax10eng.NextPlot = "add";
ax10aer = subplot(4,2,5);
ax10aer.NextPlot = "add";
ax10gra = subplot(4,2,7);
ax10gra.NextPlot = "add";
title(ax10abs, "Force over time")
xlabel(ax10gra, "time [s]");
a = {ax10abs, ax10eng, ax10aer, ax10gra};
tit = {"Total", "Thrust", "Aerodynamic", "Gravity"};
for index = 1:4
ylabel(a{index}, "Force [N]")
if notick; xticks(a{index}, []); yticks(a{index}, []); end
grid(a{index},"on")
a{index}.Title.String = a{index}.Title.String+tit{index};
end
%%%%%%%%%%%%%%%  
ax11xy = subplot(6,2,2);
ax11xy.NextPlot = "add";
ax11xz = subplot(6,2,4);
ax11xz.NextPlot = "add";
ax11yx = subplot(6,2,6);
ax11yx.NextPlot = "add";
ax11yz = subplot(6,2,8);
ax11yz.NextPlot = "add";
ax11zx = subplot(6,2,10);
ax11zx.NextPlot = "add";
ax11zy = subplot(6,2,12);
ax11zy.NextPlot = "add";
title(ax11xy, "Aerodynamic lift   ")
xlabel(ax11zy, "time [s]");
a = {ax11xy, ax11xz, ax11yx, ax11yz, ax11zx, ax11zy};
tit = {"xy", "xz", "yx", "yz", "zx", "zy"};
for index = 1:6
ylabel(a{index}, "force [N]")
grid(a{index},"on")
if notick; xticks(a{index}, []); yticks(a{index}, []); end
a{index}.Title.String = a{index}.Title.String+tit{index};
end


figlist{end+1} = figure("name", "energy");
ax12abs = subplot(4,2,1);
ax12abs.NextPlot = "add";
ax12eng = subplot(4,2,3);
ax12eng.NextPlot = "add";
ax12aer = subplot(4,2,5);
ax12aer.NextPlot = "add";
ax12gra = subplot(4,2,7);
ax12gra.NextPlot = "add";
title(ax12abs, "dWork/dt")
xlabel(ax12gra, "time [s]");
a = {ax12abs, ax12eng, ax12aer, ax12gra};
tit = {"Total", "Thrust", "Aerodynamic", "Gravity"};
for index = 1:4
ylabel(a{index}, "power [W]")
grid(a{index},"on")
if notick; xticks(a{index}, []); yticks(a{index}, []); end
a{index}.Title.String = a{index}.Title.String+tit{index};
end


ax13 = subplot(1,2,2);
ax13.NextPlot = "add";
title(ax13, "Energy")
xlabel(ax13, "t [s]")
ylabel(ax13, "Energy [J]")
if notick; xticks(ax13, []); yticks(ax13, []); end

figlist{end+1} = figure("name", "rotation");
ax14x = subplot(4,2,1);
ax14x.NextPlot = "add";
ax14y = subplot(4,2,3);
ax14y.NextPlot = "add";
ax14z = subplot(4,2,5);
ax14z.NextPlot = "add";
ax14abs = subplot(4,2,7);
ax14abs.NextPlot = "add";
title(ax14x, "Rotation rate over time  ")
xlabel(ax14abs, "t [s]")

a = {ax14x, ax14y, ax14z, ax14abs};
tit = {"x", "y", "z", "Absolute"};
for index = 1:numel(a)
ylabel(a{index},"rotation-rate [Hz]")
if notick; xticks(a{index}, []); yticks(a{index}, []); end
a{index}.Title.String = a{index}.Title.String+tit{index};
end




figlist{end+1}=figure("name", "Solution");
ax16 = subplot(1,2,1);
semilogy(ax16,0,0)
ax16.NextPlot = "add";
if notick; xticks(ax16, []); end
xlabel(ax16, "time [s]"); ylabel(ax16, "dt [ms]");
grid(ax16, "on")



for i = 1:numel(rocket_historians)
    
rocket_historian = query_historian(rocket_historians{i}, 0:1/60:job.t_max);


disp("Printout:__________________________________")
disp("Max-altitude:")
disp(string(max(rocket_historian.position(3,:))) + " m")
disp("Max-velocity (groundspeed):")
disp(string(max(mag(rocket_historian.velocity))) + " m/s")
disp("Max-velocity (groundspeed):")
disp(string(max(mag(rocket_historian.velocity - rocket_historian.enviroment.wind_velocity))) + " m/s")


vectorplot(ax0, flatten(rocket_historian.position), "Color", color);
vectorplot(ax1, flatten(rocket_historian.position), "Color", color);
plot(ax1xz, flatten(rocket_historian.position(1,:,:)), flatten(rocket_historian.position(3,:,:)), "Color", color);
plot(ax1yz, flatten(rocket_historian.position(2,:,:)), flatten(rocket_historian.position(3,:,:)), "Color", color);
plot(ax1xy, flatten(rocket_historian.position(1,:,:)), flatten(rocket_historian.position(2,:,:)), "Color", color);
drawnow

quiver(ax2, 0,0,rocket_historian.enviroment.wind_velocity(1,1,1),rocket_historian.enviroment.wind_velocity(2,1,1), "Color", color);
drawnow

plot(ax4, rocket_historian.t, rocket_historian.enviroment.air_density, "Color", color);

drawnow


plot(ax5, rocket_historian.t, rocket_historian.position(3,:), "Color", color);

drawnow



plot(ax6, rocket_historian.t, mag(rocket_historian.velocity), "Color", color);
plot(ax6, rocket_historian.t, mag(rocket_historian.velocity - rocket_historian.enviroment.wind_velocity),"LineStyle", "--", "Color", color);



mach = @(v) v/343.2;



mag = @(v) sqrt(v(1,:).^2 + v(2,:).^2 + v(3,:).^2);

plot(ax7, rocket_historian.t, mach(mag(rocket_historian.velocity - rocket_historian.enviroment.wind_velocity)), "Color", color);
drawnow






plot(ax8, rocket_historian.t, rocket_historian.mass_absolute, "Color", color);
plot(ax8, rocket_historian.t, rocket_historian.tank.mass_absolute, "Color", color, "Linestyle", ":");
plot(ax8, rocket_historian.t, rocket_historian.tank.liquid.mass_absolute, "Color", color, "Linestyle", "--");

drawnow



center_of_mass_normal_basis = zeros(size(rocket_historian.center_of_mass_absolute));
for index = 1:size(center_of_mass_normal_basis,3); center_of_mass_normal_basis(:,:,index) = (rocket_historian.attitude(:,:,index)')*rocket_historian.center_of_mass_absolute(:,:,index);end

vectorplot(ax9, center_of_mass_normal_basis, 'LineWidth', 1.4, 'LineStyle', '-', 'Marker', '.');
vectorscatter(ax9, center_of_mass_normal_basis(:,1), 'filled');
vectorscatter(ax9, center_of_mass_normal_basis(:,end), 'filled');
vectorplot(ax9, rocket_historian.tank.center_of_mass_absolute, 'LineWidth', 1.4, 'LineStyle', '-', 'Marker', '.');
vectorscatter(ax9, rocket_historian.tank.center_of_mass_absolute(:,  1), 'd', 'filled');
vectorscatter(ax9, rocket_historian.tank.center_of_mass_absolute(:,end), 'd', 'filled');
title(ax9, "Center-of-mass over time")
axis(ax9, 'equal'); axis(ax9, 'padded'); 
xlabel(ax9, "x [m]"); ylabel(ax8, "y [m]"); ylabel(ax8, "z [m]")
legend(ax9, 'Mjollnir', 'Total center-of-mass', 'Total start',   'Total end', ...
                        'Tank center-of-mass' ,  'Tank start',   'Tank end')
grid(ax9, "on");
view(ax9, 45,45);
drawnow




plot(ax10abs, rocket_historian.t, mag(rocket_historian.force_absolute.vector), "Color", color)
plot(ax10aer, rocket_historian.t, mag(rocket_historian.forces.LiftForce.vector), "Color", color)
plot(ax10eng, rocket_historian.t, mag(rocket_historian.engine.force_absolute.vector), "Color", color)
plot(ax10gra, rocket_historian.t, mag(rocket_historian.forces.Gravity.vector), "Color", color)



spacing = 1e3;
plot(ax11xy, rocket_historian.t, flatten(rocket_historian.lift_force_tensor(1,2,:)), "Color", color);
plot(ax11xz, rocket_historian.t, flatten(rocket_historian.lift_force_tensor(1,3,:)), "Color", color);
plot(ax11yx, rocket_historian.t, flatten(rocket_historian.lift_force_tensor(2,1,:)), "Color", color);
plot(ax11yz, rocket_historian.t, flatten(rocket_historian.lift_force_tensor(2,3,:)), "Color", color);
plot(ax11zx, rocket_historian.t, flatten(rocket_historian.lift_force_tensor(3,1,:)), "Color", color);
plot(ax11zy, rocket_historian.t, flatten(rocket_historian.lift_force_tensor(3,2,:)), "Color", color);



plot(ax12abs, rocket_historian.t, mag(rocket_historian.velocity).*mag(rocket_historian.force_absolute.vector), "Color", color);
plot(ax12aer, rocket_historian.t, mag(rocket_historian.velocity).*mag(rocket_historian.forces.LiftForce.vector), "Color", color);
plot(ax12eng, rocket_historian.t, mag(rocket_historian.velocity).*mag(rocket_historian.engine.force_absolute.vector), "Color", color);
plot(ax12gra, rocket_historian.t, mag(rocket_historian.velocity).*mag(rocket_historian.forces.Gravity.vector), "Color", color);




plot  (ax13, rocket_historian.t, 0.5*(mag(rocket_historian.velocity).^2).*rocket_historian.mass_absolute + rocket_historian.mass_absolute.*rocket_historian.enviroment.g.*rocket_historian.position(3,:) , "Color", color)




rotation_rate = zeros(size(rocket_historian.rotation_rate));
for index = 1:size(rotation_rate,3); rotation_rate(:,:,index) = (rocket_historian.attitude(:,:,index)')*rocket_historian.rotation_rate(:,:,index);end
plot(ax14x,rocket_historian.t, rotation_rate(1,:), "Color", color)
plot(ax14y,rocket_historian.t, rotation_rate(2,:), "Color", color)
plot(ax14z,rocket_historian.t, rotation_rate(3,:), "Color", color)
plot(ax14abs,rocket_historian.t, mag(rotation_rate), "Color", color)






timesteps  = reshape(rocket_historians{i}.t, 1,numel(rocket_historians{i}.t));
dt         = timesteps(2:end) - timesteps(1:end-1);


semilogy(ax16, timesteps(1:end-4), dt(1:end-3)*1e3, "Color", color);

drawnow



end




for index = 1:numel(figlist)
saveas(figlist{index}, ".\Output\"+string(figlist{index}.Name)+erase(string(datetime()), ["-", ":"])+".png")
end