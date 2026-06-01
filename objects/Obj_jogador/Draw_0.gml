draw_self(); // desenhar a sprite do jogador

draw_self();

// Desenha a fala
if (texto_fala != "") {
    draw_set_halign(fa_center);
    draw_text_transformed(x, y - 70, texto_fala, 1, 1, 0);
}

// Desenha o Contador de Kits (apenas se tiver algum)

if (kits_na_mao > 0) {
    draw_set_halign(fa_center);
    draw_set_color(c_yellow);
    draw_text(x, y + 20, "Kits: " + string(kits_na_mao));
    draw_set_color(c_white);
}
draw_set_halign(fa_left);


