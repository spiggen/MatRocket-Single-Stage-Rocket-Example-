function rocket = simple_tank_model(rocket)
liquid_mass     = rocket.tank.liquid.mass      *(rocket.engine.burn_time - rocket.t)/rocket.engine.burn_time;
rocket.tank.liquid.mass       = liquid_mass    *( liquid_mass     > 0);

end