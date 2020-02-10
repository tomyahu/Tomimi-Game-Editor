vec4 effect( vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords ){
    float bar_amount = 3;

    float effect_y = 1 - floor((texture_coords.y/3 + 0.05) * bar_amount)/bar_amount;

    return color + color * vec4(effect_y,effect_y,effect_y,1);

}