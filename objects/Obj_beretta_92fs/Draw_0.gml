
draw_self();

// cor do texto de debug
draw_set_color(c_white);

// Desenha a quantidade de caixas logo acima da posição da arma
draw_text(x - 20, y - 40, "Caixas: " + string(caixas_municao));