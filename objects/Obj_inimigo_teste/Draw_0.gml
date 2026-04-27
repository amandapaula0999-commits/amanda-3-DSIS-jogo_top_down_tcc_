// Desenha a sombra
desenha_sombra();

// Desenha o inimigo

desenha_sprite();

// Barra de Vida 
if (hp > 0)
{
    // Fundo
    draw_rectangle_color(x_barra, y - 25, x_barra + largura_barra_total, y - 20, c_black, c_black, c_black, c_black, false);

    // Barra LARANJA 
    var _larg_laranja = (hp_secundario / hp_max) * largura_barra_total;
    draw_rectangle_color(x_barra, y - 25, x_barra + _larg_laranja, y - 20, c_orange, c_orange, c_orange, c_orange, false);

    // Barra VERMELHA
    var _larg_vermelha = (hp / hp_max) * largura_barra_total;
    draw_rectangle_color(x_barra, y - 25, x_barra + _larg_vermelha, y - 20, c_red, c_red, c_red, c_red, false);

    // Borda
    draw_rectangle_color(x_barra, y - 25, x_barra + largura_barra_total, y - 20, c_white, c_white, c_white, c_white, true);
}


// Campo de visão
if (estado != scr_inimigo_persegue)
{
    draw_set_alpha(0.2);
    campo_visao(larg_visao, sprite_height); 
    draw_set_alpha(1);
}


