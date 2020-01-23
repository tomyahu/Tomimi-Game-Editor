vec4 effect( vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords ){
    float bar_amount = 5;

    float effect_y = floor((texture_coords.y + 0.5) * bar_amount)/bar_amount;
    effect_y *= 3.14;

    effect_y = sin(effect_y) + 0.2;

    return color + color * vec4(1,1,1,1)*effect_y;

}